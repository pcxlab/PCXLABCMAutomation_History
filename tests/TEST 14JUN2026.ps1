
#tree .\src\Modules\PCXLab.SCCM\0.11.0 /f
#Clear-Host
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue
Import-Module .\src\Modules\PCXLab.SCCM # -Force
Connect-PCXCMSite
#Get-Command -Module PCXLab.SCCM
##############################################################################

Please show these functions:

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMDeploymentCollectionNames.ps1'
Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageProgramNames.ps1'
Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCMDeploymentCollections.ps1'

I want to verify:

Before We Rename

I recommend we review the actual code first for these 4 functions.

Please provide:

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMDeploymentCollectionNames.ps1'
Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCMDeploymentCollections.ps1'
Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageProgramNames.ps1'
Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Cache\Get-PCXCMPackageCached.ps1'
Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Get-PCXCMPackageCached.ps1'


###################################################################

# lets do it please 

# I would do this in two phases.

# Phase 1 - Rename Functions (Low Risk)

# Let's finish the naming first.

# 1. Get-PCXCMDeploymentCollectionNames → New-PCXCMDeploymentCollectionNames
# A - Rename File
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMDeploymentCollectionNames.ps1' `
    'New-PCXCMDeploymentCollectionNames.ps1'

#B - Rename Function
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCMDeploymentCollectionNames.ps1') `
    -replace 'function Get-PCXCMDeploymentCollectionNames', 'function New-PCXCMDeploymentCollectionNames' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCMDeploymentCollectionNames.ps1'

#C - Rename Callers
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
        -replace '\bGet-PCXCMDeploymentCollectionNames\b', 'New-PCXCMDeploymentCollectionNames' |
    Set-Content $_.FullName
}

#D - Verify
$ResultDeploymentCollectionNames = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String '\bGet-PCXCMDeploymentCollectionNames\b'

$ResultDeploymentCollectionNames

#2. New-PCXCMDeploymentCollections → New-PCXCMDeploymentDeviceCollections
# A - Rename File
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCMDeploymentCollections.ps1' `
    'New-PCXCMDeploymentDeviceCollections.ps1'

#B - Rename Function
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCMDeploymentDeviceCollections.ps1') `
    -replace 'function New-PCXCMDeploymentCollections', 'function New-PCXCMDeploymentDeviceCollections' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCMDeploymentDeviceCollections.ps1'

#C - Rename Callers
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
        -replace '\bNew-PCXCMDeploymentCollections\b', 'New-PCXCMDeploymentDeviceCollections' |
    Set-Content $_.FullName
}

#D - Update Logging
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Logging\Initialize-PCXLogConfiguration.ps1') `
    -replace '"New-PCXCMDeploymentCollections"', '"New-PCXCMDeploymentDeviceCollections"' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Logging\Initialize-PCXLogConfiguration.ps1'

#E - Verify
$ResultDeploymentCollections = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String '\bNew-PCXCMDeploymentCollections\b'

$ResultDeploymentCollections

#3. Get-PCXCMPackageProgramNames → New-PCXCMPackageProgramNames

#A - Rename File
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageProgramNames.ps1' `
    'New-PCXCMPackageProgramNames.ps1'

#B - Rename Function
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\New-PCXCMPackageProgramNames.ps1') `
    -replace 'function Get-PCXCMPackageProgramNames', 'function New-PCXCMPackageProgramNames' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\New-PCXCMPackageProgramNames.ps1'

#C - Rename Callers
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
        -replace '\bGet-PCXCMPackageProgramNames\b', 'New-PCXCMPackageProgramNames' |
    Set-Content $_.FullName
}

#D - Verify
$ResultPackageProgramNames = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String '\bGet-PCXCMPackageProgramNames\b'

$ResultPackageProgramNames

#4. Get-PCXCMPackageCached → Get-PCXCMCachedPackage
#A - Rename File
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Get-PCXCMPackageCached.ps1' `
    'Get-PCXCMCachedPackage.ps1'

#B - Rename Function
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Get-PCXCMCachedPackage.ps1') `
    -replace 'function Get-PCXCMPackageCached', 'function Get-PCXCMCachedPackage' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Get-PCXCMCachedPackage.ps1'

