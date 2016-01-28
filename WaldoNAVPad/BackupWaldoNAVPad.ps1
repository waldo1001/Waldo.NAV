$Name = 'WaldoNAVPad'
$DEVInstance = 'WaldoNAVPad_DEV'
$ORIGInstance = 'DynamicsNAV90'
$WorkingFolder = 'C:\_Workingfolder\WaldoNAVPad'
$BackupPath = 'C:\Users\Administrator\Dropbox\GitHub\Waldo.NAV\WaldoNAVPad'


$CreatedITems = Backup-NAVApplicationObjects `                    -BackupOption OnlyModified `                    -ServerInstance $DEVInstance `                    -BackupPath $BackupPath `                    -Name $Name `                    -NavAppOriginalServerInstance $ORIGInstance `                    -NavAppWorkingFolder $WorkingFolder 

$CreatedITems |where Name -like '*.txt' | Split-NAVApplicationObjectFile -Destination "$BackupPath\Split\" -Force

start $BackupPath