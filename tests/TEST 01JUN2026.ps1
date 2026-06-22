Clear-Host
c:
Remove-Module PCXLab.Core -Force
Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.Core -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command -Module PCXLab.Core
Get-Command -Module PCXLab.SCCM

$ProjectRoot = "C:\Projects\PCXLABCMAutomation_ADDOSREQ"

$configFilePath = Join-Path `
    $ProjectRoot `
    "src\Modules\PCXLab.SCCM\0.6.0\Config\ConfigFile.xml"

$configPath = Join-Path $ProjectRoot "src\Modules\PCXLab.SCCM\0.6.0\Config\ConfigFile.xml"

$config = Import-PCXConfiguration -ConfigPath $configFilePath

$csvPath = Join-Path `
    $ProjectRoot `
    "Input\ApplicationList.csv"

Import-PCXApplicationList -CsvPath $csvPath

$OSValidateSetPath = Join-Path `
    $ProjectRoot `
    "src\Modules\PCXLab.SCCM\0.6.0\Config\OSValidateSet.csv"

Get-PCXOSRequirementOperand `
    -Requirement "All Windows 11 (64-bit)" `
    -CsvPath $OSValidateSetPath

$app = [PSCustomObject]@{
    PackageID        = "PS100001"
    CIVersion        = "5"
    SourceSite       = "PS1"
    DateCreated      = (Get-Date)
    CreatedBy        = "PCXLab"
    DateLastModified = (Get-Date)
    LastModifiedBy   = "PCXLab"
}


New-PCXReportObject `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -Requirement "All Windows 11 (64-bit)" `
    -Status "Updated" `
    -Application $app



Import-PCXApplicationList -CsvPath $csvPath

Get-PCXOSRequirementOperand `
    -Requirement "All Windows 11 (64-bit)" `
    -CsvPath $OSValidateSetPath


# Phase 2
Clear-Host
Remove-Module PCXLab.SCCM -Force
c:
Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command Get-PCXApplicationXML
Get-Command Save-PCXApplicationXML

Connect-PCXCMSite

$app = Get-CMApplication -Name "APP Igor Pavlov 7zip 26.0.0"

$xml = Get-PCXApplicationXML -Application $app

$xml.DeploymentTypes


# next step

$app = Get-CMApplication -Name "APP Igor Pavlov 7zip 26.0.0"

$xml = Get-PCXApplicationXML -Application $app

Save-PCXApplicationXML `
    -Application $app `
    -Xml $xml

Get-CMApplication -Name "APP Igor Pavlov 7zip 26.0.0"


Get-PCXCMApplication `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0"


$app = Get-PCXCMApplication `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0"


$XML = Get-PCXApplicationXML `
    -Application $app

$XML.DeploymentTypes.Requirements.Name


Save-PCXApplicationXML `
    -Application $app `
    -Xml $XML


Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -Requirement "All Windows 11 (64-bit)"


##

Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath


Add-PCXCMApplicationOSRequirementFromCSV `
    -CsvPath $csvPath `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath


$ReportPath = "C:\Projects\PCXLABCMAutomation_ADDOSREQ\Reports\OSRequirementReport.csv"

Add-PCXCMApplicationOSRequirementFromCSV `
    -CsvPath $csvPath `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -ReportPath $ReportPath `
    -Verbose



Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command -Module PCXLab.SCCM



New-PCXCMApplication -Name "APS_7zip_26.0.1" -Description "New Application" -Publisher "Igor-Pavlov" -SoftwereVersion "26.00" -ReleaseDate "2/12/2026" -Iconlocationfile "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46\googlechromestandaloneenterprise64.png"
New-PCXCMApplication -Name "APS_7zip_26.0.1" -Description "New Application" -Publisher "Igor-Pavlov" -SoftwereVersion "26.00" -ReleaseDate "2/12/2026" -Iconlocationfile "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46\googlechromestandaloneenterprise64.png"

Clear-Host
connect-PCXCMSite

$appWithAtleast1Requiremnt = Get-PCXCMApplication `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0"

$XMLForappWithAtleast1Requiremnt = Get-PCXApplicationXML `
    -Application $appWithAtleast1Requiremnt

$XMLForappWithAtleast1Requiremnt 
    
$appWithNoRequiremnt = Get-PCXCMApplication `
    -ApplicationName "APP Google Chrome 145.0.7632.46"

$XMLForappWithNoRequiremnt = Get-PCXApplicationXML `
    -Application $appWithNoRequiremnt

$XMLForappWithNoRequiremnt


$XMLForappWithAtleast1Requiremnt.DeploymentTypes.Requirements.Name
$XMLForappWithNoRequiremnt.DeploymentTypes.Requirements.Name

$XMLForappWithNoRequiremnt.DeploymentTypes.Requirements

$XMLForappWithNoRequiremnt.DeploymentTypes.Requirements | Format-List *

$XMLForappWithNoRequiremnt.DeploymentTypes | Format-List *



Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -AllowRequirementCreation


$app = Get-CMApplication `
    -Name "APP Igor Pavlov 7zip 26.0.0"

$dt = Get-CMDeploymentType `
    -ApplicationName $app.LocalizedDisplayName

$dt


Initialize-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Google Chrome 145.0.7632.46" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath


$app = Get-CMApplication `
    -Name "APP Google Chrome 145.0.7632.46"

$dt = $app | Get-CMDeploymentType

$dt.GetType().FullName

$dt 

Add-Content -Value $dt -Path .\dt.txt 

$RequirementRule = New-CMRequirementRuleOperatingSystemValue `
    -InputObject $dt `
    -RuleOperator OneOf `
    -PlatformString "Windows/All_x64_Windows_11_and_higher_Clients"

$RequirementRule


$app = Get-CMApplication `
    -Name "APP Google Chrome 145.0.7632.46"

$XML = Get-PCXApplicationXML `
    -Application $app

Initialize-PCXOSRequirementNode `
    -Xml $XML

$XML.DeploymentTypes.Requirements

$XML.DeploymentTypes.Requirements.Name



cls


$app = Get-CMApplication `
    -Name "APP Igor Pavlov 7zip 26.0.0"

$XML = Get-PCXApplicationXML `
    -Application $app

$Requirement = $XML.DeploymentTypes.Requirements

$Requirement | Format-List *

$Requirement.Expression | Format-List *

$Requirement.GetType().FullName

###

$app = Get-CMApplication `
    -Name "APP Igor Pavlov 7zip 26.0.0"


$app.SDMPackageXML

$app | Select-Object -ExpandProperty SDMPackageXML

Get-PCXApplicationXML


Connect-PCXCMSite

$ChromeApp = Get-CMApplication `
    -Name "APP Google Chrome 145.0.7632.46"

[xml]$ChromeXML = $ChromeApp.SDMPackageXML

$templatePath = "C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.6.0\Config\Templates\OperatingSystemRequirement.xml"

