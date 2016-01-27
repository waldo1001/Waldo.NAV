$Name = 'WaldoNAVPad'
$BackupPath = 'C:\Users\Administrator\Dropbox\GitHub\Waldo.NAV\WaldoNAVPad'


$CreatedITems = Backup-NAVApplicationObjects -BackupOption OnlyModified -ServerInstance DynamicsNAV90 -BackupPath $BackupPath -Name $Name

$CreatedITems |where Name -like '*.txt' | Split-NAVApplicationObjectFile -Destination "$BackupPath\Split\"

start $BackupPath