#C - Rename Callers
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
        -replace '\bGet-PCXCMPackageCached\b', 'Get-PCXCMCachedPackage' |
    Set-Content $_.FullName
}

#D - Verify
$ResultCachedPackage = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String '\bGet-PCXCMPackageCached\b'

$ResultCachedPackage

#Phase 2 - Create Cache Folder (After Verification)
#Don't move cache files yet.

#First complete all 4 renames and verify module import works.

#Then we'll do the folder refactor:

Private\Core\
↓

Private\Cache\

#for all cache-related functions in one controlled move. That is lower risk and easier to verify.


Get-Command -Module PCXLab.SCCM |
Where-Object Name -match 'DeploymentCollectionNames|DeploymentDeviceCollections|PackageProgramNames|CachedPackage'

Expected Output:


New-Item `
    -Path '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Cache' `
    -ItemType Directory `
    -Force


Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core' |
Where-Object Name -match 'Cache|Cached'



######################################

#Step 1 - Move ONLY ONE File First

#Let's verify the module loading behavior before moving everything.

#Move:

#Get-PCXCMCachedPackage.ps1

#only.

#Move File
Move-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Get-PCXCMCachedPackage.ps1' `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Cache\'
#Verify File Exists
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Cache' |
Where-Object Name -eq 'Get-PCXCMCachedPackage.ps1'

Paste the output.

If that looks good, we'll do:

Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM -Force

Get-Command -Module PCXLab.SCCM Get-PCXCMCachedPackage

If the command still loads correctly, then we know the recursive module loader handles folder moves exactly as expected.

Then we'll move the remaining 14 cache

#################################


Move the entire cache subsystem in one change.

These files belong together:

Get-PCXCMCache.ps1
Get-PCXCMCachedApplication.ps1
Get-PCXCMCachedCollection.ps1
Get-PCXCMCachedDeployment.ps1
Get-PCXCMCachedDistributionStatus.ps1
Get-PCXCMCachedTaskSequence.ps1
Get-PCXCMCachedTaskSequenceDeployment.ps1
Get-PCXCMCachePath.ps1
Get-PCXCMCacheStatus.ps1
Initialize-PCXCMRuntimeCache.ps1
Save-PCXCMCache.ps1
Test-PCXCMCacheExists.ps1
Test-PCXCMCacheExpired.ps1
Update-PCXCMCache.ps1

(Get-PCXCMCachedPackage.ps1 is already moved.)

Move Remaining Cache Files
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core' |
Where-Object Name -match 'Cache|Cached' |
Move-Item -Destination '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Cache'
Verify Core Folder Cleanup
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core' |
Where-Object Name -match 'Cache|Cached'

Expected:

# no output
Verify Cache Folder
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Cache' |
Select-Object Name

Expected:

All cache-related files in one place.

Then Review Core Folder

After the cache move, I would stop and review:

Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core' |
Select-Object Name

before making any more structural changes.

The reason is that once Cache is extracted, we can determine whether:

Core

still makes sense as a folder, or whether remaining files should be redistributed into:

Conne


Next Step

Let's first see whether those functions are simple object helpers.

Please run:

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Test-PCXCMApplicationExists.ps1'
Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Test-PCXCMCollectionExists.ps1'
Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Test-PCXCMPackageExists.ps1'

After reviewing those three, I'll tell you whether they should simply be moved or whether there are additional naming improvements to make at the same time.


###########################33333333333333333333333333333


PS C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY>
PS C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY> Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Test-PCXCMApplicationExists.ps1'
Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Test-PCXCMCollectionExists.ps1'
Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Test-PCXCMPackageExists.ps1'

function Test-PCXCMApplicationExists {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$ApplicationName
    )

    try {

        return $null -ne (
            Get-PCXCMCachedApplication |
            Where-Object {
                $_.LocalizedDisplayName -eq $ApplicationName
            } |
            Select-Object -First 1
        )
    }
    catch {

        Write-PCXLog 
        -Message $_.Exception.Message 
        -Level ERROR

        throw
    }
}
function Test-PCXCMCollectionExists {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$CollectionName
    )

    try {

        return $null -ne (
            Get-PCXCMCachedCollection |
            Where-Object {
                $_.Name -eq $CollectionName
            } |
            Select-Object -First 1
        )
    }
    catch {

        Write-PCXLog 
        -Message $_.Exception.Message 
        -Level ERROR

        throw
    }
}
function Test-PCXCMPackageExists {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$PackageName
    )

    try {

        return $null -ne (
            Get-PCXCMCachedPackage |
            Where-Object {
                $_.Name -eq $PackageName
            } |
            Select-Object -First 1
        )
    }
    catch {

        Write-PCXLog 
        -Message $_.Exception.Message 
        -Level ERROR

        throw
    }
}
PS C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY>