[xml]$TemplateXML = Get-Content $templatePath

$RuleId = "Rule_$([guid]::NewGuid())"

$RequirementName = "All Windows 11 (64-bit)"

$Operand = "Windows/All_x64_Windows_11_and_higher_Clients"


$TemplateXML.Rule.id = $RuleId

$TemplateXML.Rule.Annotation.DisplayName.Text = `
    "Operating system One of {$RequirementName}"

$TemplateXML.Rule.OperatingSystemExpression.Operands.RuleExpression.RuleId = `
    $Operand


$TemplateXML.OuterXml


$RequirementsNode = $ChromeXML.AppMgmtDigest.DeploymentType.Installer.Requirements

$RequirementsNode

$ImportedRule = $ChromeXML.ImportNode(
    $TemplateXML.Rule,
    $true
)

$null = $RequirementsNode.AppendChild(
    $ImportedRule
)

$RequirementsNode = $ChromeXML.CreateElement(
    "Requirements",
    $ChromeXML.DocumentElement.NamespaceURI
)

$InstallerNode = $ChromeXML.AppMgmtDigest.DeploymentType.Installer

$null = $InstallerNode.AppendChild(
    $RequirementsNode
)


$ChromeXML.AppMgmtDigest.DeploymentType.Installer.Requirements

$ImportedRule = $ChromeXML.ImportNode(
    $TemplateXML.Rule,
    $true
)

$null = $RequirementsNode.AppendChild(
    $ImportedRule
)


$ChromeXML.AppMgmtDigest.DeploymentType.Installer.Requirements



$ChromeApp.SDMPackageXML = $ChromeXML.OuterXml

$ChromeApp.Put() | Out-Null


###
[xml]$WorkingXML = (
    Get-CMApplication `
        -Name "APP Igor Pavlov 7zip 26.0.0"
).SDMPackageXML

$WorkingXML.OuterXml

###

$ChromeApp = Get-CMApplication `
    -Name "APP Google Chrome 145.0.7632.46"

[xml]$ChromeXML = $ChromeApp.SDMPackageXML

$templatePath = "C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.6.0\Config\Templates\OperatingSystemRequirement.xml"

[xml]$TemplateXML = Get-Content $templatePath


$RuleId = "Rule_$([guid]::NewGuid())"

$RequirementName = "All Windows 11 (64-bit)"

$Operand = "Windows/All_x64_Windows_11_and_higher_Clients"

$TemplateXML.Rule.id = $RuleId

$TemplateXML.Rule.Annotation.DisplayName.Text = `
    "Operating system One of {$RequirementName}"

$TemplateXML.Rule.OperatingSystemExpression.Operands.RuleExpression.RuleId = `
    $Operand


$RequirementsNode = $ChromeXML.CreateElement(
    "Requirements",
    $ChromeXML.DocumentElement.NamespaceURI
)


$ImportedRule = $ChromeXML.ImportNode(
    $TemplateXML.Rule,
    $true
)


$null = $RequirementsNode.AppendChild(
    $ImportedRule
)

$DeploymentTypeNode = $ChromeXML.AppMgmtDigest.DeploymentType

$null = $DeploymentTypeNode.InsertBefore(
    $RequirementsNode,
    $DeploymentTypeNode.Installer
)

$ChromeXML.AppMgmtDigest.DeploymentType.Requirements

$ChromeApp.SDMPackageXML = $ChromeXML.OuterXml

$ChromeApp.Put() | Out-Null


Get-Command New-CMScriptDeploymentType -Syntax
Get-Command Add-CMMsiDeploymentType -Syntax

$app = Get-CMApplication `
    -Name "APP Igor Pavlov 7zip 26.0.0"

$dt = Get-CMDeploymentType `
    -ApplicationName $app.LocalizedDisplayName

$dt.GetType().FullName

$dt | Get-Member


$RequirementRule = New-CMRequirementRuleOperatingSystemValue `
    -InputObject $dt `
    -RuleOperator OneOf `
    -PlatformString "Windows/All_x64_Windows_11_and_higher_Clients"



$OSGlobalCondition = Get-CMGlobalCondition `
    -Name "Operating System" |
Where-Object PlatformType -eq 1

$RequirementRule = $OSGlobalCondition |
New-CMRequirementRuleOperatingSystemValue `
    -RuleOperator OneOf `
    -PlatformString "Windows/All_x64_Windows_11_and_higher_Clients"

$RequirementRule

$RequirementRule.GetType().FullName

Get-CMApplication `
    -Name "APP TEST SCCM NATIVE REQUIREMENT"

#

$DT = Get-CMDeploymentType `
    -ApplicationName "APP TEST SCCM NATIVE REQUIREMENT"

$DT.LocalizedDisplayName


Set-CMMsiDeploymentType `
    -ApplicationName "APP TEST SCCM NATIVE REQUIREMENT" `
    -DeploymentTypeName $DT.LocalizedDisplayName `
    -AddRequirement $RequirementRule



###################

Set-CMMsiDeploymentType `
    -ApplicationName "APP TEST SCCM NATIVE REQUIREMENT" `
    -DeploymentTypeName $DT.LocalizedDisplayName `
    -AddRequirement $RequirementRule


#################


$ApplicationName = "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)"

$OSGlobalCondition = Get-CMGlobalCondition `
    -Name "Operating System" |
Where-Object PlatformType -eq 1

$RequirementRule = $OSGlobalCondition |
New-CMRequirementRuleOperatingSystemValue `
    -RuleOperator OneOf `
    -PlatformString "Windows/All_x64_Windows_11_and_higher_Clients"
  
$DT = Get-CMDeploymentType `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)"

Set-CMMsiDeploymentType `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)" `
    -DeploymentTypeName $DT.LocalizedDisplayName `
    -AddRequirement $RequirementRule


#################


$ApplicationName = "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)"

$ApplicationName = "APP Igor Pavlov 7zip 26.0.0"

$ApplicationName = "APP Google Chrome 145.0.7632.46"

$ApplicationName = "APP TEST SCCM NATIVE REQUIREMENT"

$OSGlobalCondition = Get-CMGlobalCondition `
    -Name "Operating System" |
Where-Object PlatformType -eq 1

$RequirementRule = $OSGlobalCondition |
New-CMRequirementRuleOperatingSystemValue `
    -RuleOperator OneOf `
    -PlatformString "Windows/All_x64_Windows_11_and_higher_Clients"

  
$DT = Get-CMDeploymentType `
    -ApplicationName $ApplicationName

Set-CMMsiDeploymentType `
    -ApplicationName $ApplicationName `
    -DeploymentTypeName $DT.LocalizedDisplayName `
    -AddRequirement $RequirementRule


############################
$RequirementRule = $OSGlobalCondition |
New-CMRequirementRuleOperatingSystemValue `
    -RuleOperator OneOf `
    -PlatformString "Windows/All_x86_Windows_10_and_higher_Clients"



Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force


