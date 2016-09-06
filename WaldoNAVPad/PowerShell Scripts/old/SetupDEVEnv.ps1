Get-NAVServerInstance | where ServerInstance -like '*Waldo*' | Remove-NAVEnvironment -Force

$ServerInstance = get-navserverinstance -ServerInstance DynamicsNAV90
$ServerInstance | Copy-NAVEnvironment -ToServerInstance 'WaldoNAVPad_DEV'
$ServerInstance | Copy-NAVEnvironment -ToServerInstance 'WaldoNAVPad_ORIG'

New-NAVWebServerInstance -ClientServicesPort 7046 -ServerInstance 'WaldoNAVPad_DEV' -Server localhost -WebServerInstance 'WaldoNAVPad_DEV' 

Set-NAVServerConfiguration -ServerInstance 'WaldoNAVPad_DEV' -KeyName ClientServicesMaxItemsInObjectGraph -KeyValue 5120 
Set-NAVServerConfiguration -ServerInstance 'WaldoNAVPad_DEV' -KeyName MetadataProviderCacheSize -KeyValue 1500 
Set-NAVServerInstance -ServerInstance 'WaldoNAVPad_DEV' -Restart

Start-NAVApplicationObjectInWindowsClient -ServerInstance 'WaldoNAVPad_DEV' -ObjectType Page -ObjectID 50010
Start-NAVApplicationObjectInWindowsClient -ServerInstance 'WaldoNAVPad_DEV' -ObjectType Page -ObjectID 82100


$DEVDetails | Get-Member -MemberType NoteProperty | where Name -like '*Size*'
$DEVDetails | Get-Member -MemberType NoteProperty | where Name -like '*Max*'
