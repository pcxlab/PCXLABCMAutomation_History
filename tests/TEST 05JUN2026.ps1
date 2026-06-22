New-CMApplication `
    -Name "APP Igor Pavlov 7zip 26.0.0" `
    -Publisher "Igor Pavlov" `
    -SoftwareVersion "26.0.0" `
    -Description "7zip" `
    -OptionalReference "Reference" `
    -ReleaseDate (Get-Date) `
    -AutoInstall $true `
    -LocalizedName "APP Igor Pavlov 7zip 26.0.0" `
    -UserDocumentation "https://www.pcxlab.com/content" `
    -LinkText "For more information" `
    -LocalizedDescription "7zip" `
    -Keyword "application" `
    -PrivacyUrl "https://www.pcxlab.com/privacy" `
    -IsFeatured $true



$PackageName = "PKG Igor Pavlov 7zip 26.0.0"

Get-Help Get-CMFolder -Full

Get-Item "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.0"

Get-Item "PS1:\Package\Mphasis Application Deployment\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.0"
Get-Item "PS1:\Package\Application Installation\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.0"
Get-Item "PS1:\Package\Application Installation\Igor Pavlov"

Get-CMFolder -Name "PKG Igor Pavlov 7zip 26.0.0"
Get-CMFolder -Name "7zip"

Get-CMPackage -Name "PKG Igor Pavlov 7zip 26.0.0" | Select-Object *

Get-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.0*"

Get-Command Remove-CMFolder -Syntax

#############################################
Get-CMFolder -Name "PKG Igor Pavlov 7zip 26.0.0" |
Select-Object Name, ObjectTypeName, ContainerNodeID

$Folder = Get-CMFolder -Name "PKG Igor Pavlov 7zip 26.0.0"

Remove-CMFolder -InputObject $Folder -WhatIf

Get-CMFolder -Name "7zip" |
Where-Object ObjectTypeName -eq 'SMS_Package'

Get-CMFolder -Name "7zip" |
Where-Object ObjectTypeName -eq 'SMS_Package' |
Select-Object *

Remove-CMFolder -Name "7zip"

Get-CMFolder -Name '7zip'

$PackageFolder = Get-CMFolder -Name $Product |
Where-Object ObjectTypeName -eq 'SMS_Package'

    

#############################################

Get-CMDeviceCollection |
Where-Object Name -like "$PackageName*"

Get-CMDeviceCollection |
Where-Object {
    $_.Name -like "$PackageName *"
} |
Select-Object Name

Get-Command Get-CMFolder -Syntax

Get-CMFolder -FolderType DeviceCollection |
Select-Object -First 3 *

Get-CMFolder -FolderType Package |
Select-Object -First 3 *

Get-CMFolder -FolderType DeviceCollection |
Where-Object Name -eq "PKG Igor Pavlov 7zip 26.0.0" |
Select-Object Name, FolderPath

Get-CMFolder -FolderType Package |
Where-Object Name -eq "PKG Igor Pavlov 7zip 26.0.0" |
Select-Object Name, FolderPath



Clear-Host
Remove-Module PCXLab.SCCM -Force
C:
Import-Module .\src\Modules\PCXLab.SCCM

Connect-PCXCMSite

$CleanupInfo = Get-PCXCMPackageCleanupInfo -PackageName "PKG Igor Pavlov 7zip 26.0.0"

$CleanupInfo.PackageFolderID

Remove-PCXCMPackageFolder -CleanupInfo $CleanupInfo -WhatIf

Remove-PCXCMDeviceCollectionFolder -CleanupInfo $CleanupInfo -WhatIf

$CleanupInfo = Get-PCXCMPackageCleanupInfo -PackageName "PKG Igor Pavlov 7zip 26.0.0"

$CleanupInfo.PackageFolderID


Remove-PCXCMPackage -CleanupInfo $CleanupInfo -WhatIf