$Operand = Get-PCXOSRequirementOperand `
    -Requirement "All Windows 11 (64-bit)" `
    -CsvPath $OSValidateSetPath

$Rule = New-PCXOSRequirementRule `
    -Operand $Operand

$Rule

$Rule.GetType().FullName


Set-CMMsiDeploymentType `
    -ApplicationName "APP TEST SCCM NATIVE REQUIREMENT" `
    -DeploymentTypeName $DT.LocalizedDisplayName `
    -AddRequirement $Rule


c:
Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force

Connect-PCXCMSite


$Operand = Get-PCXOSRequirementOperand `
    -Requirement "All Windows 11 (64-bit)" `
    -CsvPath $OSValidateSetPath

$Rule = New-PCXOSRequirementRule `
    -Operand $Operand


Add-PCXOSRequirementToDeploymentType `
    -ApplicationName "APP TEST SCCM NATIVE REQUIREMENT" `
    -RequirementRule $Rule

# SCCM provider refresh may be delayed briefly after
# Set-CMMsiDeploymentType operations.

Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP TEST SCCM NATIVE REQUIREMENT" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -AllowRequirementCreation

Get-CMGlobalCondition `
    -Name "Operating System" |
Select-Object LocalizedDisplayName, PlatformType


    

Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -AllowRequirementCreation



Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)" `
    -Requirement "All Windows 18 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -AllowRequirementCreation


Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP TEST SCCM NATIVE REQUIREMENT" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -AllowRequirementCreation
    
Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP TEST SCCM NATIVE REQUIREMENT" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -AllowRequirementCreation


Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath

Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -Requirement "All Windows 10 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath


Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath


Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP TEST SCCM NATIVE REQUIREMENT" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath


Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)" `
    -Requirement "All Windows 18 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -AllowRequirementCreation

C:
Connect-PCXCMSite
Add-PCXCMApplicationOSRequirementFromCSV `
    -Path ".src\Modules\PCXLab.SCCM\0.6.0\Input\ApplicationList.csv" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -AllowRequirementCreation

Add-PCXCMApplicationOSRequirement `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.0" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath


C:
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force

Connect-PCXCMSite

$OSValidateSetPath = "C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.6.0\Config\OSValidateSet.csv"
    
$ReportPath = "C:\Projects\PCXLABCMAutomation_ADDOSREQ\Reports\OSRequirementReport.csv"

Add-PCXCMApplicationOSRequirementFromCSV `
    -CsvPath "C:\Projects\PCXLABCMAutomation_ADDOSREQ\Input\ApplicationList.csv" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -AllowRequirementCreation `
    -ReportPath $ReportPath


Add-PCXCMApplicationOSRequirementFromCSV `
    -CsvPath "C:\Projects\PCXLABCMAutomation_ADDOSREQ\Input\ApplicationList.csv" `
    -Requirement "All Windows 11 (64-bit)" `
    -OSValidateSetPath $OSValidateSetPath `
    -ReportPath $ReportPath


Get-PCXOSRequirementOperand

cls
C:
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue

Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command -Module PCXLab.SCCM

Get-PCXCollectionNames `
    -PackageName "Google Chrome"

Test-PCXPackagePath `
    -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46"


Test-PCXPackagePath `
    -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46xxx"

Get-PCXInstaller `
    -SourcePath "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46"

$Installer = Get-PCXInstaller `
    -SourcePath "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46"

Get-PCXPackageMetadata `
    -Installer $Installer

$Installer = Get-PCXInstaller `
    -SourcePath "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46"

Get-PCXCommandLine `
    -Installer $Installer


Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command Invoke-PCXWithRetry

$script:Config = @{
    RetryCount = 3
    RetryDelay = 1
}

Invoke-PCXWithRetry {
    "SUCCESS"
}

Invoke-PCXWithRetry

Invoke-PCXWithRetry {
    throw "TEST"
}


Remove-Module PCXLab.SCCM -Force
Remove-Module PCXLab.Core -Force

Import-Module .\src\Modules\PCXLab.Core -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command Test-PCXPackagePath

Test-PCXPackagePath "C:\Windows"

Test-PCXPackagePath "C:\INVALID_TEST_FOLDER"

mkdir C:\Temp\EmptyTest

Test-PCXPackagePath "C:\Temp\EmptyTest"

. .\Private\Applications\Function.ps1

. .\src\Modules\PCXLab.SCCM\0.6.0\Private\Applications\Get-PCXPackageMetadata.ps1

Get-PCXPackageMetadata "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46"

Get-PCXPackageMetadata "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0"

Get-PCXPackageMetadata "\\Server\Apps\Google\Chrome\Latest"

. .\src\Modules\PCXLab.SCCM\0.6.0\Private\Applications\Get-PCXInstaller.ps1

Get-PCXInstaller `
    -SourcePath "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46"

Get-PCXInstaller `
    -SourcePath "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.1"

md "C:\Temp\NoInstaller"

Get-PCXInstaller `
    -SourcePath "C:\Temp\NoInstaller"


C:
Clear-Host
Remove-Module PCXLab.Core -Force -ErrorAction SilentlyContinue
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue

Import-Module .\src\Modules\PCXLab.Core -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force


Import-Module .\src\Modules\PCXLab.Core -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command -Module PCXLab.Core
Get-Command -Module PCXLab.SCCM

Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46"
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.49"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.49"
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0"
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"

#Create-PCXApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46"

#Create-PCXApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46"

#Create-PCXApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0"


. .\src\Modules\PCXLab.SCCM\0.6.0\Private\Applications\Add-PCXMemoryRequirementToDeploymentType.ps1

. .\src\Modules\PCXLab.SCCM\0.6.0\Private\Applications\Add-PCXDiskSpaceRequirementToDeploymentType.ps1

Connect-PCXCMSite


Add-PCXMemoryRequirementToDeploymentType `
    -ApplicationName "APP Google Chrome 145.0.7632.46" `
    -MinimumMemoryMB 4096

Get-Command Add-PCXMemoryRequirementToDeploymentType


Add-PCXDiskSpaceRequirementToDeploymentType `
    -ApplicationName "APP Google Chrome 145.0.7632.46" `
    -MinimumDiskSpaceMB 20480

Get-Command Add-PCXDiskSpaceRequirementToDeploymentType

Get-Command New-CMRequirementRule*

Get-Help New-CMRequirementRuleFreeDiskSpaceValue -Full

Get-Help New-CMRequirementRuleCommonValue -Full

C:
. .\src\Modules\PCXLab.SCCM\0.6.0\Private\Applications\Add-PCXDiskSpaceRequirementToDeploymentType.ps1
. .\src\Modules\PCXLab.SCCM\0.6.0\Private\Applications\Add-PCXMemoryRequirementToDeploymentType.ps1

Add-PCXDiskSpaceRequirementToDeploymentType `
    -ApplicationName "APP Google Chrome 145.0.7632.46" `
    -MinimumDiskSpaceMB 20480

Add-PCXDiskSpaceRequirementToDeploymentType `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)" `
    -MinimumDiskSpaceMB 20480   


