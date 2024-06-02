param(
[string]$serverName,
[string]$appPoolName,
[string]$username,
[string]$password
)
$securePassword=ConvertTo-SecureString
$password -AsPlainText -Force
$credential =New-Object
System.Management.Automation.PSCredential ($username, $securePassword)

Invoke-Command -ComputerName
$serverName -Credential $credential
-ScriptBlock {
   param ($appPool)
Import-Module WebAdministration
Restart-WebAppPool -Name &appPool
} -ArgumentList $appPoolName