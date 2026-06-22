#Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

##########################

$ResultTaskSequenceCleanupReport = Get-PCXCMTaskSequenceCleanupReport
$ResultTaskSequenceCleanupReport | Select-Object -First 5 | Format-List *

$ResultTaskSequenceCommands = Get-Command *TaskSequence*
$ResultTaskSequenceCommands | Select-Object Name | Format-Table

$ResultNewCMTaskSequenceSyntax = Get-Command New-CMTaskSequence -Syntax
$ResultNewCMTaskSequenceSyntax

$ResultNewTaskSequence01 = New-CMTaskSequence `
    -CustomTaskSequence `
    -Name 'TS Windows 11 Enterprise'

$ResultNewTaskSequence01

#
$ResultNewTaskSequence02 = New-CMTaskSequence `
    -CustomTaskSequence `
    -Name 'TS Test Unused'

$ResultNewTaskSequence02

#
$ResultDisableTaskSequence = Disable-CMTaskSequence `
    -Name 'TS Test Unused'

$ResultDisableTaskSequence

#
$ResultTaskSequences = Get-CMTaskSequence -Fast
$ResultTaskSequences | Format-Table Name,PackageID

#
$ResultTaskSequence = Get-CMTaskSequence `
    -Name 'TS Test Unused' `
    -Fast

$ResultTaskSequence | Format-List *


$ResultTaskSequenceCleanupSummary = Get-PCXCMTaskSequenceCleanupSummary
$ResultTaskSequenceCleanupSummary | Format-List *


$ResultCleanupDashboard = Get-PCXCMCleanupDashboard
$ResultCleanupDashboard | Format-List *

$ResultTaskSequenceCleanupReport = Get-PCXCMTaskSequenceCleanupReport
$ResultTaskSequenceCleanupReport | Format-List *

$ResultTaskSequenceCleanupReport = Get-PCXCMTaskSequenceCleanupReport
$ResultTaskSequenceCleanupReport | Format-List *


$ResultCleanupDashboard = Get-PCXCMCleanupDashboard

$ResultApplicationCleanupReport = Get-PCXCMApplicationCleanupReport
$ResultApplicationCleanupReport |
Export-Csv C:\Temp\ApplicationCleanup.csv -NoTypeInformation


Export-PCXCMCleanupReportCsv
Export-PCXCMCleanupReportHtml

######################

$ResultApplicationCleanupSummary = Get-PCXCMApplicationCleanupSummary
$ResultApplicationCleanupSummary | Format-List *


$ResultPackageCleanupSummary = Get-PCXCMPackageCleanupSummary
$ResultPackageCleanupSummary | Format-List *


$ResultCollectionCleanupSummary = Get-PCXCMCollectionCleanupSummary
$ResultCollectionCleanupSummary | Format-List *

$ResultDeploymentCleanupSummary = Get-PCXCMDeploymentCleanupSummary
$ResultDeploymentCleanupSummary | Format-List *

$ResultTaskSequenceCleanupSummary = Get-PCXCMTaskSequenceCleanupSummary
$ResultTaskSequenceCleanupSummary | Format-List *

#######################



$ResultApplicationCleanupReport = Get-PCXCMApplicationCleanupReport

Export-PCXCMCleanupReportCsv `
    -InputObject $ResultApplicationCleanupReport `
    -Path C:\Temp\ApplicationCleanup.csv


$ResultApplicationCleanupReport = Get-PCXCMApplicationCleanupReport

Export-PCXCMCleanupReportHtml `
    -InputObject $ResultApplicationCleanupReport `
    -Path C:\Temp\ApplicationCleanup.html



    $ResultExportCleanupDashboardHtml = Export-PCXCMCleanupDashboardHtml -Path C:\Temp\PCXCMCleanupDashboard.html

    a


    Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"