Add-PCXMemoryRequirementToDeploymentType `
    -ApplicationName "APP Google Chrome 145.0.7632.46" `
    -MinimumMemoryMB 4096


Add-PCXMemoryRequirementToDeploymentType `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)" `
    -MinimumMemoryMB 4096

Get-CMGlobalCondition | Select-Object LocalizedDisplayName

Get-CMGlobalCondition | 
Select-Object LocalizedDisplayName, ModelName


Connect-PCXCMSite

Get-CMDeploymentType `
    -ApplicationName "APP Google Chrome 145.0.7632.46" |
Select-Object LocalizedDisplayName, Technology

Get-CMDeploymentType `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)" |
Select-Object LocalizedDisplayName, Technology


Add-PCXDiskSpaceRequirementToDeploymentType `
    -ApplicationName "APP Google Chrome 145.0.7632.46" `
    -MinimumDiskSpaceMB 20480

Add-PCXMemoryRequirementToDeploymentType `
    -ApplicationName "APP Google Chrome 145.0.7632.46" `
    -MinimumMemoryMB 4096

Add-PCXDiskSpaceRequirementToDeploymentType `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)" `
    -MinimumDiskSpaceMB 20480

Add-PCXMemoryRequirementToDeploymentType `
    -ApplicationName "APP Igor Pavlov 7zip 26.0.1 (SCRIPT Type)" `
    -MinimumMemoryMB 4096

Create-PCXCMPackage -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.0\"




C:
Clear-Host
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue

Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command -Module PCXLab.SCCM
Get-Command -Module PCXLab.SCCM add*
Connect-PCXCMSite

Create-PCXCMPackage -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.0"

Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.46"

Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0"

Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"

Create-PCXCMApplication -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1"


Select-String `
    -Path ".\src\Modules\PCXLab.SCCM\0.7.0\PCXLab.SCCM.psm1" `
    -Pattern "Start-PCXCMContentDistributionForApplication"


Get-Module PCXLab.SCCM -All
    

Get-Command Add-PCXMemoryRequirementToDeploymentType

Get-PCXCollectionNames

get-command -module PCXLab.SCCM *pro*
get-command -module PCXLab.SCCM *test*
get-command -module PCXLab.SCCM *Obj*


Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command Add-CMScriptDeploymentType -Syntax
Get-Command New-CMDetectionClauseFile -Syntax
(Get-Command New-PCXCMApplicationDeploymentType).Definition

(Get-Command New-PCXDetectionClause).Definition

Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force
(Get-Command New-PCXCMApplicationDeploymentType).Definition

Get-Command New-PCX*Object

Get-Command Move-PCXCMObject

New-PCXResultObject `
    -Success $true `
    -Action "Test" `
    -Name "Test Object" `
    -Path "PS1:\Test" `
    -Message "Test Success"

New-PCXReportObject `
    -ApplicationName "Test" `
    -Requirement "Windows 11" `
    -Status "Updated"


Create-PCXCMPackage -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.0"

Select-String `
    -Path "C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.7.0\**\*.ps1" `
    -Pattern "Welcome to PCXLab automation"

Get-Command Add-CMScriptDeploymentType -Syntax


Remove-Module PCXLab.SCCM -Force


(Get-Command New-PCXCMApplicationDeploymentType).Definition

Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-ChildItem "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1\"

Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command New-PCXDetectionClause

(Get-Command New-PCXCMApplicationDeploymentType).Definition

Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force
Connect-PCXCMSite


$installer = [System.IO.FileInfo]"\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1\7z2601-x64.exe"

New-PCXDetectionClause -Installer $installer

Get-Help Add-CMScriptDeploymentType -Full

tree "C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.7.0" /f

Get-Command -Module PCXLab.SCCM


(Get-Command Start-PCXCMContentDistributionForApplication).ScriptBlock

(Get-Command Start-PCXCMContentDistributionForApplication).Source

(Get-Command Start-PCXCMContentDistributionForApplication).Module.Path

Select-String `
    -Path "C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.7.0\**\*.ps1" `
    -Pattern "function Start-PCXCMContentDistributionForApplication"


Select-String `
    -Path ".\src\Modules\PCXLab.SCCM\0.7.0\PCXLab.SCCM.psm1" `
    -Pattern "Start-PCXCMContentDistributionForApplication"


Get-Content `
    ".\src\Modules\PCXLab.SCCM\0.7.0\Public\Packages\New-PCXCMProgram.ps1"

Select-String `
    -Path ".\src\Modules\PCXLab.SCCM\0.7.0\**\*.ps1" `
    -Pattern "\bNew-PCXCMProgram\b"

Get-Command New-PCXCMProgram

Select-String `
    -Path ".\src\Modules\PCXLab.SCCM\0.7.0\**\*.ps1" `
    -Pattern "New-CMProgram"

Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue

Import-Module .\src\Modules\PCXLab.SCCM\0.7.0 -Force -Verbose

C:
Import-Module .\src\Modules\PCXLab.SCCM -Force -Verbose
Get-Module -Name PCXLab.SCCM

Get-Command New-PCXCMProgram
#

(Get-Module PCXLab.SCCM).ExportedCommands.Keys |
Sort-Object |
Where-Object { $_ -like "*Program*" }

(Get-Module PCXLab.SCCM).ExportedCommands.Keys |
Sort-Object |
Where-Object { $_ -like "*ContentDistribution*" }

Get-Command -Module PCXLab.SCCM |
Where-Object Name -like "*Program*" |
Select-Object Name

Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0\Public\Packages"

Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0\Public\Packages" `
    -Filter *.ps1 |
Select-Object Name

Get-Content `
    ".\src\Modules\PCXLab.SCCM\0.7.0\PCXLab.SCCM.psm1"

#

Get-Command -Module PCXLab.SCCM |
Sort-Object Name |
Select-Object Name

(Get-Module PCXLab.SCCM).ExportedCommands.Count


# Auto load Private
Get-ChildItem ... | ForEach-Object { . $_.FullName }

# Auto load Public
Get-ChildItem ... | ForEach-Object { . $_.FullName }

Get-Command -Module PCXLab.SCCM |
Sort-Object Name |
Select-Object Name


(Get-Module PCXLab.SCCM).ExportedCommands.Count

(Get-Module PCXLab.SCCM).ExportedCommands.Keys |
Sort-Object

#
Import-Module `
    "C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.7.0\PCXLab.SCCM.psd1" `
    -Force `
    -Verbose

Get-Content `
    ".\src\Modules\PCXLab.SCCM\0.7.0\Public\Packages\New-PCXCMProgram.ps1" `
    -First 20


Get-Content `
    ".\src\Modules\PCXLab.SCCM\0.7.0\Public\Packages\Start-PCXCMContentDistribution.ps1" `
    -First 20

