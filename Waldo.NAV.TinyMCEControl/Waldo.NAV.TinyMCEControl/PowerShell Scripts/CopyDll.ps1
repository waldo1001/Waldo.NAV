$ProjectFolder = 'C:\Users\Administrator\Dropbox\GitHub\Waldo.NAV\Waldo.NAV.TinyMCEControl\Waldo.NAV.TinyMCEControl'
$Dll = Join-Path $ProjectFolder '\bin\Debug\Waldo.NAV.TinyMCEControl.dll'

if (!($NavIde)){
    Write-Error 'Please load the model tools'
    break
}

$finsql = Get-Item $NavIde
$AddInFolder = join-path $finsql.Directory 'Add-ins'

Copy-Item -Path $Dll -Destination $AddInFolder
start $AddInFolder