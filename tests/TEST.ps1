<# =====================================================================
 PCXLAB SCCM MODULE - DEVELOPMENT TEST SCRIPT
 -----------------------------------------------------------------------
 Purpose
 -------
 This script is used for:
    - Module development testing
    - Helper function validation
    - SCCM connection testing
    - XML deserialize/save validation
    - Refactor phase testing

 IMPORTANT
 ---------
 This is:
    ✔ Manual integration testing
    ✔ Development validation
    ✔ Safe refactor verification

 This is NOT:
    ✘ Production automation
    ✘ Pester unit testing
    ✘ CI/CD pipeline script

 Recommended Location
 --------------------
 Repository-Level Tests Folder:

 C:\Projects\PCXLABCMAutomation_ADDOSREQ\Tests\TEST.ps1

===================================================================== #>

#region INITIALIZATION

Clear-Host

# Remove loaded modules to ensure clean reload
Remove-Module PCXLab.Core -Force -ErrorAction SilentlyContinue
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue

# Project root path
$ProjectRoot = "C:\Projects\PCXLABCMAutomation_ADDOSREQ"

# Import modules
Import-Module `
    "$ProjectRoot\src\Modules\PCXLab.Core" `
    -Force

Import-Module `
    "$ProjectRoot\src\Modules\PCXLab.SCCM" `
    -Force

#endregion INITIALIZATION


#region MODULE VALIDATION

Write-Host ""
Write-Host "================ MODULE VALIDATION ================"

# Verify modules loaded
Get-Module PCXLab.Core
Get-Module PCXLab.SCCM

# Verify exported commands
Get-Command -Module PCXLab.Core
Get-Command -Module PCXLab.SCCM

#endregion MODULE VALIDATION


#region PATH VARIABLES

Write-Host ""
Write-Host "================ PATH VARIABLES ================"

# Config XML
$configFilePath = Join-Path `
    $ProjectRoot `
    "src\Modules\PCXLab.SCCM\0.6.0\Config\ConfigFile.xml"

# Runtime Input CSV
$csvPath = Join-Path `
    $ProjectRoot `
    "src\Modules\PCXLab.SCCM\0.6.0\Input\ApplicationList.csv"

# OS Mapping CSV
$OSValidateSetPath = Join-Path `
    $ProjectRoot `
    "src\Modules\PCXLab.SCCM\0.6.0\Config\OSValidateSet.csv"

# Display paths
$configFilePath
$csvPath
$OSValidateSetPath

#endregion PATH VARIABLES


#region PHASE 1 - CONFIG VALIDATION

Write-Host ""
Write-Host "================ PHASE 1 - CONFIG VALIDATION ================"

$config = Import-PCXConfiguration `
    -ConfigPath $configFilePath

$config

#endregion PHASE 1 - CONFIG VALIDATION


#region PHASE 1 - INPUT VALIDATION

Write-Host ""
Write-Host "================ PHASE 1 - INPUT VALIDATION ================"

$applications = Import-PCXApplicationList `
    -CsvPath $csvPath

$applications

#endregion PHASE 1 - INPUT VALIDATION


#region PHASE 1 - OS REQUIREMENT OPERAND VALIDATION

Write-Host ""
Write-Host "================ PHASE 1 - OS REQUIREMENT VALIDATION ================"

$Operand = Get-PCXOSRequirementOperand `
    -Requirement "All Windows 11 (64-bit)" `
    -CsvPath $OSValidateSetPath

$Operand

#endregion PHASE 1 - OS REQUIREMENT OPERAND VALIDATION


#region PHASE 1 - REPORT OBJECT VALIDATION

Write-Host ""
Write-Host "================ PHASE 1 - REPORT OBJECT VALIDATION ================"

# Mock application object for testing
$app = [PSCustomObject]@{
    PackageID        = "PS100001"
    CIVersion        = "5"
    SourceSite       = "PS1"
    DateCreated      = (Get-Date)
    CreatedBy        = "PCXLab"
    DateLastModified = (Get-Date)
    LastModifiedBy   = "PCXLab"
}

