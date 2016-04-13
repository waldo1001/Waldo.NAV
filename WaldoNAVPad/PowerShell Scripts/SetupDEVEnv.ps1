Get-NAVServerInstance | where ServerInstance -like '*Waldo*' | Remove-NAVEnvironment -Force

$ServerInstance = get-navserverinstance -ServerInstance DynamicsNAV90
$ServerInstance | Copy-NAVEnvironment -ToServerInstance 'WaldoNAVPad_DEV'
$ServerInstance | Copy-NAVEnvironment -ToServerInstance 'WaldoNAVPad_ORIG'

New-NAVWebServerInstance -ClientServicesPort 7046 -ServerInstance 'WaldoNAVPad_DEV' -Server localhost -WebServerInstance 'WaldoNAVPad_DEV' 