#

Get-Command -Module PCXLab.SCCM |
Select-Object Name |
Sort-Object Name

Get-Command -Module PCXLab.SCCM |
Select-Object Name |
Sort-Object Name |
Export-Csv .\ModuleCommands.csv -NoTypeInformation

PS C:\Projects\PCXLABCMAutomation_ADDOSREQ> 
PS C:\Projects\PCXLABCMAutomation_ADDOSREQ> Get-Command -Module PCXLab.SCCM |
Select-Object Name |
Sort-Object Name

Name                                    
----                                    
Add-PCXCMApplicationOSRequirement       
Add-PCXCMApplicationOSRequirementFromCSV
Add-PCXCMCollectionExclusion            
Add-PCXCMCollectionInclusion            
Add-PCXCMCollectionQueryRule            
Connect-PCXCMSite                       
Create-PCXCMApplication                 
Create-PCXCMPackage                     
Move-PCXCMApplicationToFolder           
Move-PCXCMCollectionsToFolder           
Move-PCXCMObject                        
Move-PCXCMPackageToFolder               
New-PCXCMApplication                    
New-PCXCMApplicationDeployment          
New-PCXCMApplicationDeploymentType      
New-PCXCMDeviceCollection               
New-PCXCMDeviceCollectionInFolder       
New-PCXCMFolder                         

Select-String `
    -Path ".\src\Modules\PCXLab.SCCM\0.7.0\**\*.ps1", ".\src\Modules\PCXLab.SCCM\0.7.0\*.psm1" `
    -Pattern "Export-ModuleMember"

(Get-Module PCXLab.SCCM).ExportedFunctions.Keys |
Sort-Object

#

Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0" `
    -Recurse `
    -Filter *.ps1 |
Select-String `
    -Pattern "\bAdd-PCXProgram\b"

Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0" `
    -Recurse `
    -Filter *.ps1 |
Select-String `
    -Pattern "\bNew-PCXCMProgram\b"


Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0" `
    -Recurse `
    -Filter *.ps1 |
Select-String `
    -Pattern "\bStart-PCXCMContentDistributionForApplication\b"


Get-Item `
    ".\src\Modules\PCXLab.SCCM\0.7.0\Public\Packages\New-PCXCMProgram.ps1"

cls
Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0" `
    -Recurse `
    -Filter *.ps1 |
Select-String `
    -Pattern "Get-PCXProgramNames|New-SCCMCollections|New-SCCMDeployments|Set-SCCMCollectionRules|Start-SCCMContentDistribution"

Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command New-PCXCMProgram -ErrorAction SilentlyContinue

New-Item `
    -Path "C:\Projects\PCXLABCMAutomation_ADDOSREQ\Tools" `
    -ItemType Directory `
    -Force


C:\Projects\PCXLABCMAutomation_ADDOSREQ\Tools\Invoke-PCXModuleAudit.ps1



Start-PCXCMContentDistribution -ApplicationName "APP TEST SCCM NATIVE REQUIREMENT"

Start-PCXCMContentDistribution -PackageName "VLC-3.0.23-win32"

C:
Remove-Module PCXLab.SCCM -Force
Clear-Host
Import-Module .\src\Modules\PCXLab.SCCM
Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command -Module PCXLab.SCCM

Connect-PCXCMSite

Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\NO PATH\7zip\7zip 26.0.2"

Create-PCXCMApplication -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1"

#Cleanup
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [AVAILABLE]" -Force
Remove-CMApplication -Name "APP Igor Pavlov 7zip 26.0.2" -Force

Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [AVAILABLE]" -Force
Remove-CMPackage -Name "PKG Igor Pavlov 7zip 26.0.2" -Force

Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [AVAILABLE]" -Force
Remove-CMApplication -Name "APP Igor Pavlov 7zip 26.0.1" -Force

Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [AVAILABLE]" -Force
Remove-CMPackage -Name "PKG Igor Pavlov 7zip 26.0.1" -Force

Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip" -Force 
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment" -Force 
Remove-CMFolder -FolderPath "PS1:\Application\Application Installation\Igor Pavlov\7zip" -Force
Remove-CMFolder -FolderPath "PS1:\Application\Application Installation\" -Force # End slash will not work and it will fail
Remove-CMFolder -FolderPath "PS1:\Application\Application Installation" -Force # without end slash it works
Remove-CMFolder -FolderPath "PS1:\Package\Application Installation" -Force # without end slash it works

#########################################


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'Write-PCXLog "BEGIN - PCXLab Automation"|Write-PCXLog "END - www.pcxlab.com"' |
Select Path -Unique


###################################
Start-PCXCMContentDistribution -ApplicationName "APP Igor Pavlov 7zip 26.0.2"
Start-PCXCMContentDistribution -ApplicationName "APP Igor Pavlov 7zip INVALID 01"

Start-PCXCMContentDistribution -PackageName "PKG Igor Pavlov 7zip 26.0.2"
Start-PCXCMContentDistribution -PackageName "APP Igor Pavlov 7zip INVALID 01"


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'BEGIN - PCXLab Automation|END - www.pcxlab.com'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'BEGIN - PCXLab Automation'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'BEGIN - PCXLab Automation|END - www.pcxlab.com'

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Get-PCXApplicationXML.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Get-PCXCMApplication.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Get-PCXOSRequirementOperand.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Import-PCXApplicationList.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\New-PCXOSRequirementRule.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Save-PCXApplicationXML.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Test-PCXOSRequirementExists.ps1


$Root = ".\src\Modules\PCXLab.SCCM\0.11.0"

Get-ChildItem $Root -Recurse -Filter *.ps1 | ForEach-Object {

    $Content = Get-Content $_.FullName -Raw

    if (
        $Content -match 'BEGIN - PCXLab Automation' -or
        $Content -match 'END - www\.pcxlab\.com'
    ) {

        [PSCustomObject]@{
            File = $_.FullName
        }
    }
} | Format-Table -AutoSize

#################################

$Root = ".\src\Modules\PCXLab.SCCM\0.11.0"

Get-ChildItem $Root -Recurse -Filter *.ps1 | ForEach-Object {

    $File = $_.FullName
    $Content = Get-Content $File -Raw

    $Original = $Content

    # BEGIN
    $Content = $Content -replace '
begin\s*\{\s*Write-PCXLog\s*"BEGIN - PCXLab Automation"\s*\}',
@'
begin {

    Write-PCXOperationStart
}
'@

    # END
    $Content = $Content -replace '
end\s*\{\s*Write-PCXLog\s*"END - www\.pcxlab\.com"\s*\}',
@'
end {

    Write-PCXOperationEnd -Status Success
}
'@

    # Simple finally block removal
    $Content = [regex]::Replace(
        $Content,
        'finally\s*\{[^{}]*operation completed[^{}]*\}',
        '',
        'IgnoreCase'
    )

    # Insert failed operation end before throw
    $Content = [regex]::Replace(
        $Content,
        '(Write-PCXLog\s+".*?"\s*"ERROR"\s*)(\r?\n\s*throw)',
        '$1`r`n            Write-PCXOperationEnd -Status Failed$2'
    )

    if ($Content -ne $Original) {

        Set-Content `
            -Path $File `
            -Value $Content `
            -Encoding UTF8

        Write-Host "Updated: $File" -ForegroundColor Green
    }
}

