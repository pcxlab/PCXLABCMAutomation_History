Get-ChildItem `
    C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 `
    -Recurse -Filter *.ps1 |
Select-String "WARN"


Get-ChildItem `
    C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 `
    -Recurse -Filter *.ps1 |
Select-String "ForegroundColor"


Get-ChildItem `
    C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 `
    -Recurse -Filter *.ps1 |
Select-String "Write-PCXLog"


Get-ChildItem `
    C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 `
    -Recurse -Filter *.ps1 | Select-String "WARN"

Get-ChildItem `
    C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 `
    -Recurse -Filter *.ps1 | Select-String "WARNING"

Get-ChildItem `
    C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 `
    -Recurse -Filter *.ps1 | Select-String "-Level WARN"


Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String '"WARN"'


Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String "'WARN'"


C:
Remove-Module PCXLab.SCCM -Force
Remove-Module PCXLab.SCCM
Clear-Host
Import-Module .\src\Modules\PCXLab.SCCM
#Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command -Module PCXLab.SCCM

Connect-PCXCMSite

Reset-PCXCMConnection

Ensure-PCXCMConnection

Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\NO PATH\7zip\7zip 26.0.2"

Create-PCXCMApplication -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1"

Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0"


#Cleanup
Remove-CMDeviceCollection -Name "PKG Google Chrome 145.0.7632.46 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Google Chrome 145.0.7632.46 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "PKG Google Chrome 145.0.7632.46 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Google Chrome 145.0.7632.46 [AVAILABLE]" -Force
Remove-CMApplication -Name "PKG Google Chrome 145.0.7632.46" -Force
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\APP Google Chrome 145.0.7632.46" -Force 



#Cleanup
Remove-CMDeviceCollection -Name "APP Google Chrome 145.0.7632.46 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Google Chrome 145.0.7632.46 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "APP Google Chrome 145.0.7632.46 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Google Chrome 145.0.7632.46 [AVAILABLE]" -Force
Remove-CMApplication -Name "APP Google Chrome 145.0.7632.46" -Force


#Cleanup
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.0 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.0 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.0 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.0 [AVAILABLE]" -Force
Remove-CMApplication -Name "APP Igor Pavlov 7zip 26.0.0" -Force

