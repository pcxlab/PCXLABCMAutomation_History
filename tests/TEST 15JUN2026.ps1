
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
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.81" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs")
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.82" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.83" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.84" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.85" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Goga Chromu 145.0.7632.86" -DistributionPointGroups "All Bangalore DPs" -DistributionPoints @("CM01.CORP.PCXLAB.COM")
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.54"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.55"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.56"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.57"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.58"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.59"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.60"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.61"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.62"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.63" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.64" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.65" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.66" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.67" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.68" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.69" -DistributionPointGroups @("All Mangalore DPs", "All Bangalore DPs") -DistributionPoints "CM01.CORP.PCXLAB.COM"

Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v0.11.0_Backup27_26.06.13.12 Package workflow stable\PCXLab.SCCM.psd1"

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-CMPackage -Name"

Please show:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Add-PCXCMPackageProgram.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Package\Add-PCXCMPackageProgram.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\New-PCXCMFolder.ps1

$Result = Measure-Command {
    New-CMProgram -PackageName "TEST" -StandardProgramName "TEST" -CommandLine "cmd.exe"
}
$Result


$Result = Measure-Command { New-Item -Path "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome" -Name "PCXLabFolderTest2" -ItemType Directory }; $Result

$Result = Measure-Command { Test-Path "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome\PCXLabFolderTest2" }; $Result

$Result = Measure-Command { Get-CMFolder -FolderPath "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome\PCXLabFolderTest2" }; $Result


$ResultDistribution = Start-PCXCMContentDistribution -PackageName "PKG 7Zip" -DistributionPointGroups "All Mangalore DPs"

$ResultDistribution | Format-List *

$ResultDistribution = Start-PCXCMContentDistribution -PackageName "PKG 7Zip" -DistributionPointGroups @(
    "All Mangalore DPs",
    "All Bangalore DPs"
)

$ResultDistribution | Format-List *

$ResultDPGroups = Get-CMDistributionPointGroup

$ResultDPGroups | Select-Object Name

$ResultDPGroup = New-CMDistributionPointGroup -Name "All Bangalore DPs"

$ResultDPGroup

$ResultDPGroup = New-CMDistributionPointGroup -Name "TEST DP GROUP"

$ResultDPGroup



$ResultDPGroup = Get-CMDistributionPointGroup -Name "All Bangalore DPs"

$ResultDPGroup | Format-List *


$ResultPackages = Get-CMPackage | Select-Object Name, PackageID

$ResultPackages


New-Item -Path C:\Temp\PCXLabTestPackage -ItemType Directory -Force
New-Item -Path C:\Temp\PCXLabTestPackage\ReadMe.txt -ItemType File -Force

$ResultPackage = New-CMPackage -Name "PKG TEST CONTENT DISTRIBUTION" -Path "C:\Temp\PCXLabTestPackage"

$ResultPackage


$ResultDistribution = Start-PCXCMContentDistribution `
    -PackageName "PKG Igor Pavlov 7zip 26.0.0" `
    -DistributionPointGroups @(
    "All Mangalore DPs",
    "All Bangalore DPs"
)

$ResultDistribution | Format-List *


$ResultDistribution = Start-PCXCMContentDistribution `
    -PackageName "PKG Google Chrome 145.0.7632.59" `
    -DistributionPointGroups @(
    "All Mangalore DPs",
    "All Bangalore DPs"
)

$ResultDistribution | Format-List *




$ResultDistribution = Start-PCXCMContentDistribution `
    -PackageName "VLC-3.0.23-win32" `
    -DistributionPointGroups @(
    "All Mangalore DPs",
    "All Bangalore DPs"
)

$ResultDistribution | Format-List *

$ResultDP = Get-CMDistributionPoint

$ResultDP | Format-List *

$ResultPackage = Start-CMContentDistribution -PackageName "PKG Google Chrome 145.0.7632.64" -DistributionPointName "CM01.CORP.PCXLAB.COM"



$Result = Start-PCXCMContentDistribution -PackageName "PKG Google Chrome 145.0.7632.59" -DistributionPointGroups "All Mangalore DPs"

Get-Help Add-CMScriptDeploymentType -Full