After reviewing the actual code, I would not rename these functions.

Current names are good:

Test-PCXCMApplicationExists
Test-PCXCMCollectionExists
Test-PCXCMPackageExists

They do exactly what they say.

What I Would Change

Only folder location.

Move
Private\Core\Test-PCXCMApplicationExists.ps1

↓

Private\Application\Test-PCXCMApplicationExists.ps1
Move
Private\Core\Test-PCXCMCollectionExists.ps1

↓

Private\Collection\Test-PCXCMCollectionExists.ps1
Move
Private\Core\Test-PCXCMPackageExists.ps1

↓

Private\Package\Test-PCXCMPackageExists.ps1
Why

These functions are not:

Framework
Runtime
Configuration
Logging
Reporting

They are:

Application helper
Collection helper
Package helper

So they belong with their object type.

Commands

Move-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Test-PCXCMApplicationExists.ps1' `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\'
Move-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Test-PCXCMCollectionExists.ps1' `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\'
Move-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Test-PCXCMPackageExists.ps1' `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\'
Verify
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core' |
Where-Object Name -match 'Exists'

Expected:

# no output

After that, show me the updated Core folder:

Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Core' |
Select-Object Name

#Then we'll decide whether Core should stay as-is or whether there are still a few files that 


#tree .\src\Modules\PCXLab.SCCM\0.11.0 /f
#Clear-Host
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue
Import-Module .\src\Modules\PCXLab.SCCM # -Force
Connect-PCXCMSite
#Get-Command -Module PCXLab.SCCM
##############################################################################


Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.51"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.51"


#Verify all cache commands still exist
Get-Command -Module PCXLab.SCCM |
Where-Object Name -match 'Cache|Cached'

#Verify all renamed commands still exist
Get-Command -Module PCXLab.SCCM |
Where-Object Name -match 'DeploymentCollectionNames|DeploymentDeviceCollections|PackageProgramNames|UpgradeSupported'

#Verify no duplicate commands exist
Get-Command -Module PCXLab.SCCM |
Group-Object Name |
Where-Object Count -gt 1

Expected:


#########################################

Terminal 4 - Cache Commands Smoke Test
$ResultPackages = Get-PCXCMCachedPackage
$ResultPackages.Count
$ResultApplications = Get-PCXCMCachedApplication
$ResultApplications.Count
$ResultCollections = Get-PCXCMCachedCollection
$ResultCollections.Count
$ResultDeployments = Get-PCXCMCachedDeployment
$ResultDeployments.Count

Expected:

######################################

Terminal 5 - Renamed Function Validation

Collection name generation:

$ResultCollectionNames = New-PCXCMDeploymentCollectionNames -ObjectName 'Chrome Test'

$ResultCollectionNames | Format-List

Expected:

Available : Chrome Test [AVAILABLE]
Install   : Chrome Test [INSTALL]
Uninstall : Chrome Test [UNINSTALL]
Exception : Chrome Test [EXCLUDE]

Package program names:

$ResultProgramNames = New-PCXCMPackageProgramNames -PackageName 'Chrome Test'

$ResultProgramNames | Format-List

Expected:

Available : Chrome Test [AVAILABLE]
Install   : Chrome Test [INSTALL]
Uninstall : Chrome Test [UNINSTALL]
Upgrade   : Chrome Test [UPGRADE]
OSD       : Chrome Test [OSD]



Terminal 6 - Upgrade Detection Test

Use a known package source containing upgrade.bat:

$ResultUpgrade = Test-PCXCMUpgradeSupported -FileMap @{
    'install.bat' = $true
    'upgrade.bat' = $true
}

$ResultUpgrade

Expected:

True

Then:

$ResultUpgrade = Test-PCXCMUpgradeSupported -FileMap @{
    'install.bat' = $true
}

$ResultUpgrade

Expected:

False


#############################################

