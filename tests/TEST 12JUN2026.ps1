#Clear-Host
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

##########################


$ResultDeploymentCount = Measure-Command { $DeploymentCount = Get-PCXCMApplicationDeploymentCount -Application $Application }
$ResultCollectionCount = Measure-Command { $CollectionCount = Get-PCXCMApplicationCollectionCount -Application $Application }


$ResultApplication = Get-CMApplication -Fast | Select-Object -First 1
$ResultApplication.LocalizedDisplayName

$ResultDeploymentCountTime = Measure-Command { $ResultDeploymentCount = Get-PCXCMApplicationDeploymentCount -Application $ResultApplication }
$ResultDeploymentCountTime.TotalMilliseconds

$ResultCollectionCountTime = Measure-Command { $ResultCollectionCount = Get-PCXCMApplicationCollectionCount -Application $ResultApplication }
$ResultCollectionCountTime.TotalMilliseconds

$ResultTaskSequenceReferenceCountTime = Measure-Command { $ResultTaskSequenceReferenceCount = Get-PCXCMApplicationTaskSequenceReferenceCount -Application $ResultApplication }
$ResultTaskSequenceReferenceCountTime.TotalMilliseconds
Also give me these 3 files


$ResultCollectionQueryTime = Measure-Command { $ResultCollections = Get-CMDeviceCollection }
$ResultCollectionQueryTime.TotalSeconds
$ResultCollections.Count

$ResultApplication = Get-CMApplication -Fast | Select-Object -First 1
$ResultApplication.LocalizedDisplayName

$ResultFilterTime = Measure-Command {
    $ResultMatches = $ResultCollections | Where-Object { $_.Name -like "$($ResultApplication.LocalizedDisplayName)*" }
}
$ResultFilterTime.TotalMilliseconds


$CacheCollections = Get-CMDeviceCollection

foreach ($Application in $Applications) {

    $CollectionCount = Get-PCXCMApplicationCollectionCount `
        -Application $Application `
        -Collections $CacheCollections
}


$ResultCollections = Get-CMDeviceCollection

$ResultFilterTime = Measure-Command {
    $ResultMatches = $ResultCollections | Where-Object { $_.Name -like "$($ResultApplication.LocalizedDisplayName)*" }
}
$ResultFilterTime.TotalMilliseconds


Get-CMDeviceCollection -Name "$($Application.LocalizedDisplayName)*"

$CacheCollections = Get-CMDeviceCollection

$ResultCollections | Where-Object { $_.Name -like "$($ResultApplication.LocalizedDisplayName)*" }


$ResultDeploymentQueryTime = Measure-Command { $ResultDeployments = Get-CMDeployment }
$ResultDeploymentQueryTime.TotalSeconds

$ResultDeployments.Count

$ResultMatches = Select-String -Path .\src\Modules\PCXLab.SCCM\0.11.0\**\*.ps1 -Pattern 'Get-CMDeviceCollection'
$ResultMatches

$ResultMatches = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String 'Get-CMDeviceCollection'
$ResultMatches

$ResultMatches = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String 'Get-CM'
$ResultMatches | Select-Object Path,Line





$ResultNested = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\src -ErrorAction SilentlyContinue
$ResultNested


$ResultCacheFiles = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter Initialize-PCXCMCache.ps1
$ResultCacheFiles | Select-Object FullName

$ResultNestedFiles = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\src -Recurse -File
$ResultNestedFiles.Count

$ResultNestedFiles | Select-Object FullName

$ResultDelete = Remove-Item .\src\Modules\PCXLab.SCCM\0.11.0\src -Recurse -Force

$ResultNested = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\src -ErrorAction SilentlyContinue
$ResultNested


$ResultCoreFiles = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core -Filter *PCX* | Select-Object Name
$ResultCoreFiles

$ResultTime = Measure-Command { $Result = Get-PCXCMCollectionCleanupReport }
$ResultTime.TotalSeconds

