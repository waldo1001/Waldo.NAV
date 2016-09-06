# Import settings
. (Join-Path $PSScriptRoot '_Settings.ps1') -ErrorAction Stop

$CopyFromServerInstance = Get-NAVServerInstance $DefaultServerInstance -ErrorAction Stop

$Backupfile = $CopyFromServerInstance | Backup-NAVDatabase -ErrorAction Stop

$CopyFromServerInstance | Enable-NAVServerInstancePortSharing

if (-not(get-navserverinstance $OriginalServerInstance)){
    New-NAVEnvironment -ServerInstance $OriginalServerInstance -BackupFile $Backupfile -ErrorAction Stop -EnablePortSharing -LicenseFile $License
}
if (-not(get-navserverinstance $TargetServerInstance)){
    New-NAVEnvironment -ServerInstance $TargetServerInstance -BackupFile $Backupfile -ErrorAction Stop -EnablePortSharing -LicenseFile $License
}
New-NAVEnvironment -ServerInstance $ModifiedServerInstance -BackupFile $Backupfile -ErrorAction Stop -EnablePortSharing -LicenseFile $License

#ConvertTo-NAVMultiTenantEnvironment -ServerInstance $TargetServerInstance -MainTenantId $TargetTenant

$Backupfile | Remove-Item -Force

Get-NAVServerInstanceDetails | where serverinstance -match $AppName | select ServerInstance, DatabaseName, ClientServicesPort, State | ft -AutoSize
