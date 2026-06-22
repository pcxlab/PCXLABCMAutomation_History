Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0"

Cleanup-PCXCMApplicationDeployment -ApplicationName "APP Tim Kosse FileZila 5.12.3.0"
Cleanup-PCXCMApplicationDeployment -ApplicationName "APP Tim Kosse FileZila 3.69.6.0"

Cleanup-PCXCMApplicationDeployment -ApplicationName "APP Igor Pavlov 7zip 26.0.0"
Cleanup-PCXCMApplicationDeployment -ApplicationName "APP Igor Pavlov 7zip 26.0.1"

$APP = "APP Tim Kosse FileZila 3.69.6.0"
Remove-CMDeviceCollection -Name "APP $APP [INSTALL]" -Force
Remove-CMDeviceCollection -Name "APP $APP [EXCLUDE]" -Force
Remove-CMDeviceCollection -Name "APP $APP [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "APP $APP [AVAILABLE]" -Force
Remove-CMApplication -Name "APP $APP" -Force

Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.0" -Force 
Remove-CMFolder -FolderPath "PS1:\Application\Application Installation\Igor Pavlov\7zip" -Force # without end slash it works

$PKG = "Igor Pavlov 7zip 26.0.1"
Remove-CMDeviceCollection -Name "PKG $PKG [INSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG $PKG [EXCLUDE]" -Force
Remove-CMDeviceCollection -Name "PKG $PKG [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG $PKG [AVAILABLE]" -Force
Remove-CMPackage -Name "PKG $PKG" -Force

Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.0" -Force 
Remove-CMFolder -FolderPath "PS1:\Package\Application Installation\Igor Pavlov\7zip" -Force # without end slash it works




Get-CMPackage

Invoke-Pester `
    -Path C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\0.11.0\Tests\Application\Get-PCXCMApplicationDeploymentCount.Tests.ps1


Get-Module Pester -ListAvailable

Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

Ensure-PCXCMConnection

$Application = Get-CMApplication -Name 'APP Google Chrome 145.0.7632.46' -Fast

$Result = Get-PCXCMApplicationDeploymentCount -Application $Application

Write-Host "Application : $($Application.LocalizedDisplayName)"
Write-Host "Deployments : $Result"

$Result = Get-PCXCMApplicationCollectionCount `
    -Application $Application

$Result

c:
Get-Command Get-PCXCMApplicationCollectionCount

Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command Get-PCXCMApplicationCollectionCount

Connect-PCXCMSite

$Result = Get-PCXCMApplicationCollectionCount `
    -Application $Application

$Result

$CollectionFolder = Get-PCXCMApplicationCollectionFolder `
    -Application $Application

$CollectionFolder

$CollectionFolder.Name

$CollectionFolder.ContainerNodeID

$CollectionFolder.ObjectTypeName


$FolderID = Get-PCXCMApplicationCollectionFolderID `
    -CollectionFolder $CollectionFolder

$FolderID

$DependencyCount = Get-PCXCMApplicationDependencyCount `
    -Application $Application

$DependencyCount


Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite


$DependencyCount = Get-PCXCMApplicationDependencyCount `
    -Application $Application

$DependencyCount


$SupersedenceCount = Get-PCXCMApplicationSupersedenceCount `
    -Application $Application

$SupersedenceCount

$LastModifiedAgeDays = Get-PCXCMApplicationLastModifiedAge `
    -Application $Application

$LastModifiedAgeDays

$RiskLevel = Get-PCXCMApplicationRiskLevel `
    -DeploymentCount 3 `
    -CollectionCount 4 `
    -TaskSequenceReferenceCount 0 `
    -LastModifiedAgeDays $LastModifiedAgeDays

$RiskLevel

$CleanupScore = Get-PCXCMApplicationCleanupScore `
    -DeploymentCount 3 `
    -CollectionCount 4 `
    -TaskSequenceReferenceCount 0 `
    -DependencyCount 0 `
    -SupersedenceCount 0 `
    -LastModifiedAgeDays 3

$CleanupScore

$Recommendation = Get-PCXCMApplicationCleanupRecommendation `
    -CleanupScore $CleanupScore