$ResultTime = Measure-Command { $Result = Get-PCXCMPackageCleanupReport }
$ResultTime.TotalSeconds

$ResultCollections = Get-CMDeviceCollection
$ResultCollections.Count

$ResultDeployments = Get-CMDeployment
$ResultDeployments.Count

$ResultCollection = Get-CMDeviceCollection | Select-Object -First 1

$ResultTime = Measure-Command {
    $Result = Get-PCXCMCollectionDeploymentCount `
        -Collection $ResultCollection `
        -Deployments $ResultDeployments
}

$ResultTime.TotalMilliseconds

$ResultMatches = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String 'Get-CMDeployment'
$ResultMatches | Select-Object Path,Line

Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM




(Get-Command Get-PCXCMCollectionDeploymentCount).Definition


$Result.Count

$Result | Select-Object -First 1

Test-Path .\src\Modules\PCXLab.SCCM\0.11.0\src


$ResultTime = Measure-Command { $ResultCollectionReport = Get-PCXCMCollectionCleanupReport }; $ResultTime.TotalSeconds; $ResultCollectionReport.Count

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMCollectionMemberCount.ps1


$ResultFiles = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Private -Recurse -Filter *.ps1 | Select-String 'Get-CMDeployment|Get-CMDeviceCollection|Get-CMApplication|Get-CMPackage'
$ResultFiles | Select-Object Path,Line


$ResultFiles = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\*Checkpoint*.ps1 -ErrorAction SilentlyContinue; $ResultFiles | Select-Object FullName

$ResultFiles = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\*Checkpoint*.ps1 -ErrorAction SilentlyContinue; foreach ($File in $ResultFiles) { Write-Host "`n==================== $($File.Name) ===================="; Get-Content $File.FullName }

$ResultCoreFiles = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core | Select-Object Name
$ResultCoreFiles



Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Application\Get-PCXCMApplicationCleanupReport.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationCollectionCount.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationDeploymentCount.ps1

Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM

$ResultTime = Measure-Command { $Result = Get-PCXCMApplicationCleanupReport }

$ResultTime.TotalSeconds
$Result.Count


Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM

$ResultTime = Measure-Command { $Result = Get-PCXCMApplicationCleanupReport }

$ResultTime.TotalSeconds
$Result.Count



########################

Before We Implement

I want to inspect these files because they will become the reusable framework:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Initialize-PCXAnalysisReport.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Write-PCXAnalysisResult.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Complete-PCXAnalysisReport.ps1

Paste those 3 files one more time (they are short).

$ResultMatches = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String 'Initialize-PCXAnalysisReport|Write-PCXAnalysisResult|Complete-PCXAnalysisReport'
$ResultMatches | Select-Object Path,Line


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Invoke-PCXAnalysisReport.ps1

##########################################



$ResultApplication = Get-CMApplication -Fast | Select-Object -First 1
$ResultTime = Measure-Command { $Result = Get-PCXCMApplicationCleanupInfo -ApplicationName $ResultApplication.LocalizedDisplayName }
$ResultTime.TotalSeconds
$ResultPackage = Get-CMPackage -Fast | Select-Object -First 1
$ResultTime = Measure-Command { $Result = Get-PCXCMPackageCleanupInfo -PackageName $ResultPackage.Name }
$ResultTime.TotalSeconds

Then identify the expensive calls.

Run:

$ResultApplication = Get-CMApplication -Fast | Select-Object -First 1

$ResultTime = Measure-Command { $ResultDeployments = Get-CMApplicationDeployment -Name $ResultApplication.LocalizedDisplayName }
"Deployments: $($ResultTime.TotalMilliseconds) ms"

$ResultTime = Measure-Command { $ResultCollections = Get-CMDeviceCollection -Name "$($ResultApplication.LocalizedDisplayName)*" }
"Collections: $($ResultTime.TotalMilliseconds) ms"

$ResultTime = Measure-Command { $ResultFolder = Get-CMFolder -Name $ResultApplication.LocalizedDisplayName }
"Folder: $($ResultTime.TotalMilliseconds) ms"

