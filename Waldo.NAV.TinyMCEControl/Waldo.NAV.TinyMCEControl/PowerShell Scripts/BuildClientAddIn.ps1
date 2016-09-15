# Import settings
. (Join-Path $PSScriptRoot '_Settings.ps1') -ErrorAction Stop

#Update Resources
$ResourceFile = (Join-Path $ProjectFolder 'Resources.zip')
if (Test-Path $ResourceFile){Remove-Item -Path $ResourceFile -Force}

$ResourceItems = @()
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'Manifest.xml') -ErrorAction Stop
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'Script') -ErrorAction SilentlyContinue
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'StyleSheet') -ErrorAction SilentlyContinue
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'Image') -ErrorAction SilentlyContinue

$ResourceItems | 
    Create-ZipFileFromPipedItems `        -zipfilename $ResourceFile

$MyAddIn = 
    Get-NAVAddIn `        -ServerInstance $ServerInstance `        -AddInName $AddInName `        -ErrorAction SilentlyContinue

if (!($MyAddIn)){
    New-NAVAddIn `        -AddInName $AddInName `        -PublicKeyToken $PublicKeyToken `        -Category JavaScriptControlAddIn `        -ServerInstance $ServerInstance

    $MyAddIn = 
        Get-NAVAddIn `            -ServerInstance $ServerInstance `            -AddInName $AddInName
}


$MyAddin |
    Set-NAVAddIn `        -ResourceFile $ResourceFile `        -ServerInstance $ServerInstance