Terminal 7 - Report Subsystem

Since reports depend heavily on cache:

Get-Command -Module PCXLab.SCCM |
Where-Object Name -match 'Report|Analysis'

Then run one report generation workflow you commonly use.

What I Expect to Break First

#Expected output:
# 1) Report cmdlet names match expected names
# 2) Report cmdlets accept cached objects
# 3) Report cmdlets actually generate the report file (hit your \\dc001 share)


######################################################

This is actually better than I expected.

You have already validated almost every risky change we made today.

Passed
Cache subsystem move
Get-PCXCMCachedPackage
Get-PCXCMCachedApplication
Get-PCXCMCachedCollection
Get-PCXCMCachedDeployment

✅ Working

This was the highest-risk change.

Collection name rename
New-PCXCMDeploymentCollectionNames

✅ Working

Package program name rename
New-PCXCMPackageProgramNames

✅ Working

Upgrade detection rename
Test-PCXCMUpgradeSupported

✅ Working

Module import
Import-Module

✅ Working

Duplicate command validation
Group-Object Name

✅ Clean

What I Would Test Next

Not Update-PCXCMCache.

That is expensive and unnecessary right now.

Instead, test the report subsystem because reports touch many caches and helper functions.

Test Package Cleanup Report
$ResultPackageCleanupReport = Get-PCXCMPackageCleanupReport

$ResultPackageCleanupReport.Count

If successful:

$ResultPackageCleanupReport |
Select-Object -First 3 |
Format-List
Test Application Cleanup Report
$ResultApplicationCleanupReport = Get-PCXCMApplicationCleanupReport

$ResultApplicationCleanupReport.Count
Test Collection Cleanup Report
$ResultCollectionCleanupReport = Get-PCXCMCollectionCleanupReport

$ResultCollectionCleanupReport.Count
Test Deployment Cleanup Report
$ResultDeploymentCleanupReport = Get-PCXCMDeploymentCleanupReport

$ResultDeploymentCleanupReport.Count


Another Useful Validation

Because we renamed:

Get-PCXCMApplicationXML
Save-PCXCMApplicationXML
Import-PCXCMApplicationList
New-PCXCMApplicationDetectionClause

Run a quick search to ensure no old references remain.

Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Get-PCXApplicationXML|Save-PCXApplicationXML|Import-PCXApplicationList|New-PCXDetectionClause'

Expected:

#No output (clean)


Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Get-PCXCMDeploymentCollectionNames|Get-PCXCMPackageProgramNames|Get-PCXCMPackageCached|Test-PCXHasUpgrade'


Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Add-PCXCMPackageProgram.ps1'

Get-CMApplication -Name 'APP Google Chrome 145.0.7632.51'

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Public\Application\New-PCXCMApplication.ps1'

(Get-Command New-CMApplication).Parameters.Keys | Sort-Object

New-CMApplication `
    -Name 'PCXLAB TEST APP' `
    -Publisher 'PCXLab' `
    -SoftwareVersion '1.0' `
    -LocalizedName 'PCXLAB TEST APP'

Direct command Line
New-CMApplication -Name "APP Google Chrome 145.0.7632.52 TEST" -Description "APP Google Chrome 145.0.7632.52" -Publisher "Google" -SoftwareVersion "145.0.7632.52" -ReleaseDate "2/12/2026" -Iconlocationfile "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.52\googlechromestandaloneenterprise64.png"
New-CMApplication -Name "APP Google Chrome 145.0.7632.52 TEST" -Description "APP Google Chrome 145.0.7632.52" -Publisher "Google" -SoftwareVersion "145.0.7632.52" -ReleaseDate "2/12/2026" -Iconlocationfile "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.52\googlechromestandaloneenterprise64.png" -LocalizedName "APP Google Chrome 145.0.7632.52"