$CleanupInfo = Get-PCXCMPackageCleanupInfo `
    -PackageName "PKG Igor Pavlov 7zip 26.0.0"

$CleanupInfo

Remove-PCXCMPackageFolder $CleanupInfo
Remove-PCXCMPackage $CleanupInfo

Get-CMPackage -Name "PKG Igor Pavlov 7zip 26.0.0"

Get-CMFolder -Name "7zip" | Select-Object Name, ObjectTypeName, ContainerNodeID

Get-Command -Module PCXLab.SCCM

Connect-PCXCMSite

Remove-PCXCMPackage -CleanupInfo $CleanupInfo -WhatIf


$CleanupInfo.Collections |
Select-Object Name, CollectionID

Remove-PCXCMDeviceCollection `
    -CleanupInfo $CleanupInfo `
    -WhatIf

Reset-PCXCMConnection

Ensure-PCXCMConnection



$CleanupInfo = Get-PCXCMPackageCleanupInfo `
    -PackageName "PKG Igor Pavlov 7zip 26.0.0"

Remove-PCXCMDeviceCollection `
    -CleanupInfo $CleanupInfo `
    -WhatIf

Remove-PCXCMDeviceCollection `
    -CleanupInfo $CleanupInfo

    
$CleanupInfo = Get-PCXCMPackageCleanupInfo `
    -PackageName "PKG Igor Pavlov 7zip 26.0.0"

$CleanupInfo = Get-PCXCMPackageCleanupInfo `
    -PackageName "PKG Igor Pavlov 7zip 26.0.0"

$CleanupInfo | Format-List *

$CleanupInfo.Collections | Select-Object Name, CollectionID

$CleanupInfo.CollectionFolder | Select-Object Name, ContainerNodeID, ObjectTypeName

Get-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.0*"


Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0"

Create-PCXCMPackage -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1"


$CleanupInfo = Get-PCXCMPackageCleanupInfo -PackageName "PKG Igor Pavlov 7zip 26.0.0"

$CleanupInfo.PackageFolderID
$CleanupInfo.Collections.Count


Remove-PCXCMPackageFolder -CleanupInfo $CleanupInfo -WhatIf

Remove-PCXCMPackageFolder -CleanupInfo $CleanupInfo

Cleanup-PCXCMPackage

Get-CMFolder -Id 16782897 | Select-Object Name, IsEmpty, ObjectTypeName

Get-CMFolder -Id 16782897 | Select-Object Name, IsEmpty, ObjectTypeName

Get-CMFolder -Id 16782898 | Select-Object Name, IsEmpty, ObjectTypeName

Get-CMFolder -Name "7zip" | Format-List *

Get-CMFolder -Name "7zip" | Select-Object Name, ObjectTypeName, ContainerNodeID, ParentContainerNodeID, IsEmpty

Get-CMFolderItem -FolderId 16782897
Get-CMFolder -Id 16782897 | Select-Object *
Get-CMPackage -Fast | Where-Object PackageID -eq 'PS100173'



Clear-Host
Remove-Module PCXLab.SCCM -Force
C:
Import-Module .\src\Modules\PCXLab.SCCM

Connect-PCXCMSite


Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.0" -WhatIf

Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.0"

Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.0"

Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.0"

Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.0 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.0 [EXCLUDE]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.0 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.0 [AVAILABLE]" -Force
Remove-CMPackage -Name "PKG Igor Pavlov 7zip 26.0.0" -Force
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.0" -Force 

Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.0"
Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.1"

#Cleanup
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.0 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.0 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.0 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.0 [AVAILABLE]" -Force
Remove-CMApplication -Name "APP Igor Pavlov 7zip 26.0.0" -Force



New-PCXCMApplication -Name "7-Zip" -Description "File archiver utility" -Publisher "Igor Pavlov" -SoftwareVersion "26.0.0" -ReleaseDate "2024-06-01"
New-PCXCMApplication -Name "7-Zip" -Description "File archiver utility" -Publisher "Igor Pavlov" -SoftwareVersion "26.0.0" -ReleaseDate "2024-06-01" -Iconlocationfile "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0\7ZipIcon.png"
New-PCXCMApplication -Name "7-Zip" -Description "File archiver utility" -Publisher "Igor Pavlov" -SoftwareVersion "26.0.0" -ReleaseDate "2024-06-01" -Iconlocationfile "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0\7ZipIcon.png"

Get-CMApplication -Name "APP Igor Pavlov 7zip 26.0.1" | Select-Object LocalizedDisplayName, CI_ID, ModelName

Get-Command Remove-CMApplication -Syntax

Get-PCXCMApplicationCleanupInfo -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

Cleanup-PCXCMApplicationDeployment -ApplicationName "APP Igor Pavlov 7zip 26.0.1" -WhatIf

Cleanup-PCXCMApplicationDeployment -ApplicationName "APP Igor Pavlov 7zip 26.0.1" -WhatIf
Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.0" -WhatIf
Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.1" -WhatIf


Get-CMApplication -Name "APP Igor Pavlov 7zip 26.0.1"

Get-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1*"

Get-CMDeployment -SoftwareName "APP Igor Pavlov 7zip 26.0.1"

Clear-Host
Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM

Cleanup-PCXCMApplicationDeployment `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1" `
    -WhatIf