##########################################

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'BEGIN - PCXLab Automation|END - www.pcxlab.com'

###################################################

function Test-EndThrow {

    begin {
        "BEGIN"
    }

    process {

        try {

            throw "Boom"
        }
        catch {

            "CATCH"

            throw
        }
    }

    end {
        "END"
    }
}

try {

    Test-EndThrow
}
catch {
}


function Test-EndBlock {

    begin {
        "BEGIN"
    }

    process {

        try {

            throw "Boom"
        }
        catch {

            return "RETURN FROM CATCH"
        }
    }

    end {
        "END"
    }
}

Test-EndBlock


Get-ChildItem `
    .\src\Modules\PCXLab.SCCM\0.10.0\Public `
    -Recurse `
    -Filter *.ps1 |
Select-String `
    -Pattern 'Write-PCXOperationStart|Write-PCXOperationEnd'

#################

Get-ChildItem `
    .\src\Modules\PCXLab.SCCM\0.10.0 `
    -Recurse `
    -Filter *.ps1 |
Select-String `
    -Pattern 'BEGIN - PCXLab Automation|END - www.pcxlab.com'


(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXLogConfiguration.TerminalAppearance
})

(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXLogConfiguration

    $Global:PCXOperationStack.Count
})

Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force


(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXOperationStack.GetType().FullName

    $Global:PCXOperationStack.Count
})

Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force

(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXOperationStack
})


(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXOperationStack = New-Object System.Collections.Stack

    $Global:PCXOperationStack.Push("Create Package")

    $Global:PCXOperationStack.Peek()

    $Global:PCXOperationStack.Push("Connect SCCM Site")

    $Global:PCXOperationStack.Peek()

    [void]$Global:PCXOperationStack.Pop()

    $Global:PCXOperationStack.Peek()
})




(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXCurrentOperation = "Create Package"

    Write-PCXLog "Parent Step 1"

    $Global:PCXCurrentOperation = "Connect SCCM Site"

    Write-PCXLog "Child Step"

    Write-PCXLog "Parent Step 2"
})





(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXCurrentOperation = "Create Package"

    function Test-PCXLog {

        Write-PCXLog "Package created"

        Write-PCXLog "Something failed" "ERROR"
    }

    Test-PCXLog
})




##########################
(Get-Module PCXLab.SCCM).Invoke({

    function Test-OperationLifecycle {

        begin {

            $OperationSucceeded = $true

            "START"
        }

        process {

            try {

                throw "Boom"
            }
            catch {

                $OperationSucceeded = $false

                "FAILED"

                throw
            }
        }

        end {

            if ($OperationSucceeded) {

                "SUCCESS"
            }
        }
    }

    try {

        Test-OperationLifecycle
    }
    catch {
    }
})
########################
(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXOperationFailed = $false

    function Test-FailureFlag {

        try {

            throw "Boom"
        }
        catch {

            $Global:PCXOperationFailed = $true

            "FAILED"
        }
        finally {

            if (-not $Global:PCXOperationFailed) {
                "SUCCESS"
            }
        }
    }

    Test-FailureFlag
})


##############################
(Get-Module PCXLab.SCCM).Invoke({

    Initialize-PCXLogConfiguration

    function Test-PCXOperationEnd {

        param(
            [ValidateSet('Success','Failed')]
            [string]$Status = 'Success'
        )

        $Operation = 'Test Operation'

        switch ($Status) {

            'Success' {
                Write-Output "COMPLETED - $Operation - www.pcxlab.com"
            }

            'Failed' {
                Write-Output "FAILED - $Operation - www.pcxlab.com"
            }
        }
    }

    Test-PCXOperationEnd -Status Success

    Test-PCXOperationEnd -Status Failed
})



Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force


(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXLogConfiguration

    $Global:PCXOperationNames
})


#####################################

(Get-Module PCXLab.SCCM).Invoke({

    Initialize-PCXLogConfiguration

    function Write-PCXOperationFailed {

        $Operation = Get-PCXOperationName

        Write-PCXLog "FAILED - $Operation - $($Global:PCXLogConfiguration.Website)" "ERROR"
    }

    function Test-PCXFailure {

        try {

            Write-PCXOperationStart

            Write-PCXLog "Step 1"

            throw "Simulated failure"
        }
        catch {

            Write-PCXOperationFailed
        }
        finally {

            Write-PCXOperationEnd
        }
    }

    $Global:PCXOperationNames["Test-PCXFailure"] = "Failure Test"

    Test-PCXFailure
})

###############################
(Get-Module PCXLab.SCCM).Invoke({

    Initialize-PCXLogConfiguration

    function Test-PCXChild {

        begin {
            Write-PCXOperationStart
        }

        process {
            Write-PCXLog "Child work"
        }

        end {
            Write-PCXOperationEnd
        }
    }

    function Test-PCXParent {

        begin {
            Write-PCXOperationStart
        }

        process {

            Write-PCXLog "Parent started"

            Test-PCXChild

            Write-PCXLog "Parent resumed"
        }

        end {
            Write-PCXOperationEnd
        }
    }

    $Global:PCXOperationNames["Test-PCXParent"] = "Parent Operation"
    $Global:PCXOperationNames["Test-PCXChild"]  = "Child Operation"

    Test-PCXParent
})

#########################

(Get-Module PCXLab.SCCM).Invoke({

    Initialize-PCXLogConfiguration

    function Test-PCXLogging {

        begin {
            Write-PCXOperationStart
        }

        process {

            Write-PCXLog "Step 1"

            Write-PCXLog "Step 2"

            Write-PCXLog "Step 3"
        }

        end {
            Write-PCXOperationEnd
        }
    }

    $Global:PCXOperationNames["Test-PCXLogging"] = "Logging Test"

    Test-PCXLogging
})

#################

(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXLogConfiguration
})

(Get-Module PCXLab.SCCM).Invoke({

    Initialize-PCXLogConfiguration

    $Global:PCXLogConfiguration

    $Global:PCXOperationNames
})


(Get-Module PCXLab.SCCM).Invoke({

    Get-Command Initialize-PCXLogConfiguration
})

(Get-Module PCXLab.SCCM).Invoke({

    function Invoke-PCXLoggingTest {

        begin {
            Write-PCXOperationStart
        }

        process {

            Write-PCXLog "Step 1"

            Write-PCXLog "Step 2"

            Write-PCXLog "Step 3"
        }

        end {
            Write-PCXOperationEnd
        }
    }

    $Global:PCXOperationNames["Invoke-PCXLoggingTest"] = "Logging Test"
})


