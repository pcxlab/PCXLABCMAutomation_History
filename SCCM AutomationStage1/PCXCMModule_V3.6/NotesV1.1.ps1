Import-Module C:\Developments\Automation\PCXCMModule

New-PCXCMFolder -Path "Package\Applications\AAA\BBB\TTT" -Name "VVV" -AutoCreatePath

Get-ChildItem

Get-CMFolder -FolderPath "PS1:\DeviceCollection" | Select Name, FolderPath
Get-CMFolder -FolderPath "PS1:\Package" | Select Name, FolderPath


Get-ChildItem "PS1:\Package" | Select-Object Name
Get-ChildItem "PS1:\Package" | Select-Object Name
Get-ChildItem "PS1:\Package\Applications" | Select-Object Name
Get-ChildItem "PS1:\Package\QAApps" | Select-Object Name

"\Software Library\Overview\Application Management\Packages\Applications\Google"

New-PCXCMFolder -Path "PS1:\Package\QAApps" -Name "VVV" -AutoCreatePath
New-PCXCMFolder -Path "PS1:\Package\QAApps\MyApps\One" -AutoCreatePath


New-PCXCMCollectionInFolder -CollectionName "AAAAAA" -LimitingCollection "All Systems" -FolderPath "Package\QAApps\mx" -AutoCreateFolder

Remove-Module PCXCMModule

Import-Module C:\Developments\Automation\PCXCMModule_V3.1\PCXCMModule.psm1

Get-Module PCXCMModule

New-PCXCMFolder -Path "\DeviceCollection\" -Name "AAA" -AutoCreatePath

Connect-PCXCMSite

New-PCXCMFolder -Path "DeviceCollection\Test" -Name "BCA" -AutoCreatePath

New-PCXCMFolder -Path "PS1:\DeviceCollection\Deployments\asdf\d" -Name "BCA" -AutoCreatePath

Get-PCXCMSiteCode
Get-Command -Module PCXCMModule
Get-Command -Module PCXCMModule | Select-Object Name


Get-PCXCMProviderMachineName 
Get-PCXCMSiteCode            
Get-PCXShortMonthName        
Get-PCXSystemFQDN            
Get-PCXYearMonth             

Import-Module "C:\Developments\Automation\PCXCMModule_V3.1\PCXCMModule.psm1" -Force

Import-Module "C:\Developments\Automation\PCXCMModule_V3.2_FoldIssueFixed\PCXCMModule.psm1" -Force

Get-Module PCXCMModule

Connect-PCXCMSite

New-PCXCMFolder -Path "\DeviceCollection\Deployments\asdf\d" -Name "BCA" -AutoCreatePath



########################

Import-Module ($ENV:SMS_ADMIN_UI_PATH + "\..\ConfigurationManager.psd1")

cd PS1:

Get-PSDrive


<#
if (-not (Get-PSDrive -Name $siteCode -ErrorAction SilentlyContinue)) {
    Write-Verbose "PSDrive $siteCode not found. Attempting to load ConfigurationManager module..."

    try {
        Import-Module ($ENV:SMS_ADMIN_UI_PATH + "\..\ConfigurationManager.psd1") -ErrorAction Stop
        Set-Location "$siteCode`:" -ErrorAction Stop
    }
    catch {
        throw "PSDrive '$siteCode' not found and auto-load failed. Ensure ConfigurationManager console is installed."
    }
}
#>






#1. Standard PSDrive paths
# Normal path with Name
New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFolder" -Name "Child"

# Trailing backslash
New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFolder\" -Name "Child"

# Nested folder creation
New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFolder\Tree" -Name "Leaf"

#2. Paths without PSDrive (function should auto-detect SiteCode)
# Relative path, no PSDrive prefix
New-PCXCMFolder -Path "\DeviceCollection\RootFolder\SubFolder" -Name "Child"

# Nested path without PSDrive
New-PCXCMFolder -Path "DeviceCollection\RootFolder\SubFolder\Tree" -Name "Leaf"

#3. Paths without -Name (full path creation)
# Only ensure full path exists
New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFolder\Tree"

# Without trailing backslash
New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFolder\Tree2"

#4. Edge cases / input validation
# Empty path (should fail)
New-PCXCMFolder -Path "" -Name "Child"

# Name is whitespace (should fail)
New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFolder" -Name "   "

# Path with multiple consecutive backslashes
New-PCXCMFolder -Path "PS1:\DeviceCollection\\RootFolder\\SubFolder" -Name "Child"

#5. Existing folders
# Path and Name already exist (should not throw an error)
New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFolder" -Name "Child"

# Existing nested folders (should skip creation and report verbose)
New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFolder\Tree" -Name "Leaf"

#6. Invalid PSDrive
# PSDrive that does not exist
New-PCXCMFolder -Path "PX1:\DeviceCollection\RootFolder" -Name "Child"

#This will test your error handling for missing PSDrive.

#✅ Tips for testing
#Use -Verbose to see each step:
#New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFolder" -Name "Child" -Verbose
#Use -WhatIf to simulate folder creation without touching SCCM:
#New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFolder" -Name "Child" -WhatIf
#Test in different sessions, especially for paths without PSDrive, to ensure your SiteCode detection works.