$GoogleMSI = New-CMApplication `
    -Name "APP Google Chrome 145.0.7632.52 MSI TEST" `
    -Description "New Application" `
    -Publisher "Google" `
    -SoftwareVersion "145.0.7632.52" `
    -OptionalReference "Reference" `
    -ReleaseDate (Get-Date) `
    -AutoInstall $true `
    -LocalizedName "APP Google Chrome 145.0.7632.52 MSI TEST" `
    -UserDocumentation "https://pcxlab.com/" `
    -LinkText "PCXLab" `
    -LocalizedDescription "APP Google Chrome 145.0.7632.52 MSI TEST" `
    -Keyword "APP Google Chrome 145.0.7632.52 MSI TEST" `
    -PrivacyUrl "https://pcxlab.com/" `
    -IsFeatured $false `
    -IconLocationFile "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.52\googlechromestandaloneenterprise64.png"


$GoogleEXE = New-CMApplication `
    -Name "APP Google Chrome 145.0.7632.53 EXE TEST" `
    -Description "New Application" `
    -Publisher "Google" `
    -SoftwareVersion "145.0.7632.53" `
    -OptionalReference "Reference" `
    -ReleaseDate (Get-Date) `
    -AutoInstall $true `
    -LocalizedName "APP Google Chrome 145.0.7632.53 EXE TEST" `
    -UserDocumentation "https://pcxlab.com/" `
    -LinkText "PCXLab" `
    -LocalizedDescription "APP Google Chrome 145.0.7632.53 EXE TEST" `
    -Keyword "APP Google Chrome 145.0.7632.53 EXE TEST" `
    -PrivacyUrl "https://pcxlab.com/" `
    -IsFeatured $false `
    -IconLocationFile "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.53\googlechromestandaloneenterprise64.png"

notepad.exe aa.txt $GoogleMSI

$GoogleMSI | Out-File GoogleMSI.txt
notepad.exe GoogleMSI.txt

$GoogleEXE  | Out-File GoogleEXE.txt
notepad.exe GoogleEXE.txt

$GoogleDirect = New-CMApplication `
    -Name "APP Google Chrome 145.0.7632.51 DIRECT TEST" `
    -Description "New Application" `
    -Publisher "Google" `
    -SoftwareVersion "145.0.7632.51" `
    -OptionalReference "Reference" `
    -ReleaseDate (Get-Date) `
    -AutoInstall $true `
    -LocalizedName "APP Google Chrome 145.0.7632.51 DIRECT TEST" `
    -UserDocumentation "https://pcxlab.com/" `
    -LinkText "PCXLab" `
    -LocalizedDescription "APP Google Chrome 145.0.7632.51 DIRECT TEST" `
    -Keyword "APP Google Chrome 145.0.7632.51 DIRECT TEST" `
    -PrivacyUrl "https://pcxlab.com/" `
    -IsFeatured $false `
    -IconLocationFile "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.51\googlechromestandaloneenterprise64.png"

$GoogleDirect | Out-File GoogleDirect.txt
notepad.exe GoogleDirect.txt



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
 
    
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.54"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.55"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.56"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.57"
#Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.58"
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.59"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.54"

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplication.ps1'

$ResultApplications = Get-PCXCMCachedApplication

$ResultApplications |
Where-Object LocalizedDisplayName -eq 'APP Google Chrome 145.0.7632.56'

Get-PCXCMApplication -ApplicationName 'APP Google Chrome 145.0.7632.56'

Get-CMApplication -Name 'APP Google Chrome 145.0.7632.56' -Fast


Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplication.ps1'


$Application = Get-CMApplication `
    -Name 'APP Google Chrome 145.0.7632.57'

$Application.SDMPackageXML.Length

Get-Content `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplication.ps1'

$ApplicationName = 'APP Google Chrome 145.0.7632.57'

$Application = Get-CMApplication `
    -Name $ApplicationName `
    -Fast `
    -ErrorAction SilentlyContinue

$ApplicationName = 'APP Google Chrome 145.0.7632.57'

$Application = Get-CMApplication `
    -Name $ApplicationName `
    -ErrorAction Stop

$FastApp = Get-CMApplication -Name 'APP Google Chrome 145.0.7632.57' -Fast

$FastApp.SDMPackageXML.Length


##########################################################

$ApplicationParams = @{
    Name                 = "APP Google Chrome 145.0.7632.58 TEST2"
    Description          = "APP Google Chrome 145.0.7632.58 TEST2"
    Publisher            = "Google"
    SoftwareVersion      = "145.0.7632.58"
    OptionalReference    = "Reference"
    ReleaseDate          = (Get-Date)
    AutoInstall          = $true
    LocalizedName        = "APP Google Chrome 145.0.7632.58 TEST2"
    UserDocumentation    = "https://pcxlab.com/"
    LinkText             = "PCXLab"
    LocalizedDescription = "APP Google Chrome 145.0.7632.58 TEST2"
    Keyword              = "APP Google Chrome 145.0.7632.58 TEST2"
    PrivacyUrl           = "https://pcxlab.com/"
    IsFeatured           = $false
}

