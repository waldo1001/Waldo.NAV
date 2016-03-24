$Name = 'RegExClass'
$DEVInstance = 'Regex_DEV'
$ORIGInstance = 'Regex_ORIG'
$WorkingFolder = 'C:\_Workingfolder\RegExClass'
$BackupPath = 'C:\Users\Administrator\Dropbox\GitHub\Waldo.NAV\RegExClass'


$CreatedITems = Backup-NAVApplicationObjects `                    -BackupOption OnlyModified `                    -ServerInstance $DEVInstance `                    -BackupPath $BackupPath `                    -Name $Name `                    -NavAppOriginalServerInstance $ORIGInstance `                    -NavAppWorkingFolder $WorkingFolder 


start $BackupPath