$Recommendation

$Risk = Get-PCXCMApplicationCleanupRisk `
    -CleanupScore $CleanupScore

$Risk

$Recommendation = Get-PCXCMApplicationCleanupRecommendation `
    -DeploymentCount 3 `
    -CollectionCount 4 `
    -TaskSequenceReferenceCount 0 `
    -LastModifiedAgeDays 3

$Recommendation


Get-PCXCMApplicationCleanupReport `
    -Name 'APP Google Chrome 145.0.7632.46' |
Format-List *


C:
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue

Import-Module .\src\Modules\PCXLab.SCCM -Force

Connect-PCXCMSite

Get-PCXCMApplicationCleanupReport `
    -Name 'APP Google Chrome 145.0.7632.46' |
Format-List *





Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite


##########################

Get-PCXCMPackageCleanupReport |
Select-Object PackageName,
              ProgramCount |
Format-Table

Get-PCXCMDeploymentRelationshipReport |
Select-Object ApplicationName,
              CollectionName,
              CollectionMemberCount |
Format-Table

get-cmdevice    | Select-Object name, ResourceID   

Add-CMDeviceCollectionMembership
Add-CMDeviceCollectionDirectMembershipRule -CollectionName "APP Igor Pavlov 7zip 26.0.1 [AVAILABLE]" -ResourceId 16777224
Add-CMDeviceCollectionDirectMembershipRule -CollectionName "APP Google Chrome 145.0.7632.46 [AVAILABLE]" -ResourceId 16777224
Add-CMDeviceCollectionDirectMembershipRule -CollectionName "APP Tim Kosse FileZila 3.69.6.0 [AVAILABLE]" -ResourceId 16777224
Add-CMDeviceCollectionDirectMembershipRule -CollectionName "PKG Igor Pavlov 7zip 26.0.0 [AVAILABLE]" -ResourceId 16777224
Add-CMDeviceCollectionDirectMembershipRule -CollectionName "PKG Google Chrome 145.0.7632.46 [AVAILABLE]" -ResourceId 16777224
Add-CMDeviceCollectionDirectMembershipRule -CollectionName "PKG Tim Kosse FileZila 2.12.1.0 [AVAILABLE]" -ResourceId 16777224
Add-CMDeviceCollectionDirectMembershipRule -CollectionName "PKG Tim Kosse FileZila 3.69.6.0 [AVAILABLE]" -ResourceId 16777224

Add-CMDeviceCollectionDirectMembershipRule -CollectionName "APP Tim Kosse FileZila 3.69.6.0 [AVAILABLE]" -ResourceId 2097152000
Add-CMDeviceCollectionDirectMembershipRule -CollectionName "PKG Igor Pavlov 7zip 26.0.0 [AVAILABLE]" -ResourceId 2097152000
Add-CMDeviceCollectionDirectMembershipRule -CollectionName "PKG Google Chrome 145.0.7632.46 [AVAILABLE]" -ResourceId 2097152000

2097152000

$Deployment = Get-CMDeployment |
Select-Object -First 1

$Deployment.CollectionID

#
Get-CMCollection `
    -Id $Deployment.CollectionID

   Get-CMDeviceCollection `
    -Id $Deployment.CollectionID

Get-CMUserCollection `
    -Id $Deployment.CollectionID



    
Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite


##########################

#Get-PCXCMCollectionCleanupReport |
#Format-Table

$ResultCollectionCleanupReport = Get-PCXCMCollectionCleanupReport
$ResultCollectionCleanupReport | Select-Object CollectionName,
                            CollectionID,
                            CollectionType,
                            MemberCount,
                            DeploymentCount,
                            LastRefreshTime,
                            CleanupScore | Format-Table

$ResultCollectionCleanupReport | Select-Object * | Format-List *   


Get-PCXCMCollectionCleanupReport |
Select-Object -First 3 |
Format-List *