and

$ResultPackage = Get-CMPackage -Fast | Select-Object -First 1

$ResultTime = Measure-Command { $ResultCollections = Get-CMDeviceCollection -Name "$($ResultPackage.Name)*" }
"Collections: $($ResultTime.TotalMilliseconds) ms"

$ResultTime = Measure-Command { $ResultFolder = Get-CMFolder -Name $ResultPackage.Name }
"Folder: $($ResultTime.TotalMilliseconds) ms"

Paste the results.asf

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Initialize-PCXCMCache.ps1

Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite



Before we do that

Run one final search:

$ResultMatches = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String 'Initialize-PCXCMCache'

$ResultMatches | Select-Object Path,Line

Paste the output.





$ResultTime = Measure-Command {
    $Result = Get-PCXCMDeploymentCleanupReport
}

$ResultTime.TotalSeconds



$ResultTime = Measure-Command { 1..100 | ForEach-Object { Write-PCXLog -Message "Test" } }; $ResultTime.TotalSeconds
$ResultTime = Measure-Command { 1..1000 | ForEach-Object { $null = "Test" } }; $ResultTime.TotalSeconds

$ResultTime = Measure-Command { 1..100 | ForEach-Object { "Test" | Add-Content C:\Temp\TestLog.txt } }; $ResultTime.TotalSeconds

$ResultTime = Measure-Command { 1..100 | ForEach-Object { Write-Host "Test" } }; $ResultTime.TotalSeconds

if (-not $Global:PCXLogConfiguration) { Initialize-PCXLogConfiguration }
if (-not $Global:PCXLogFile) { Initialize-PCXLogging }

Run:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Application\Get-PCXCMApplicationCleanupReport.ps1


Run this:

$ResultFiles = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application -Filter *.ps1 | Select-Object -ExpandProperty FullName

foreach ($File in $ResultFiles) {
    Write-Host "`n==================== $(Split-Path $File -Leaf) ====================" -ForegroundColor Cyan
    Get-Content $File
}

Paste everything.

I specifically want to

Next command:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Deployment\Get-PCXCMDeploymentAge.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Deployment\Get-PCXCMDeploymentEnabledStatus.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Deployment\Get-PCXCMDeploymentCleanupScore.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Deployment\Get-PCXCMDeploymentCleanupRecommendation.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Deployment\Get-PCXCMDeploymentIntentName.ps1

Paste those 5 files.


############################


Run:

$ResultTime = Measure-Command {
    1..1000 | ForEach-Object {
        Get-PSCallStack | Out-Null
    }
}

$ResultTime.TotalSeconds

Paste result.

Then run:

$ResultTime = Measure-Command {
    1..1000 | ForEach-Object {
        $null = "Test"
    }
}

$ResultTime.TotalSeconds

Paste result.

If the first test is muc


Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite


Step 4 - Test

Save cache again:

$ResultCollections = Get-CMDeviceCollection

Save-PCXCMCache `
    -Name Collections `
    -Data $ResultCollections `
    -ExpiresHours 24

Check status:

Get-PCXCMCacheStatus


Test-PCXCMCacheExpired `
    -Name Collections

$ResultCollections = Get-PCXCMCachedCollection


Get-Command *PCXCMCache* | Sort-Object Name

Test-PCXCMCacheExists `
    -Name Collections



    $ResultTime = Measure-Command {
    $ResultCollections = Get-PCXCMCachedCollection
}

$ResultTime.TotalSeconds


$ResultTime = Measure-Command {
    $ResultDeployments = Get-PCXCMCachedDeployment
}

$ResultCollections = Get-PCXCMCachedCollection

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Get-PCXCMCacheStatus.ps1


Get-PCXCMCacheStatus

Get-PCXCMCacheStatus `
    -Name Collections


$ResultCollections = Get-PCXCMCachedCollection


Show me these 3 files
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Get-PCXCMCachedDeployment.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Test-PCXCMCacheExpired.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Deployment\Get-PCXCMDeploymentCleanupReport.ps1