#Cleanup
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.2 [AVAILABLE]" -Force
Remove-CMApplication -Name "APP Igor Pavlov 7zip 26.0.2" -Force

Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "APP Igor Pavlov 7zip 26.0.1 [AVAILABLE]" -Force
Remove-CMApplication -Name "APP Igor Pavlov 7zip 26.0.1" -Force

Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.0 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.0 [EXCLUDE]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.0 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.0 [AVAILABLE]" -Force
Remove-CMPackage -Name "PKG Igor Pavlov 7zip 26.0.0" -Force
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.0" -Force 

Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.1 [AVAILABLE]" -Force
Remove-CMPackage -Name "PKG Igor Pavlov 7zip 26.0.1" -Force
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.1" -Force 

Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [INSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [EXCEPTION]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [UNINSTALL]" -Force
Remove-CMDeviceCollection -Name "PKG Igor Pavlov 7zip 26.0.2 [AVAILABLE]" -Force
Remove-CMPackage -Name "PKG Igor Pavlov 7zip 26.0.2" -Force
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.2" -Force 
Remove-CMFolder -FolderPath "PS1:\Package\Application Installation\Igor Pavlov\7zip" -Force # without end slash it works


Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.1" -Force 
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\APP Igor Pavlov 7zip 26.0.1" -Force 
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\PKG Igor Pavlov 7zip 26.0.2" -Force 
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip\APP Igor Pavlov 7zip 26.0.2" -Force 

Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment\Igor Pavlov\7zip" -Force 
Remove-CMFolder -FolderPath "PS1:\DeviceCollection\Mphasis Application Deployment" -Force 
Remove-CMFolder -FolderPath "PS1:\Application\Application Installation\Igor Pavlov\7zip" -Force
Remove-CMFolder -FolderPath "PS1:\Application\Application Installation\" -Force # End slash will not work and it will fail
Remove-CMFolder -FolderPath "PS1:\Application\Application Installation" -Force # without end slash it works
Remove-CMFolder -FolderPath "PS1:\Package\Application Installation" -Force # without end slash it works


Test-Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"
Get-Item "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"
C:

# Example: Update a deployment for a package
Set-CMPackageDeployment -PackageId "ABC00012" -SendWakeupPacket $true -AllowMeteredNetwork $true

Get-CMPackageDeployment -PackageId "ABC00012" | Select PackageID, SendWakeupPacket, AllowMeteredNetwork


# Trigger content distribution
Start-CMContentDistribution -PackageId "ABC00012" -DistributionPointName "DP01.contoso.com"
Start-CMContentDistribution -PackageName "VLC-3.0.23-win32" -DistributionPointGroupName "All Mangalore DPs"
Set-CMPackageDeployment -PackageName "VLC-3.0.23-win32" -SendWakeupPacket $true -AllowMeteredNetwork $true
# Then configure deployment settings
Set-CMPackageDeployment -PackageId "ABC00012" -SendWakeupPacket $true -AllowMeteredNetwork $true

New-CMDeployment -PackageName "VLC-3.0.23-win32" -CollectionName "VLC-3.0.23-win32" -SendWakeupPacket $true -AllowMeteredNetwork $true
-PackageId "ABC00012" `
    -CollectionName "All Workstations" `
    -SendWakeupPacket $true `
    -AllowMeteredNetwork $true `
    -DeployPurpose Available

New-CMDeployment -PackageId "ABC00012" `
    -CollectionName "All Workstations" `
    -SendWakeupPacket $true `
    -AllowMeteredNetwork $true `
    -DeployPurpose Available


.\UI\Start-PCXLabSCCMUI.ps1
.\UI\PCXLab.SCCM.UI\Start-PCXLabSCCMUI.ps1

.\UI\PCXLab.SCCM.UI\Start-PCXLabSCCMUI.ps1


.\UI\PCXLab.SCCM.UI\Start-PCXLabSCCMUI.ps1

Get-Module PCXLab.SCCM -ListAvailable

Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0

tree C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 /f

Get-Module PCXLab.SCCM | Select-Object Name, Version, Path

(Get-Command Create-PCXCMPackage).ScriptBlock.File

Get-Module PCXLab.SCCM | Format-Table Name, Version, Path

Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM -Directory | Select-Object Name

c:
Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src -Recurse -Filter *.ps1 | Select-String 'Write-PCXLog.*"WARNING"'
Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src -Recurse -Filter *.ps1 | Select-String 'Write-PCXLog.*"ERROR"'
Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src -Recurse -Filter *.ps1 | Select-String 'Write-PCXLog.*"DEBUG"'


Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String 'Write-PCXLog.*"ERROR"'



Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String 'Write-PCXLog.*"ERROR"'

Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | ForEach-Object { $Content = Get-Content $_.FullName -Raw; $Content = $Content -replace 'Write-PCXLog\s+"([^"]*)"\s+"ERROR"', 'Write-PCXLog -Message "$1" -Level ERROR'; Set-Content $_.FullName $Content }

Get-ChildItem C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String 'Write-PCXLog.*"ERROR"'


Get-ChildItem `
    'C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0' `
    -Recurse `
    -Filter *.ps1 |
Select-String '"ERROR"'

Get-ChildItem `
    'C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0' `
    -Recurse `
    -Filter *.ps1 |
Select-String 'Write-PCXLog'

Get-ChildItem `
    'C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0' `
    -Recurse `
    -Filter *.ps1 |
Select-String 'Write-PCXLog.*ERROR'

Get-ChildItem `
    'C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0' `
    -Recurse `
    -Filter *.ps1 |
Select-String 'Write-PCXLog.*-Level'

Get-ChildItem -Path 'C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0'  -Recurse -Include *.ps1, *.psm1, *.psd1 |
Select-String -Pattern '-CMCollection'


(Get-Module ConfigurationManager).Version

Get-Command New-CMCollection
Get-Command New-CMDeviceCollection

Get-Module ConfigurationManager


Connect-PCXCMSite

Get-CMSite


C:
Remove-Module PCXLab.SCCM -Force
Remove-Module PCXLab.SCCM
Clear-Host
Import-Module .\src\Modules\PCXLab.SCCM
#Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command -Module PCXLab.SCCM

Connect-PCXCMSite

Reset-PCXCMConnection


Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.2"

Create-PCXCMPackage -Path "\\192.168.25.214\Package_source\Applications\Igor Pavlov\7zip\7zip 26.0.1"

Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Igor Pavlov\7zip\7zip 26.0.0"



    if (-not $DeadlineTime) {
        $DeadlineTime = (Get-Date -Hour 20 -Minute 0 -Second 0).AddDays(30)
    }

    $schedule = New-CMSchedule -Start $DeadlineTime -Nonrecurring

    $null = New-CMPackageDeployment `
        -StandardProgram `
        -PackageName "PKG Igor Pavlov 7zip 26.0.0" `
        -ProgramName "PKG Igor Pavlov 7zip 26.0.0 [Install]" `
        -DeployPurpose Required `
        -CollectionName "PKG Igor Pavlov 7zip 26.0.0 [Install]" `
        -Schedule $schedule `
        -FastNetworkOption DownloadContentFromDistributionPointAndRunLocally `
        -SlowNetworkOption DoNotRunProgram `
        -SendWakeupPacket $true 

Set-CMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.0" -SendWakeupPacket $true -AllowMeteredNetwork $true
Set-CMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.0" -AllowMeteredNetwork $true

Set-CMPackageDeployment -PackageName "PKG Igor Pavlov 7zip 26.0.0" -StandardProgramName "PKG Igor Pavlov 7zip 26.0.0 [Install]" -UseMeteredNetwork $true -CollectionName "PKG Igor Pavlov 7zip 26.0.0 [Install]"

        
        `
        -AllowMeteredNetwork $true

    $null = New-CMPackageDeployment `
        -StandardProgram `
        -PackageName $PackageName `
        -ProgramName $Programs.Uninstall `
        -DeployPurpose Required `
        -CollectionName $Collections.Uninstall `
        -Schedule $schedule `
        -FastNetworkOption DownloadContentFromDistributionPointAndRunLocally `
        -SlowNetworkOption DoNotRunProgram `
        -SendWakeupPacket $true `
        -AllowMeteredNetwork $true 


        
# Trigger content distribution
Start-CMContentDistribution -PackageId "ABC00012" -DistributionPointName "DP01.contoso.com"
Start-CMContentDistribution -PackageName "VLC-3.0.23-win32" -DistributionPointGroupName "All Mangalore DPs"
Set-CMPackageDeployment -PackageName "VLC-3.0.23-win32" -SendWakeupPacket $true -AllowMeteredNetwork $true
# Then configure deployment settings
Set-CMPackageDeployment -PackageId "ABC00012" -SendWakeupPacket $true -AllowMeteredNetwork $true

New-CMDeployment -PackageName "VLC-3.0.23-win32" -CollectionName "VLC-3.0.23-win32" -SendWakeupPacket $true -AllowMeteredNetwork $true


Get-ChildItem -Path C:\Projects\PCXLABCMAutomation_ADDOSREQ\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File |
    Select-String -Pattern 'EXCEPTION' |
    Select-Object Path, LineNumber, Line