# Generate report object
$ReportObject = New-PCXReportObject `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -Requirement "All Windows 11 (64-bit)" `
    -Status "Updated" `
    -Application $app

$ReportObject

#endregion PHASE 1 - REPORT OBJECT VALIDATION


#region SCCM CONNECTION VALIDATION

Write-Host ""
Write-Host "================ SCCM CONNECTION VALIDATION ================"

# Connect to SCCM Site
Connect-PCXCMSite

# Confirm current location
Get-Location

#endregion SCCM CONNECTION VALIDATION


#region PHASE 2 - XML DESERIALIZE VALIDATION

Write-Host ""
Write-Host "================ PHASE 2 - XML DESERIALIZE VALIDATION ================"

# Get SCCM Application
$CMApplication = Get-CMApplication `
    -Name "APP Igor Pavlov 7zip 26.0.0"

# Deserialize XML
$XML = Get-PCXApplicationXML `
    -Application $CMApplication

# Validate Deployment Types
$XML.DeploymentTypes

#endregion PHASE 2 - XML DESERIALIZE VALIDATION


#region PHASE 2 - XML SAVE VALIDATION

Write-Host ""
Write-Host "================ PHASE 2 - XML SAVE VALIDATION ================"

# Serialize and Save XML
Save-PCXApplicationXML `
    -Application $CMApplication `
    -Xml $XML

# Revalidate SCCM Application
Get-CMApplication `
    -Name "APP Igor Pavlov 7zip 26.0.0"

#endregion PHASE 2 - XML SAVE VALIDATION


#region FUTURE PHASES PLACEHOLDER

<#

Future Planned Testing Sections
-------------------------------

PHASE 3
--------
- Test-PCXOSRequirementExists
- Add-PCXOSRequirementToXML


PHASE 4
--------
- Full orchestration validation
- Reporting export validation
- Logging validation

PHASE 5
--------
- Bulk application processing
- Error handling validation
- Rollback testing

#>


#phase 3

$Requirement = "All Windows 11 (64-bit)"

$Exists = Test-PCXOSRequirementExists `
    -Xml $XML `
    -Requirement $Requirement

$Exists
    
#endregion FUTURE PHASES PLACEHOLDER


#region CLEANUP

Write-Host ""
Write-Host "================ TEST SCRIPT COMPLETED ================"

#endregion CLEANUP


$app = Get-CMApplication -Name "APP Igor Pavlov 7zip 26.0.0"

$XML = Get-PCXApplicationXML -Application $app

$Exists = Test-PCXOSRequirementExists `
    -Xml $XML `
    -Requirement "All Windows 11 (64-bit)"

$Exists

$Operand = Get-PCXOSRequirementOperand `
    -Requirement "All Windows 11 (64-bit)" `
    -CsvPath $OSValidateSetPath

$Result = Add-PCXOSRequirementToXML `
    -Xml $XML `
    -Requirement "All Windows 11 (64-bit)" `
    -Operand $Operand

$Result

$XML.DeploymentTypes.Requirements.Name

Save-PCXApplicationXML `
    -Application $app `
    -Xml $XML


$app = Get-CMApplication `
    -Name "APP Igor Pavlov 7zip 26.0.0"

$XML = Get-PCXApplicationXML `
    -Application $app

Test-PCXOSRequirementExists `
    -Xml $XML `
    -Requirement "All Windows 11 (64-bit)"

# Retest
$app = Get-CMApplication `
    -Name "APP Igor Pavlov 7zip 26.0.0"

$XML = Get-PCXApplicationXML `
    -Application $app


    Test-PCXOSRequirementExists `
    -Xml $XML `
    -Requirement "All Windows 11 (64-bit)"

$Operand = Get-PCXOSRequirementOperand `
    -Requirement "All Windows 11 (64-bit)" `
    -CsvPath $OSValidateSetPath

    $Result = Add-PCXOSRequirementToXML `
    -Xml $XML `
    -Requirement "All Windows 11 (64-bit)" `
    -Operand $Operand

    $XML.DeploymentTypes.Requirements.Name


    $app = Get-CMApplication `
    -Name "APP Igor Pavlov 7zip 26.0.0"

$XML = Get-PCXApplicationXML `
    -Application $app

Test-PCXOSRequirementExists `
    -Xml $XML `
    -Requirement "All Windows 11 (64-bit)"