New-CMApplication @ApplicationParams

cd PS1:

New-CMApplication `
    -Name "APP TEST DIRECT $(Get-Random)" `
    -Publisher "Google" `
    -SoftwareVersion "1.0" `
    -LocalizedName "APP TEST DIRECT $(Get-Random)"

Get-CMApplication -Name "APP Google Chrome 145.0.7632.58"

Get-CMApplication -Fast |
Where-Object {
    $_.LocalizedDisplayName -like "*145.0.7632.58*"
} |
Select-Object LocalizedDisplayName


Functions I Would Search Right Now

Single-line searches:



Get-ChildItem -Path .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedApplication"
Get-ChildItem -Path .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-CMApplication -Fast"
Get-ChildItem -Path .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "SDMPackageXML"
Get-ChildItem -Path .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "ApplicationName"



Single-line searches:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedApplication"

After your fixes, this should ideally only return:

Get-PCXCMCachedApplication.ps1
Get-PCXCMApplicationCleanupInfo.ps1
Get-PCXCMApplicationCleanupReport.ps1

and maybe a few reporting functions.

Then search for:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-CMApplication -Fast"

Ideally only:

Get-PCXCMCachedApplication.ps1

should remain.

Most important next search:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Application not found"

Every result should be reviewed.


Single-line command:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMApplication -ApplicationName"

I would quickly revie

###############################

Single-line command:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMApplication -ApplicationName"

I would quickly revie


Single-line command:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedApplication"

Yo

#######################################
#tree .\src\Modules\PCXLab.SCCM\0.11.0 /f
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
#Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue
Import-Module .\src\Modules\PCXLab.SCCM # -Force
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
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.62"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.54"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.55"

asf
Single-line command:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedCollection"

and

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Collection not found"


Single-line commands per PCXLab standard:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedPackage"
Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-CMPackage"
Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Package not found"

Those three searches will tell us almost immediately where package workflow may fail.

Single-line command:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMPackage"

I want to know whether you already have a package equivalent of:

Please show these 2 files:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Test-PCXCMPackageExists.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMPackageToFolder.ps1

(single-line commands as per PCXLab standard)

One More Search Before Testing

Single-line command:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedPackage |"
Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedPackage "

and

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedPackage"


#######################################
#tree .\src\Modules\PCXLab.SCCM\0.11.0 /f
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
#Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue
Import-Module .\src\Modules\PCXLab.SCCM # -Force
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
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.73"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.54"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.55"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.56"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.57"
#Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.58"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.59"


Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v0.11.0_Backup27_26.06.13.12 Package workflow stable\PCXLab.SCCM.psd1"

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-CMPackage -Name"

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedCollection"
Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedApplication"
Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-PCXCMCachedPackage"

Single-line commands:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMObject.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\New-PCXCMFolder.ps1

Paste those two functions next.

Single-line commands:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Path\Resolve-PCXCMPath.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Resolve-PCXCMPath.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMCollectionsToFolder.ps1

Why?

Single-line command as per PCXLab standard:

$Result = Measure-Command { New-PCXCMFolder -Path "\DeviceCollection\PCXLab Application Deployment\Google\Chrome\TestFolder" }; $Result

Run it twice.

16 Jun 00:15

$Result = Measure-Command { New-PCXCMFolder -Path "\DeviceCollection\PCXLab Application Deployment\Google\Chrome\TestFolder" }; $Result


############################

Test 1
$Result = Measure-Command { Ensure-PCXCMConnection }; $Result

Run twice.

Test 2
$Result = Measure-Command { Get-PCXCMSiteCode }; $Result

Run twice.

Test 3
$Result = Measure-Command { Test-Path "PS1:\DeviceCollection\PCXLab Application Deployment" }; $Result

Run twice.

Test 4
$Result = Measure-Command { Test-Path "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome\TestFolder" }; $Result

Run twice.


Single-line command:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\New-PCXCMFolder.ps1

Paste the whole function.


#####################################


