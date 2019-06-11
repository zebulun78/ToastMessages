# https://deploymentresearch.com/Research/Post/650/Command-line-options-for-Software-Center
# https://github.com/Windos/BurntToast/tree/master/Help
# https://www.youtube.com/watch?v=qAnKMu2v3Bk
# https://smsagent.blog/2018/06/15/using-windows-10-toast-notifications-with-configmgr-application-deployments/

$Text1 = New-BTText -Text 'Windows Updates'
$Text2 = New-BTText -Text 'There are updates available for your workstation.  Please install them as soon as possible.'

$Image = New-BTImage -Source 'C:\Temp\DeploymentGeek.png' -AppLogoOverride -Crop None

$Binding1 = New-BTBinding -Children $Text1, $Text2 -AppLogoOverride $Image

$Visual1 = New-BTVisual -BindingGeneric $Binding1

$Button1 = New-BTButton -Content 'Install' -Arguments 'https://deploymentgeek.com' -ActivationType Protocol
$Button2 = New-BTButton -Dismiss
$Button3 = New-BTButton -Snooze

$Action1 = New-BTAction -Buttons $Button1, $Button2, $Button3

$Content1 = New-BTContent -Visual $Visual1 -Duration Long -Actions $Action1

Submit-BTNotification -Content $Content1 -AppId 'DeploymentGeek.com!DeploymentGeek'