(Get-Module PCXLab.SCCM).Invoke({

    Invoke-PCXLoggingTest
})


(Get-Module PCXLab.SCCM).Invoke({

    $Global:PCXOperationNames
})

Import-Module .\src\Modules\PCXLab.SCCM -Force


Get-Module PCXLab.SCCM
##############
c:
Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force

(Get-Module PCXLab.SCCM).Invoke({
    $Global:PCXLogConfiguration
})

Initialize-PCXLogConfiguration

$Global:PCXLogConfiguration

Write-PCXBanner

function Test-PCXOperation {

    Get-PCXOperationName
}

Test-PCXOperation

Get-ChildItem "C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.8.0" -Recurse |
Where-Object {
    $_.Name -like "*PCXOperation*" -or
    $_.Name -like "*PCXBanner*" -or
    $_.Name -like "*PCXLogConfiguration*"
} |
Select-Object FullName

Get-Command Create-PCXCMPackage | Select-Object Source

(Get-Module PCXLab.SCCM).Invoke({
    Get-Command Get-PCXOperationName
})

Write-PCXOperationStart

Write-PCXOperationStart


Get-PCXOperationName

(Get-Module PCXLab.SCCM).Invoke({

    Initialize-PCXLogConfiguration

    function Test-PCXOperation {
        Get-PCXOperationName
    }

    Test-PCXOperation
})


(Get-Module PCXLab.SCCM).Invoke({

    function Test-PCXOperation {

        Get-PSCallStack |
        Select-Object Command
    }

    Test-PCXOperation
})

##############################


Get-Command -Module PCXLab.SCCM |
Where-Object {
    (Get-Verb).Verb -notcontains ($_.Name.Split('-')[0])
} |
Select-Object Name

Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0" `
    -Recurse `
    -Filter *.ps1 |
Select-String "function .*SCCM"

Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0" `
    -Recurse `
    -Filter *.ps1 |
Select-String "\bNew-SCCM|\bSet-SCCM|\bGet-SCCM|\bStart-SCCM"

Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0" `
    -Recurse `
    -Filter *.ps1 |
Select-String "ContentDistributionForApplication"

Get-Content `
    ".\src\Modules\PCXLab.SCCM\0.7.0\Public\Applications\Create-PCXCMApplication.ps1" |
Select-Object -Skip 145 -First 35


Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0" `
    -Recurse `
    -Filter *.ps1 |
Select-String "ContentDistributionForApplication"


Select-String `
    -Path ".\src\Modules\PCXLab.SCCM\0.7.0\Public\Applications\Create-PCXCMApplication.ps1" `
    -Pattern "ContentDistributionForApplication" `
    -Context 3, 3


Get-ChildItem `
    ".\src\Modules\PCXLab.SCCM\0.7.0" `
    -Recurse `
    -Filter *.ps1 |
Select-String "PCXCMContentDistributionForApplication"

Get-ChildItem `
".\src\Modules\PCXLab.SCCM\0.8.0\Public" `
-Recurse `
-Filter *.ps1 |
Select-String "^function "

Get-ChildItem `
".\src\Modules\PCXLab.SCCM\0.8.0" `
-Recurse `
-Filter *.ps1 |
Select-String "\bGet-PCXPackageInfoFromPathClassic\b"

Get-ChildItem `
".\src\Modules\PCXLab.SCCM\0.8.0" `
-Recurse `
-Filter *.ps1 |
Select-String "\bGet-PCXPackageInfoFromPath\b"

Get-ChildItem `
".\src\Modules\PCXLab.SCCM\0.8.0" `
-Recurse |
Where-Object { $_.Extension -in '.ps1','.psm1','.psd1','.md' } |
Select-String "\bGet-PCXPackageInfoFromPath\b"


Get-ChildItem `
".\src\Modules\PCXLab.SCCM\0.8.0" `
-Recurse `
-Filter *.ps1 |
Select-String "\bGet-PCXCommandLine\b"


Get-ChildItem `
".\src\Modules\PCXLab.SCCM\0.8.0" `
-Recurse `
-Filter *.ps1 |
Select-String "\bGet-PCXInstaller\b"


Get-ChildItem `
".\src\Modules\PCXLab.SCCM\0.8.0" `
-Recurse `
-Filter *.ps1 |
Select-String "\bGet-PCXMetadataFromPath\b"


Get-ChildItem `
".\src\Modules\PCXLab.SCCM\0.8.0" `
-Recurse `
-Filter *.ps1 |
Select-String "Write-Host" |
Select-Object Path,LineNumber,Line




C:
Remove-Module PCXLab.SCCM -Force
Clear-Host
Import-Module .\src\Modules\PCXLab.SCCM
Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command -Module PCXLab.SCCM

Connect-PCXCMSite

Reset-PCXCMConnection

Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\NO PATH\7zip\7zip 26.0.2"

Create-PCXCMApplication -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1"

#Cleanup
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [AVAILABLE]" -Force
Remove-CMApplication -Name "APP Igor Pavlov 7zip 26.0.2" -Force

Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [AVAILABLE]" -Force
Remove-CMPackage -Name "PKG Igor Pavlov 7zip 26.0.2" -Force

Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [AVAILABLE]" -Force
Remove-CMApplication -Name "APP Igor Pavlov 7zip 26.0.1" -Force

Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [AVAILABLE]" -Force
Remove-CMPackage -Name "PKG Igor Pavlov 7zip 26.0.1" -Force

Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip" -Force 
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment" -Force 
Remove-CMFolder -FolderPath "PS1:\Application\Application Installation\Igor Pavlov\7zip" -Force
Remove-CMFolder -FolderPath "PS1:\Application\Application Installation\" -Force # End slash will not work and it will fail
Remove-CMFolder -FolderPath "PS1:\Application\Application Installation" -Force # without end slash it works
Remove-CMFolder -FolderPath "PS1:\Package\Application Installation" -Force # without end slash it works

#################################################

Import-Module .\src\Modules\PCXLab.SCCM -Force

Connect-PCXCMSite

C:

Remove-Module ConfigurationManager -Force

Remove-Module PCXLab.SCCM -Force

Import-Module .\src\Modules\PCXLab.SCCM -Force

Connect-PCXCMSite


Get-Module ConfigurationManager

Connect-PCXCMSite

Get-Module ConfigurationManager

Remove-Module ConfigurationManager -Force

$CMModulePath = Join-Path `
    (Split-Path $ENV:SMS_ADMIN_UI_PATH -Parent) `
    "ConfigurationManager.psd1"

Import-Module $CMModulePath -Force

Get-PSProvider CMSite