$ResultCollectionCleanupReport = Get-PCXCMCollectionCleanupReport
$ResultCollectionCleanupReport |
Select-Object -First 3 |
Format-List *


$ResultCollectionCleanupReport = Get-PCXCMCollectionCleanupReport
$ResultCollectionCleanupReport | Select-Object -First 3 | Format-List *


$ResultCollection = Get-CMDeviceCollection | Select-Object -First 1
$ResultCollection | Format-List *


$ResultCollection = Get-CMDeviceCollection | Select-Object -First 1
$ResultCollection.CollectionRules | Format-List *


$ResultCollection = Get-CMDeviceCollection | Select-Object -First 1
$ResultCollection.CollectionRules | Select-Object * | Format-List *

$ResultCollection = Get-CMDeviceCollection | Select-Object -First 1; $ResultCollection.CollectionRules.Count
$ResultCollection = Get-CMDeviceCollection | Select-Object -First 1; $ResultCollection.CollectionRules | Select-Object -ExpandProperty GetType
$ResultCollection = Get-CMDeviceCollection | Select-Object -First 1; $ResultCollection.CollectionRules | ForEach-Object { $_.GetType().FullName }
$ResultCollection = Get-CMDeviceCollection | Select-Object -First 1; $ResultCollection.CollectionRules | Select-Object -First 1 | Format-List *


Get-CMDeviceCollection -Id PS1004D5

$ResultCollection = Get-CMDeviceCollection -Id PS1004D5
$ResultCollection.CollectionRules | Select-Object -First 1 | Format-List *

$ResultCollectionCleanupReport = Get-PCXCMCollectionCleanupReport
$ResultCollectionCleanupReport | Select-Object -First 3 | Format-List *

$ResultCollection = Get-CMDeviceCollection | Select-Object -First 1
$ResultCollection.CollectionRules | Format-List *


$ResultCollections = Get-CMDeviceCollection
$ResultCollections |
    Where-Object { $_.Name -like '*AVAILABLE*' } |
    Select-Object -First 1 |
    ForEach-Object { $_.CollectionRules } |
    Format-List *

        
#Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

##########################

$ResultDeploymentCleanupReport = Get-PCXCMDeploymentCleanupReport
$ResultDeploymentCleanupReport | Select-Object -First 5 | Format-List *

$ResultDeploymentCollectionMemberCount = Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Deployment\Get-PCXCMDeploymentCollectionMemberCount.ps1
$ResultDeploymentCollectionMemberCount


$ResultDeploymentCollectionMemberCount = Get-Command Get-PCXCMDeploymentCollectionMemberCount
$ResultDeploymentCollectionMemberCount | Format-List *

$ResultDeploymentCollectionMemberCount = Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Deployment\Get-PCXCMDeploymentCollectionMemberCount.ps1
$ResultDeploymentCollectionMemberCount

$ResultDeploymentCleanupReport = Get-PCXCMDeploymentCleanupReport
$ResultDeploymentCleanupReport | Select-Object -First 5 | Format-List *

$ResultProjectRoot = 'C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY'

$ResultDeploymentCollectionMemberCount = Get-Content "$ResultProjectRoot\src\Modules\PCXLab.SCCM\0.11.0\Private\Deployment\Get-PCXCMDeploymentCollectionMemberCount.ps1"


#Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

##########################


#Get-PCXCMCleanupDashboard
$DashBoard = Get-PCXCMCleanupDashboard
$DashBoard.Applications
$DashBoard.Packages
$DashBoard.Collections
$DashBoard.Deployments

$ResultApplicationCleanupSummary = Get-PCXCMApplicationCleanupSummary
$ResultApplicationCleanupSummary | Format-List *

$ResultPackageCleanupSummary = Get-PCXCMPackageCleanupSummary
$ResultPackageCleanupSummary | Format-List *

$ResultCollectionCleanupSummary = Get-PCXCMCollectionCleanupSummary
$ResultCollectionCleanupSummary | Format-List *

$ResultDeploymentCleanupSummary = Get-PCXCMDeploymentCleanupSummary
$ResultDeploymentCleanupSummary | Format-List *



