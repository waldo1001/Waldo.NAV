$Name = 'WaldoNAVPad'
$DEVInstance = 'WaldoNAVPad_DEV'
$ORIGInstance = 'WaldoNAVPad_ORIG'
$WorkingFolder = 'C:\_Workingfolder\WaldoNAVPad'
$BackupPath = 'C:\Users\Administrator\Dropbox\GitHub\Waldo.NAV\WaldoNAVPad'


$CreatedITems = Backup-NAVApplicationObjects `                    -BackupOption OnlyModified `                    -ServerInstance $DEVInstance `                    -BackupPath $BackupPath `                    -Name $Name `                    -NavAppOriginalServerInstance $ORIGInstance `                    -NavAppWorkingFolder $WorkingFolder 


start $BackupPath