Th

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Deployment\Get-PCXCMDeploymentCleanupReport.ps1


$ResultTime = Measure-Command {
    $Result = Get-PCXCMDeploymentCleanupReport
}

$ResultTime.TotalSeconds
$Result.Count



$ResultTime = Measure-Command {
    $ResultApplications = Get-PCXCMCachedApplication
}

$ResultTime.TotalSeconds
$ResultApplications.Count


$ResultTime = Measure-Command {
    $ResultApplications = Get-CMApplication -Fast
}

$ResultTime.TotalSeconds
$ResultApplications.Count


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationDeploymentTypeCount.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationDependencyCount.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationSupersedenceCount.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationTaskSequenceReferenceCount.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Application\Get-PCXCMApplicationCleanupReport.ps1

$ResultTime = Measure-Command {
    $ResultPackages = Get-PCXCMPackageCached
}

$ResultTime.TotalSeconds
$ResultPackages.Count



$ResultTime = Measure-Command {
    $Result = Get-PCXCMApplicationCleanupReport
}

$ResultTime.TotalSeconds
$Result.Count


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Package\Get-PCXCMPackageCleanupReport.ps1


$ResultTime = Measure-Command {
    $Result = Get-PCXCMPackageCleanupReport
}

$ResultTime.TotalSeconds
$Result.Count


Get-Command Get-PCXCMPackageDeploymentCount

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
    Select-String 'function Get-PCXCMPackageDeploymentCount'

    Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Private\Package


    Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageDeploymentCount.ps1

    Get-Command *PackageDeployment*


    Get-Command Get-PCXCMPackageDeploymentCount


$ResultTime = Measure-Command {
    $Result = Get-PCXCMPackageCleanupReport
}

$ResultTime.TotalSeconds
$Result.Count


Get-PCXCMPackageDeploymentCount.ps1

function Get-PCXCMCollectionDeploymentCount



$ResultTime = Measure-Command {
    $Result = Get-PCXCMPackageCleanupReport
}

$ResultTime.TotalSeconds
$Result.Count



$ResultFiles = @(
'.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageSize.ps1',
'.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageSourcePathStatus.ps1',
'.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageSourceVersion.ps1',
'.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageProgramCount.ps1',
'.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageDistributionStatus.ps1'
)

foreach ($File in $ResultFiles) {
    Write-Host "`n==================== $File ====================" -ForegroundColor Cyan
    Get-Content $File
}

cls
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Test-PCXCMPackageSourcePath.ps1


Get-Command Get-CMDistributionStatus

$ResultTime = Measure-Command {
    Get-CMDistributionStatus | Out-Null
}
$ResultTime.TotalSeconds




One thing to check before running

Verify this exists:

Get-Command Get-PCXCMCachedDistributionStatus

If not found:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Get-PCXCMCachedDistributionStatus.ps1
Expected behavior now

$ResultTime = Measure-Command {
    $Result = Get-PCXCMPackageCleanupReport
}

$ResultTime.TotalSeconds



Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

Get-Command Get-PCXCMCachedDistributionStatus

Expected:

Function Get-PCXCMCachedDistributionStatus
Then Build Cache Once

This may take 2+ minutes in your lab and much longer in production:

$ResultTime = Measure-Command {
    $ResultDistribution = Get-PCXCMCachedDistributionStatus
}

$ResultTime.TotalSeconds
After That

Run again:

$ResultTime = Measure-Command {
    $ResultDistribution = Get-PCXCMCachedDistributionStatus
}

$ResultTime.TotalSeconds

$ResultTime = Measure-Command {
    $Result = Get-PCXCMPackageCleanupReport
}

$ResultTime.TotalSeconds

Update-PCXCMCache


Get-PCXCMCachedCollection 
Get-PCXCMCachedDeployment 
Get-PCXCMCachedApplication 
Get-PCXCMPackageCached 
Get-PCXCMCachedDistributionStatus 