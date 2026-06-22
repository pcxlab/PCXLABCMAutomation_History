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






