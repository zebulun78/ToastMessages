# https://deploymentresearch.com/Research/Post/650/Command-line-options-for-Software-Center
# https://github.com/Windos/BurntToast/tree/master/Help
# https://www.youtube.com/watch?v=qAnKMu2v3Bk
# https://smsagent.blog/2018/06/15/using-windows-10-toast-notifications-with-configmgr-application-deployments/

$Text1 = New-BTText -Text 'Hello There!'
$Text2 = New-BTText -Text 'This is a snippet of information that you can give to the user. Please make this brief.'

$Image = New-BTImage -Source "https://github.com/zebulun78/ToastMessages/raw/master/DeploymentGeek.ico" -AppLogoOverride -Crop None

$Binding1 = New-BTBinding -Children $Text1, $Text2 -AppLogoOverride $Image

$Visual1 = New-BTVisual -BindingGeneric $Binding1

$Button1 = New-BTButton -Content 'Go!' -Arguments 'http://deploymentgeek.com' -ActivationType Protocol
$Button2 = New-BTButton -Dismiss
$Button3 = New-BTButton -Snooze

$Action1 = New-BTAction -Buttons $Button1, $Button2, $Button3

$Content1 = New-BTContent -Visual $Visual1 -Duration Long -Actions $Action1

Submit-BTNotification -Content $Content1



