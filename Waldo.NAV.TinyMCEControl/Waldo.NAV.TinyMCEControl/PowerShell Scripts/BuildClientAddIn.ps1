﻿$ServerInstance = 'WaldoNAVPad_DEV'
$AddInName = 'Waldo TinyMCE Control for NAV'
$ProjectFolder = 'C:\Users\Administrator\Dropbox\GitHub\Waldo.NAV\Waldo.NAV.TinyMCEControl\Waldo.NAV.TinyMCEControl'
#$Dll = Join-Path $ProjectFolder '\bin\Debug\Waldo.NAV.TinyMCEControl.dll' 

Import-Module "C:\Program Files (x86)\Microsoft Dynamics NAV\90\RoleTailored Client\Microsoft.Dynamics.Nav.Model.Tools.psd1" -WarningAction SilentlyContinue | out-null
Import-Module "C:\Program Files\Microsoft Dynamics NAV\90\Service\NavAdminTool.ps1" -WarningAction SilentlyContinue | Out-Null
#Import-Module "${env:ProgramFiles(x86)}\Microsoft Dynamics NAV\90\RoleTailored Client\Microsoft.Dynamics.Nav.Apps.Tools.psd1" -WarningAction SilentlyContinue | Out-Null

#Update Resources
$ResourceFile = (Join-Path $ProjectFolder 'Resources.zip')
if (Test-Path $ResourceFile){Remove-Item -Path $ResourceFile -Force}

$ResourceItems = @()
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'Manifest.xml') -ErrorAction Stop
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'Script') -ErrorAction SilentlyContinue
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'StyleSheet') -ErrorAction SilentlyContinue
$ResourceItems += Get-Item (Join-Path $ProjectFolder 'Image') -ErrorAction SilentlyContinue
$ResourceItems | 
    Create-ZipFileFromPipedItems `

$MyAddIn = 
    Get-NAVAddIn `

if (!($MyAddIn)){
    New-NAVAddIn `

    $MyAddIn = 
        Get-NAVAddIn `
}


$MyAddin |
    Set-NAVAddIn `