Get-PSProvider

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
ForEach-Object {
    $null = $null
    $errors = $null

    [System.Management.Automation.Language.Parser]::ParseFile(
        $_.FullName,
        [ref]$null,
        [ref]$errors
    ) | Out-Null

    if ($errors.Count -gt 0) {
        Write-Host $_.FullName -ForegroundColor Red
        $errors
    }
}

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Create-PCXCMApplication'


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Distribution\Start-PCXCMContentDistribution.ps1

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'SupportContact'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String '\-Owner'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'DeadlineDateTime'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Application created'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Collection created'



$root = ".\src\Modules\PCXLab.SCCM\0.11.0"

Get-ChildItem $root -Recurse -Filter *.ps1 | ForEach-Object {

    $content = Get-Content $_.FullName -Raw

    $content = $content.Replace(
        '`r`n            Write-PCXOperationEnd -Status Failed',
        ''
    )

    $content = $content.Replace(
        '`r`n        Write-PCXOperationEnd -Status Failed',
        ''
    )

    Set-Content $_.FullName $content
}

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Write-PCXOperationEnd -Status Failed'


$root = ".\src\Modules\PCXLab.SCCM\0.11.0"

Get-ChildItem $root -Recurse -Filter *.ps1 | ForEach-Object {

    $content = Get-Content $_.FullName -Raw

    $content = $content -replace '(?m)^\s*Write-PCXOperationEnd\s+-Status\s+Failed\s*\r?\n?', ''

    Set-Content $_.FullName $content
}

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Write-PCXOperationEnd -Status Failed'


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Logging\Write-PCXOperationStart.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Logging\Write-PCXOperationEnd.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Write-PCXLog.ps1


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Write-PCXOperationEnd -Status Failed'


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Write-PCXOperationEnd'

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Logging\Write-PCXOperationStart.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Logging\Write-PCXOperationEnd.ps1

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'New-PCXResultObject'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String '\-Error\s'

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folders\Move-PCXCMCollectionsToFolder.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folders\Move-PCXCMPackageToFolder.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folders\New-PCXCMFolder.ps1

.\src\Modules\PCXLab.SCCM\0.11.0\Public\Folders\Move-PCXCMObject.ps1

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String "moved to"


Get-Command New-CMProgram -Syntax

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Install program created'


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'New-CMProgram'

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Packages\Add-PCXProgram.ps1

cls
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Logging\Write-PCXLog.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Packages\New-PCXDeployments.ps1

Get-Command Get-PCXCMCollection


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'function Get-PCX'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Get-PCXCMCollection'


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Get-PCXCMCollection'

#########################################

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Connect-PCXCMSite'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String '\$null\s*=\s*Connect-PCXCMSite'


cls

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'New-CM|Add-CM|Set-CM|Move-CM|Start-CM'


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Add-PCXDiskSpaceRequirementToDeploymentType.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Add-PCXMemoryRequirementToDeploymentType.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Add-PCXMemoryRequirementToDeploymentType.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Add-PCXDiskSpaceRequirementToDeploymentType.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Add-PCXMemoryRequirementToDeploymentType.ps1

$Root = ".\src\Modules\PCXLab.SCCM\0.11.0"

Get-ChildItem $Root -Recurse -Filter *.ps1 | ForEach-Object {

    $File = $_.FullName

    $Content = Get-Content $File -Raw

    $Original = $Content

    $Content = $Content.Replace(
@'
begin {
    Write-PCXLog "BEGIN - PCXLab Automation"
}
'@,
@'
begin {

    Write-PCXOperationStart
}
'@
    )

    $Content = $Content.Replace(
@'
    begin {
        Write-PCXLog "BEGIN - PCXLab Automation"
    }
'@,
@'
    begin {

        Write-PCXOperationStart
    }
'@
    )

    $Content = $Content.Replace(
@'
end {
    Write-PCXLog "END - www.pcxlab.com"
}
'@,
@'
end {

    Write-PCXOperationEnd -Status Success
}
'@
    )

    $Content = $Content.Replace(
@'
    end {
        Write-PCXLog "END - www.pcxlab.com"
    }
'@,
@'
    end {

        Write-PCXOperationEnd -Status Success
    }
'@
    )

    if ($Content -ne $Original) {

        Set-Content -Path $File -Value $Content -Encoding UTF8

        Write-Host "Updated: $File" -ForegroundColor Green
    }
}


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'catch\s*\{\s*throw'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'Write-PCXOperationEnd -Status Failed'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'BEGIN - PCXLab Automation|END - www.pcxlab.com'


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Add-PCXMemoryRequirementToDeploymentType.ps1

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'BEGIN - PCXLab Automation|END - www.pcxlab.com'


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Applications\New-PCXCMApplicationDeployment.ps1

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'BEGIN - PCXLab Automation|END - www.pcxlab.com'

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Applications\New-PCXCMApplicationDeploymentType.ps1


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'BEGIN - PCXLab Automation|END - www.pcxlab.com'


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'BEGIN - PCXLab Automation|END - www.pcxlab.com'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Where-Object {
    (Get-Content $_.FullName -Raw) -match 'Write-PCXOperationStart' -and
    (Get-Content $_.FullName -Raw) -notmatch 'Write-PCXOperationEnd\s*-Status\s*Failed'
} |
Select-Object -ExpandProperty FullName

cls
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Applications\Add-PCXDiskSpaceRequirementToDeploymentType.ps1


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Where-Object {
    (Get-Content $_.FullName -Raw) -match 'Write-PCXOperationStart' -and
    (Get-Content $_.FullName -Raw) -notmatch 'Write-PCXOperationEnd\s*-Status\s*Failed'
} |
Select-Object -ExpandProperty FullName

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Applications\Add-PCXCMApplicationOSRequirement.ps1

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Where-Object {
    (Get-Content $_.FullName -Raw) -match 'Write-PCXOperationStart' -and
    (Get-Content $_.FullName -Raw) -notmatch 'Write-PCXOperationEnd\s*-Status\s*Failed'
} |
Select-Object -ExpandProperty FullName\


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Packages\New-PCXCMPackage.ps1

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Where-Object {
    (Get-Content $_.FullName -Raw) -match 'Write-PCXOperationStart' -and
    (Get-Content $_.FullName -Raw) -notmatch 'Write-PCXOperationEnd\s*-Status\s*Failed'
} |
Select-Object -ExpandProperty FullName


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Applications\Add-PCXCMApplicationOSRequirementFromCSV.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folders\Move-PCXCMApplicationToFolder.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folders\Move-PCXCMObject.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folders\New-PCXCMFolder.ps1


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String -Pattern 'throw\s*$'

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Where-Object {
    (Get-Content $_.FullName -Raw) -match 'throw\s*$' -and
    (Get-Content $_.FullName -Raw) -notmatch 'Write-PCXOperationEnd\s*-Status\s*Failed'
} |
Select-Object -ExpandProperty FullName

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Where-Object { $_.DirectoryName -match '\\Public\\|\\Private\\' } |
Select-Object -ExpandProperty BaseName |
Sort-Object

$Global:PCXOperationNames.Keys | Sort-Object




cls

