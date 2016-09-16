# Import settings
. (Join-Path $PSScriptRoot '_Settings.ps1') -ErrorAction Stop

#Update Resources
$ResourceFile = (Join-Path $ProjectFolder 'Resources.zip')
$ExtensionResourceFile = (Join-Path $ProjectFolder 'ExtensionResources.zip')
if (Test-Path $ResourceFile){Remove-Item -Path $ResourceFile -Force}

#Resource for AddIn in NAV
$ResourceItems = @()
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'Manifest.xml') -ErrorAction Stop
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'Script') -ErrorAction SilentlyContinue
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'StyleSheet') -ErrorAction SilentlyContinue
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'Image') -ErrorAction SilentlyContinue
$ResourceItems | 
    Create-ZipFileFromPipedItems `        -zipfilename $ResourceFile

#Resource for Extensions
$ExtensionItems = @()
$ExtensionItems += $ResourceItems
$ExtensionItems += Get-ChildItem (join-path $ProjectFolder 'bin' ) -Recurse -Filter '*.dll' -Exclude '*Microsoft*'
$ExtensionItems | 
    Create-ZipFileFromPipedItems `        -zipfilename $ExtensionResourceFile


$MyAddIn = 
    Get-NAVAddIn `        -ServerInstance $ServerInstance `        -AddInName $AddInName `        -ErrorAction SilentlyContinue

if (!($MyAddIn)){
    New-NAVAddIn `        -AddInName $AddInName `        -PublicKeyToken $PublicKeyToken `        -Category JavaScriptControlAddIn `        -ServerInstance $ServerInstance

    $MyAddIn = 
        Get-NAVAddIn `            -ServerInstance $ServerInstance `            -AddInName $AddInName
}


$MyAddin |
    Set-NAVAddIn `        -ResourceFile $ResourceFile `        -ServerInstance $ServerInstance