$Info = Get-PCXCMApplicationCleanupInfo `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

$Info | Select-Object *

$Info.Deployments



$Info = Get-PCXCMApplicationCleanupInfo `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

$Info.Deployments

Cleanup-PCXCMApplicationDeployment `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1" `
    -WhatIf

Get-Command Get-CMApplicationDeployment -Syntax

Get-CMApplicationDeployment -Name "APP Igor Pavlov 7zip 26.0.1"

$Info = Get-PCXCMApplicationCleanupInfo `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

$Info.Deployments


Cleanup-PCXCMApplicationDeployment `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1" `
    -WhatIf


Cleanup-PCXCMApplicationDeployment `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -WhatIf


$Info = Get-PCXCMApplicationCleanupInfo `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

$Info | Get-Member


$Info = Get-PCXCMApplicationCleanupInfo `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

Remove-PCXCMApplicationDeployment `
    -CleanupInfo $Info `
    -WhatIf

(Get-Command Cleanup-PCXCMApplicationDeployment).ScriptBlock

Get-Content `
    "C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0\Public\Applications\Cleanup-PCXCMApplicationDeployment.ps1"


Cleanup-PCXCMApplicationDeployment `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1" `
    -WhatIf

Cleanup-PCXCMApplicationDeployment `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1"


$Application = Get-CMApplication -Name "APP Igor Pavlov 7zip 26.0.1"
Get-CMApplicationDeployment -Name $Application.LocalizedDisplayName

Get-CMApplicationDeployment -Name $Application.LocalizedDisplayName

$Info = Get-PCXCMApplicationCleanupInfo -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

$Info.Deployments | Select CollectionName, AssignmentID

(Get-Command Remove-CMApplicationDeployment).Syntax

Get-Command Remove-CMApplicationDeployment 
Get-Help Remove-CMApplicationDeployment 



Clear-Host
C:
Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM

Cleanup-PCXCMApplicationDeployment -ApplicationName "APP Igor Pavlov 7zip 26.0.1" -WhatIf

Cleanup-PCXCMApplicationDeployment -ApplicationName "APP Igor Pavlov 7zip 26.0.1" 

$Info = Get-PCXCMApplicationCleanupInfo -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

$Info.Deployments | Format-Table CollectionName, AssignmentID

$Info.Deployments | Select CollectionName, AssignmentID


Cleanup-PCXCMApplicationDeployment -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

Get-CMApplicationDeployment -Name $Application.LocalizedDisplayName

$Deployment = Get-CMApplicationDeployment -Name "APP Igor Pavlov 7zip 26.0.1" | Select-Object -First 1

$Deployment | Get-Member

$Deployment | Select-Object *

$Deployment = Get-CMApplicationDeployment -Name "APP Igor Pavlov 7zip 26.0.1" | Select-Object -First 1

Remove-CMApplicationDeployment -InputObject $Deployment -WhatIf


Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Cleanup-PCXCMApplicationDeployment -ApplicationName "APP Igor Pavlov 7zip 26.0.1" -WhatIf

Cleanup-PCXCMApplicationDeployment `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

    Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.0"
    Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.1"
    Cleanup-PCXCMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.2"



Cleanup-PCXCMApplicationDeployment `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0"

Cleanup-PCXCMApplicationDeployment `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.2"