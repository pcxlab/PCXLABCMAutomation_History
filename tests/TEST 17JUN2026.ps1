
#tree .\src\Modules\PCXLab.SCCM\0.11.0 /f
#Clear-Host
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue
Import-Module .\src\Modules\PCXLab.SCCM # -Force
Connect-PCXCMSite
#Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplication.ps1'
#Get-Command -Module PCXLab.SCCM
##############################################################################

#######################################
#tree .\src\Modules\PCXLab.SCCM\0.11.0 /f
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
#Clear-Host
 # -Force
Connect-PCXCMSite
#Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplication.ps1'
#Get-Command -Module PCXLab.SCCM
##############################################################################

#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.54"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.55"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.56"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.57"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.58"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.59"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.60"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.61"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.62"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.63"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.64"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.65"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.66"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.67"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.68"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.69"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.70"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.71"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.72"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.73"
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.74"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.77"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.78"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.79"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.80" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.81" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.82" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.83" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.84" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.86" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.87" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.88" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.89" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.90" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.91" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.92" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.93" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.94" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.95" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.96" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.97" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.54"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.55"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.56"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.57"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.58"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.59"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.60"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.61"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.62"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.63" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.64" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.65" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.66" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.67" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.68" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.69" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.70" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")

Get-Help Add-CMScriptDeploymentType 

Run this manually:

$ResultApp = Get-CMApplication -Name "APP Google Chrome 145.0.7632.85"
$ResultApp | Format-List LocalizedDisplayName,CI_ID

Then:

$ResultDetection = New-PCXCMApplicationDetectionClause -Installer (Get-Item "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85\googlechromesta.exe")
$ResultDetection.GetType().FullName



$ResultApp = Get-CMApplication -Name "APP Google Chrome 145.0.7632.85"

I want you to test this exact command

Use the existing application:

$ResultApp = Get-CMApplication -Name "APP Google Chrome 145.0.7632.85"

Then:


$ResultDetection | Format-List *

Add-CMScriptDeploymentType `
    -ApplicationName $ResultApp.LocalizedDisplayName `
    -DeploymentTypeName "TEST DT" `
    -InstallCommand "googlechromesta.exe /S" `
    -ContentLocation "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85" `
    -InstallationBehaviorType InstallForSystem `
    -LogonRequirementType WhetherOrNotUserLoggedOn

Notice: no detection clause at all.

#

Create a known-good SCCM detection clause directly:

$ResultDetection = New-CMDetectionClauseFile `
    -Path "C:\Windows" `
    -FileName "explorer.exe" `
    -Existence

Then:

$ResultApp = Get-CMApplication -Name "APP Google Chrome 145.0.7632.85"

$ResultDT = Add-CMScriptDeploymentType `
    -ApplicationName $ResultApp.LocalizedDisplayName `
    -DeploymentTypeName "TEST DT 2" `
    -InstallCommand "googlechromesta.exe /S" `
    -ContentLocation "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85" `
    -AddDetectionClause $ResultDetection `
    -InstallationBehaviorType InstallForSystem `
    -LogonRequirementType WhetherOrNotUserLoggedOn `
    -Verbose

If that succeeds, then your problem is definitely inside:

$ResultDetection = New-CMDetectionClauseFile -Path "C:\Windows" -FileName "explorer.exe" -Existence
$ResultDetection | Format-List *

$ResultDT = Get-CMDeploymentType -ApplicationName "APP Google Chrome 145.0.7632.85"
$ResultDT | Select-Object LocalizedDisplayName


$ResultApp = Get-CMApplication -Name "APP Google Chrome 145.0.7632.85"
$ResultApp | Select-Object LocalizedDisplayName,NumberOfDeployments

$ResultDetection = New-PCXCMApplicationDetectionClause -Installer (Get-Item "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85\googlechromesta.exe")

$ResultDT = Add-CMScriptDeploymentType `
    -ApplicationName "APP Google Chrome 145.0.7632.85" `
    -DeploymentTypeName "APP Google Chrome 145.0.7632.85 DT" `
    -InstallCommand "googlechromesta.exe /S" `
    -ContentLocation "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85" `
    -AddDetectionClause $ResultDetection `
    -InstallationBehaviorType InstallForSystem `
    -LogonRequirementType WhetherOrNotUserLoggedOn `
    -Verbose


##########################


$ResultDT = Get-CMDeploymentType -ApplicationName "APP Google Chrome 145.0.7632.78"
$ResultDT | Select-Object LocalizedDisplayName


$ResultApp = Get-CMApplication -Name "APP Google Chrome 145.0.7632.78"
$ResultApp | Select-Object LocalizedDisplayName,NumberOfDeployments

$ResultDT = Get-CMDeploymentType -ApplicationName "APP Google Chrome 145.0.7632.85"
$ResultDT | Select-Object LocalizedDisplayName


$ResultInstaller = Get-ChildItem "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85" -File

$ResultInstaller | Select-Object Name,Extension


$ResultDeploymentType = New-PCXCMApplicationDeploymentType `
    -Name "APP TEST EXE DIAGNOSTIC" `
    -InstallationFileLocation "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85\googlechromesta.exe"