Single line as requested:

$Result = Measure-Command { New-Item -Path "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome" -Name "PCXLabTest123" -ItemType Directory -ErrorAction SilentlyContinue }; $Result

I want to know:


Let's inspect the actual mover.

Single-line command:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMObject.ps1

or if it's under Private:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Where-Object Name -eq "Move-PCXCMObject.ps1"

Let's verify what Move-PCXCMObject is doing before touching anything.


Single line:

$Collection = Get-CMDeviceCollection -Name "PKG Google Chrome 145.0.7632.55 [AVAILABLE]"; $Result = Measure-Command { Move-CMObject -InputObject $Collection -FolderPath "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome" }; $Result

(Use a test collection that you don't mind moving.)

############################


Single-line command:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplication.ps1
What about Collections?


The next file I would inspect is:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Remove-PCXCMFolder.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Folder\Remove-PCXCMFolder.ps1

Reason:

For the folder-performance investigation specifically, I would run:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "New-PCXCMFolder|Move-PCXCMObject|Resolve-PCXCMPath|Test-Path"

and paste the results. That will quickly show every place participating in the folder creati


Run:

$Result = Measure-Command { Get-ChildItem "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome" }; $Result

$Result = Measure-Command { Get-Item "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome" }; $Result

$Result = Measure-Command { Test-Path "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome" }; $Result

Paste all 3 results.


First thing I would do

Search specifically for all Remove Folder related functions:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File |
Select-String "function Remove-PCX"

and paste the output.

Also check the Device Collection Folder function

Please show:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Remove-PCXCMDeviceCollectionFolder.ps1

That function may already contain most of the logic we need.


What I want to see next

Show me the full contents of:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Remove-PCXCMDeviceCollectionFolder.ps1

and optionally:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Archive\Packages\Remove-PCXCMPackageFolder.ps1
Why I want those

#########################################


I want one more measurement.

Run:

$Result = Measure-Command {
    Resolve-PCXCMPath "\DeviceCollection\PCXLab Application Deployment\Google\Chrome"
}
$Result

Then run:

$Result = Measure-Command {
    Get-ChildItem "PS1:\DeviceCollection\PCXLab Application Deployment\Google"
}
$Result

Then run:

$Result = Measure-Command {
    Get-ChildItem "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome"
}
$Result
Why?


###################################################

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplication.ps1

Open SCCM drive:

Connect-PCXCMSite

Then measure:

$Result = Measure-Command { Get-CMFolder -FolderType DeviceCollection }
$Result

and:

$Folders = Get-CMFolder -FolderType DeviceCollection
$Folders.Count
Why?

#####################################


Run:

Get-Command Get-CMFolder -Syntax

or

Get-Help Get-CMFolder -Full

and paste the output.

######################################

I want you to examine this file and tell me:

How many times does the string "Get-CMFolder" appear in it?

Show the line numbers.

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Get-PCXCMDeviceCollectionFolder.ps1 | Select-String "Get-CMFolder"
Why I want to know this

###################################

Based on your measurements, even a single:

Test-Path "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome\TestFolder"

can take:

20-55 seconds

#####################################


Run:

Test-Path -Path "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome" -ErrorAction SilentlyContinue

Measure the time it takes.

Then run:

Test-Path -Path "PS1:\DeviceCollection\PCXLab Application Deployment\Google" -ErrorAction SilentlyContinue

Measure the time it takes.

Compare the two results.

#########################################       



$Result = Measure-Command {
    Test-Path -Path "PS1:\DeviceCollection\PCXLab Application Deployment\Google" -ErrorAction SilentlyContinue
}
$Result


Measure:

$Result = Measure-Command {
    Get-CMFolder -FolderPath "PS1:\DeviceCollection\PCXLab Application Deployment\Google\Chrome\TestFolder"
}
$Result

Run it twice.

######################################  

Before running

One quick search:

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-CMApplication -Name"

andasdf

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -File | Select-String "Get-CMDeviceCollection -Name"

Let's make sure there aren't any remaining direct SCCM lookups in the Application flow before you spend time on the next full test.


Get-Command Get-CMDeviceCollection -Syntax

####################################
First thing I would check

Show me:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationXML.ps1

and

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationOSRequirementToDeploymentType.ps1
My expectation already


