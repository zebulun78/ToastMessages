# https://deploymentresearch.com/Research/Post/650/Command-line-options-for-Software-Center
# https://github.com/Windos/BurntToast/tree/master/Help
# https://www.youtube.com/watch?v=qAnKMu2v3Bk
# https://smsagent.blog/2018/06/15/using-windows-10-toast-notifications-with-configmgr-application-deployments/

$Text1 = New-BTText -Text 'Hello There!'
$Text2 = New-BTText -Text 'This is a snippet of information that you can give to the user. Please make this brief.'

$5Min = New-BTSelectionBoxItem -Id 5 -Content '5 minutes'
$10Min = New-BTSelectionBoxItem -Id 10 -Content '10 minutes'
$1Hour = New-BTSelectionBoxItem -Id 60 -Content '1 hour'
$4Hour = New-BTSelectionBoxItem -Id 240 -Content '4 hours'
$1Day = New-BTSelectionBoxItem -Id 1440 -Content '1 day'

$SnoozeOptions = $5Min, $10Min, $1Hour, $4Hour, $1Day
$SnoozeSelectionBox = New-BTInput -Id 'SnoozeTime' -DefaultSelectionBoxItemId 10 -Items $SnoozeOptions -Title "Snooze for:"

$HeroImage = New-BTImage -Source "$PSScriptRoot\Images\HeroImage1.png" -HeroImage
$LogoImage = New-BTImage -Source "$PSScriptRoot\Images\DeploymentGeek.png" -AppLogoOverride -Crop Circle

$Binding1 = New-BTBinding -Children $Text1,$Text2 -AppLogoOverride $LogoImage -HeroImage $HeroImage

$Visual1 = New-BTVisual -BindingGeneric $Binding1

$Button1 = New-BTButton -Content 'Go!' -Arguments 'http://deploymentgeek.com' -ActivationType Protocol
$Button2 = New-BTButton -Snooze -Id 'SnoozeTime'
$Button3 = New-BTButton -Dismiss

$Action1 = New-BTAction -Buttons $Button1,$Button2,$Button3 -Inputs $SnoozeSelectionBox

$Content1 = New-BTContent -Visual $Visual1 -Duration Long -Actions $Action1

Submit-BTNotification -Content $Content1



