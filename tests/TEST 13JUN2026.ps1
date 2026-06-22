#Clear-Host
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

##########################

Get-PCXCMCacheStatus


I would keep it very simple initially.

Test Manually First
$ResultApplications = Get-PCXCMApplicationCleanupReport

$ResultApplications |
Export-Csv `
    -Path C:\Temp\ApplicationCleanupReport.csv `
    -NoTypeInformation
$ResultPackages = Get-PCXCMPackageCleanupReport

$ResultPackages |
Export-Csv `
    -Path C:\Temp\PackageCleanupReport.csv `
    -NoTypeInformation
$ResultDeployments = Get-PCXCMDeploymentCleanupReport

$ResultDeployments |
Export-Csv `
    -Path C:\Temp\DeploymentCleanupReport.csv `
    -NoTypeInformation
$ResultCollections = Get-PCXCMCollectionCleanupReport

$ResultCollections |
Export-Csv `
    -Path C:\Temp\CollectionCleanupReport.csv `
    -NoTypeInformation
Better Enterprise Version

Create a single command:

Export-PCXCMCleanupReports

Example:

Export-PCXCMCleanupReports `
    -OutputFolder C:\Reports

Expected output:

C:\Reports\ApplicationCleanupReport.csv
C:\Reports\CollectionCleanupReport.csv
C:\Reports\DeploymentCleanupReport.csv
C:\Reports\PackageCleanupReport.csv
Even Better


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMCollectionDeploymentCount.ps1


$ResultTime = Measure-Command {
    $ResultCollections = Get-PCXCMCollectionCleanupReport
}

$ResultTime.TotalSeconds

$ResultCollections.Count


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\Get-PCXCMCollectionCleanupReport.ps1

$ResultTime = Measure-Command {
    $ResultCollections = Get-PCXCMCollectionCleanupReport
}

$ResultTime.TotalSeconds

$ResultFiles = @(
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMCollectionMemberCount.ps1',
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMCollectionIncludeRuleCount.ps1',
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMCollectionExcludeRuleCount.ps1',
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMCollectionQueryRuleCount.ps1',
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMCollectionDirectRuleCount.ps1'
)

foreach ($File in $ResultFiles) {
    Write-Host "`n==================== $File ====================" -ForegroundColor Cyan
    Get-Content $File
}

Get-Command *CleanupReport


$ResultTime = Measure-Command {
    $ResultTaskSequences = Get-PCXCMTaskSequenceCleanupReport
}

$ResultTime.TotalSeconds

$ResultTaskSequences.Count


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\TaskSequence\Get-PCXCMTaskSequenceCleanupReport.ps1


$ResultFiles = @(
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\TaskSequence\Get-PCXCMTaskSequenceDeploymentCount.ps1',
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\TaskSequence\Get-PCXCMTaskSequenceReferenceCount.ps1',
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\TaskSequence\Get-PCXCMTaskSequenceEnabledStatus.ps1',
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\TaskSequence\Get-PCXCMTaskSequenceAge.ps1'
)

foreach ($File in $ResultFiles) {
    Write-Host "`n==================== $File ====================" -ForegroundColor Cyan
    Get-Content $File
}


$ResultTime = Measure-Command {
    $ResultDeployments = Get-CMTaskSequenceDeployment -Fast
}

$ResultTime.TotalSeconds

$ResultDeployments.Count


Get-Command Get-PCXCMCachedTaskSequenceDeployment


$ResultTime = Measure-Command {
    $ResultTaskSequences = Get-PCXCMTaskSequenceCleanupReport
}

$ResultTime.TotalSeconds

$ResultTaskSequences.Count

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Get-PCXCMCachedTaskSequenceDeployment.ps1


$ResultTime = Measure-Command {
    $ResultTaskSequenceDeployments = Get-PCXCMCachedTaskSequenceDeployment -ForceRefresh
}

$ResultTime.TotalSeconds

$ResultTaskSequenceDeployments.Count


##############

Get-CMTaskSequence -Fast | Select-Object Name, PackageID, TsEnabled

$ResultTime = Measure-Command {
    $ResultTaskSequences = Get-PCXCMTaskSequenceCleanupReport
}

$ResultTime.TotalSeconds

$ResultTaskSequences.Count


Get-CMTaskSequence -Fast | Select-Object Name, PackageID, TsEnabled

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\TaskSequence\Get-PCXCMTaskSequenceCleanupScore.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\TaskSequence\Get-PCXCMTaskSequenceCleanupRecommendation.ps1

$ResultTime = Measure-Command {
    $TaskSequences = Get-CMTaskSequence -Fast
}
Write-Host "Get-CMTaskSequence: $($ResultTime.TotalSeconds)"

$ResultTime = Measure-Command {
    foreach ($TaskSequence in $TaskSequences) {

        $DeploymentCount = Get-PCXCMTaskSequenceDeploymentCount `
            -TaskSequence $TaskSequence `
            -TaskSequenceDeployments $TaskSequenceDeployments

        $ReferenceCount = Get-PCXCMTaskSequenceReferenceCount `
            -TaskSequence $TaskSequence

        $Enabled = Get-PCXCMTaskSequenceEnabledStatus `
            -TaskSequence $TaskSequence

        $TaskSequenceAgeDays = Get-PCXCMTaskSequenceAge `
            -TaskSequence $TaskSequence
    }
}
Write-Host "Loop: $($ResultTime.TotalSeconds)"


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Update-PCXCMCache.ps1

Update-PCXCMCache

$ResultTime = Measure-Command {
    $ResultTaskSequences = Get-PCXCMTaskSequenceCleanupReport
}

$ResultTime.TotalSeconds
$ResultTaskSequences.Count

#Clear-Host
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

##########################


$ResultApplications = Get-PCXCMApplicationCleanupReport
$ResultApplications | Export-Csv C:\Temp\ApplicationCleanupReport.csv -NoTypeInformation

$ResultPackages = Get-PCXCMPackageCleanupReport
$ResultPackages | Export-Csv C:\Temp\PackageCleanupReport.csv -NoTypeInformation

$ResultDeployments = Get-PCXCMDeploymentCleanupReport
$ResultDeployments | Export-Csv C:\Temp\DeploymentCleanupReport.csv -NoTypeInformation

$ResultCollections = Get-PCXCMCollectionCleanupReport
$ResultCollections | Export-Csv C:\Temp\CollectionCleanupReport.csv -NoTypeInformation

$ResultTaskSequences = Get-PCXCMTaskSequenceCleanupReport
$ResultTaskSequences | Export-Csv C:\Temp\TaskSequenceCleanupReport.csv -NoTypeInformation



$ResultFolders = @(
    '.\src\Modules\PCXLab.SCCM\0.11.0\Public\Reports',
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Reports'
)

foreach ($Folder in $ResultFolders) {
    New-Item -Path $Folder -ItemType Directory -Force | Out-Null
}

$ResultFiles = @(
    'Get-PCXCMApplicationCleanupReport.ps1',
    'Get-PCXCMCollectionCleanupReport.ps1',
    'Get-PCXCMDeploymentCleanupReport.ps1',
    'Get-PCXCMPackageCleanupReport.ps1',
    'Get-PCXCMTaskSequenceCleanupReport.ps1',
    'Get-PCXCMApplicationCleanupSummary.ps1',
    'Get-PCXCMCollectionCleanupSummary.ps1',
    'Get-PCXCMDeploymentCleanupSummary.ps1',
    'Get-PCXCMPackageCleanupSummary.ps1',
    'Get-PCXCMTaskSequenceCleanupSummary.ps1'
)

foreach ($File in $ResultFiles) {

    $ResultSource = Get-ChildItem `
        '.\src\Modules\PCXLab.SCCM\0.11.0\Public' `
        -Recurse `
        -Filter $File |
    Select-Object -First 1

    if ($ResultSource) {

        Move-Item `
            -Path $ResultSource.FullName `
            -Destination '.\src\Modules\PCXLab.SCCM\0.11.0\Public\Reports' `
            -Force
    }
}


$ResultFiles = @(
    'Get-PCXCMApplicationCleanupScore.ps1',
    'Get-PCXCMApplicationCleanupRecommendation.ps1',

    'Get-PCXCMCollectionCleanupScore.ps1',
    'Get-PCXCMCollectionCleanupRecommendation.ps1',

    'Get-PCXCMDeploymentCleanupScore.ps1',
    'Get-PCXCMDeploymentCleanupRecommendation.ps1',

    'Get-PCXCMPackageCleanupRecommendation.ps1',

    'Get-PCXCMTaskSequenceCleanupScore.ps1',
    'Get-PCXCMTaskSequenceCleanupRecommendation.ps1',

    'Get-PCXCMCleanupRisk.ps1'
)

foreach ($File in $ResultFiles) {

    $ResultSource = Get-ChildItem `
        '.\src\Modules\PCXLab.SCCM\0.11.0\Private' `
        -Recurse `
        -Filter $File |
    Select-Object -First 1

    if ($ResultSource) {

        Move-Item `
            -Path $ResultSource.FullName `
            -Destination '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Reports' `
            -Force
    }
}


tree .\src\Modules\PCXLab.SCCM\0.11.0\Public\Reports /f

tree .\src\Modules\PCXLab.SCCM\0.11.0\Private\Reports /f


Remove-Item .\src\Modules\PCXLab.SCCM\0.11.0\Private\Cleanup -Force


Get-Item .\src\Modules\PCXLab.SCCM\0.11.0\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Get-PCXCMCachedDistributionStatus.ps1

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\src -Recurse

cls
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Application\Get-PCXCMApplicationCleanupInfo.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Package\Get-PCXCMPackageCleanupInfo.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Package\Get-PCXCMPackageCleanupInfo.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Deployment\Get-PCXCMDeploymentCleanupInfo.ps1

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *CleanupInfo.ps1 |
Select-Object FullName


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *CleanupInfo.ps1 |
Select-Object -ExpandProperty FullName


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *CleanupInfo.ps1 |
ForEach-Object { $_.FullName }



Get-Command *CleanupInfo

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Application\Get-PCXCMApplicationCleanupReport.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Deployment\Get-PCXCMDeploymentCleanupReport.ps1


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *CleanupReport.ps1 |
Select-Object -ExpandProperty FullName

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Public -Recurse -Filter *.ps1 |
Select-Object DirectoryName, Name


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Public -Recurse -Filter *.ps1 |
Sort-Object DirectoryName, Name |
Format-Table DirectoryName, Name -AutoSize


Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Private -Recurse -Filter *.ps1 |
Sort-Object DirectoryName, Name |
Format-Table DirectoryName, Name -AutoSize


Move-Item `
    ".\src\Modules\PCXLab.SCCM\0.11.0\Public\Deployment\Get-PCXCMDeploymentRelationshipReport.ps1" `
    ".\src\Modules\PCXLab.SCCM\0.11.0\Public\Reports\"

###########################################################

#Yes. Run these one by one and save the outputs if anything fails.

#1. Verify Cache Status
$ResultCacheStatus = Get-PCXCMCacheStatus
$ResultCacheStatus | Format-Table


#2. Refresh All Caches
$ResultTime = Measure-Command {
    Update-PCXCMCache
}

$ResultTime.TotalMinutes

#3. Verify New Cache Entries Exist
Get-PCXCMCacheStatus |
Sort-Object Name |
Format-Table Name, ItemCount, AgeHours

#You should see:

#Applications
#Collections
#Deployments
#DistributionStatus
#Packages
#TaskSequences
#TaskSequenceDeployments

#4. Test Application Cleanup Report
$ResultTime = Measure-Command {
    $ResultApplications = Get-PCXCMApplicationCleanupReport
}

$ResultTime.TotalSeconds

$ResultApplications.Count

#5. Test Package Cleanup Report
$ResultTime = Measure-Command {
    $ResultPackages = Get-PCXCMPackageCleanupReport
}

$ResultTime.TotalSeconds

$ResultPackages.Count

#6. Test Deployment Cleanup Report
$ResultTime = Measure-Command {
    $ResultDeployments = Get-PCXCMDeploymentCleanupReport
}

$ResultTime.TotalSeconds

$ResultDeployments.Count

#7. Test Collection Cleanup Report
$ResultTime = Measure-Command {
    $ResultCollections = Get-PCXCMCollectionCleanupReport
}

$ResultTime.TotalSeconds

$ResultCollections.Count

#8. Test Task Sequence Cleanup Report
$ResultTime = Measure-Command {
    $ResultTaskSequences = Get-PCXCMTaskSequenceCleanupReport
}

$ResultTime.TotalSeconds

$ResultTaskSequences.Count

#9. Export Timestamped Reports
$Timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'

New-Item -ItemType Directory -Path 'C:\Temp\CleanupReports\Application' -Force | Out-Null
New-Item -ItemType Directory -Path 'C:\Temp\CleanupReports\Package' -Force | Out-Null
New-Item -ItemType Directory -Path 'C:\Temp\CleanupReports\Deployment' -Force | Out-Null
New-Item -ItemType Directory -Path 'C:\Temp\CleanupReports\Collection' -Force | Out-Null
New-Item -ItemType Directory -Path 'C:\Temp\CleanupReports\TaskSequence' -Force | Out-Null

$ResultApplications |
Export-Csv "C:\Temp\CleanupReports\Application\ApplicationCleanupReport_$Timestamp.csv" -NoTypeInformation

$ResultPackages |
Export-Csv "C:\Temp\CleanupReports\Package\PackageCleanupReport_$Timestamp.csv" -NoTypeInformation

$ResultDeployments |
Export-Csv "C:\Temp\CleanupReports\Deployment\DeploymentCleanupReport_$Timestamp.csv" -NoTypeInformation

$ResultCollections |
Export-Csv "C:\Temp\CleanupReports\Collection\CollectionCleanupReport_$Timestamp.csv" -NoTypeInformation

$ResultTaskSequences |
Export-Csv "C:\Temp\CleanupReports\TaskSequence\TaskSequenceCleanupReport_$Timestamp.csv" -NoTypeInformation

#10. Remove Reports Older Than 100 Days
Get-ChildItem 'C:\Temp\CleanupReports' -Recurse -File |
Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-100)
} |
Remove-Item -Force

#11. Quick Smoke Test Summary
[PSCustomObject]@{
    Applications  = $ResultApplications.Count
    Packages      = $ResultPackages.Count
    Deployments   = $ResultDeployments.Count
    Collections   = $ResultCollections.Count
    TaskSequences = $ResultTaskSequences.Count
}

#Paste the results from steps 3, 4, 5, 6, 7 and 8 and I'll review whether anything else in the module still needs attention.



#Clear-Host
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

##########################


Get-PCXCMCacheStatus

$ResultTime = Measure-Command {
    Update-PCXCMCache
}

$ResultTime.TotalMinutes

Get-PCXCMCacheStatus |
Format-Table Name, ItemCount, AgeHours

Get-PCXCMCacheStatus |
Format-Table Name, ItemCount, AgeHours

Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Get-CM'


$ResultTime = Measure-Command {
    <command>
}

cls
Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.49"
Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.49"

$Timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'

$ResultApplications | Export-Csv "C:\Temp\CleanupReports\Application\ApplicationCleanupReport_$Timestamp.csv" -NoTypeInformation
$ResultPackages | Export-Csv "C:\Temp\CleanupReports\Package\PackageCleanupReport_$Timestamp.csv" -NoTypeInformation
$ResultDeployments | Export-Csv "C:\Temp\CleanupReports\Deployment\DeploymentCleanupReport_$Timestamp.csv" -NoTypeInformation
$ResultCollections | Export-Csv "C:\Temp\CleanupReports\Collection\CollectionCleanupReport_$Timestamp.csv" -NoTypeInformation
$ResultTaskSequences | Export-Csv "C:\Temp\CleanupReports\TaskSequence\TaskSequenceCleanupReport_$Timestamp.csv" -NoTypeInformation

Get-Variable Result* -ErrorAction SilentlyContinue
Get-Variable Result* -ErrorAction SilentlyContinue

$ResultApplications
$ResultPackages
$ResultDeployments
$ResultCollections
$ResultTaskSequences

$ResultApplications = Get-PCXCMApplicationCleanupReport
$ResultPackages = Get-PCXCMPackageCleanupReport
$ResultDeployments = Get-PCXCMDeploymentCleanupReport
$ResultCollections = Get-PCXCMCollectionCleanupReport
$ResultTaskSequences = Get-PCXCMTaskSequenceCleanupReport

$ResultApplications.Count
$ResultPackages.Count
$ResultDeployments.Count
$ResultCollections.Count
$ResultTaskSequences.Count

$Timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'

$ResultApplications | Export-Csv "C:\Temp\CleanupReports\Application\ApplicationCleanupReport_$Timestamp.csv" -NoTypeInformation
$ResultPackages | Export-Csv "C:\Temp\CleanupReports\Package\PackageCleanupReport_$Timestamp.csv" -NoTypeInformation
$ResultDeployments | Export-Csv "C:\Temp\CleanupReports\Deployment\DeploymentCleanupReport_$Timestamp.csv" -NoTypeInformation
$ResultCollections | Export-Csv "C:\Temp\CleanupReports\Collection\CollectionCleanupReport_$Timestamp.csv" -NoTypeInformation
$ResultTaskSequences | Export-Csv "C:\Temp\CleanupReports\TaskSequence\TaskSequenceCleanupReport_$Timestamp.csv" -NoTypeInformation

Get-PCXCMCacheStatus |
Format-Table Name, ItemCount, AgeHours

Get-CMPackage -Fast | Sort-Object Name

Get-CMApplication -Fast | Sort-Object Name

$ResultTime = Measure-Command {
    $ResultPackage = New-PCXCMPackage
}

$ResultTime.TotalSeconds


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\New-PCXCMDeviceCollection.ps1

#What I would check next

#Run these one by one and measure them.

##Collections
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\New-PCXCMDeviceCollection.ps1

##Application Creation
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Application\New-PCXCMApplication.ps1

##(or whatever file contains)
New-CMApplication
##Deployment Type
Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Add-CMScriptDeploymentType'

##and paste the matching file.

##Move Collections
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMCollectionsToFolder.ps1
##Move Application
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMApplicationToFolder.ps1

#From the timings, my suspicion is:

#Create Collections is repeatedly doing Get-CMDeviceCollection.
#Move Collections is repeatedly doing folder lookups.
#Add OS/Disk/Memory Requirement is repeatedly loading and saving the Application XML.
#Create SCCM Application is waiting on SCCM provider commits.

##The next big optimization opportunity is probably in Move-PCXCMCollectionsToFolder.ps1 and New-PCXCMDeviceCollection.ps1. Those are likely where you'll save the most time.


##You still have not shown:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Application\New-PCXCMApplicationDeploymentType.ps1

##because this is where:
Add-CMScriptDeploymentType

##Next files I would inspect
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMObject.ps1

##and

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\New-PCXCMFolder.ps1

##Those two are currently the most suspicious files in your whole codebase. Based on your timings, I would not be surprised if they account for 10-20 minutes of the application creation workflow.

Review next
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Resolve-PCXCMPath.ps1

because every move operation uses it.


What I would measure next

Create a temporary test.

Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite



$Collection = Get-CMDeviceCollection `
    -Name 'APP Mozilla Firefox 151.0.5 [AVAILABLE]'

Measure-Command {

    Move-CMObject `
        -FolderPath 'PS1:\DeviceCollection\Test' `
        -InputObject $Collection

}

Measure-Command {
    New-PCXCMFolder -Path 'PS1:\DeviceCollection\Test' 
}

Then move it back.

Measure-Command {

    Move-CMObject `
        -FolderPath 'PS1:\DeviceCollection\Applications\Mozilla Firefox' `
        -InputObject $Collection

}

If each move takes:


Get-CMDeviceCollection


Next step is simple.

Show me these 4 files one by one.

#1. New-PCXCMApplication.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Application\New-PCXCMApplication.ps1
#2. Create-PCXCMPackage.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Package\Create-PCXCMPackage.ps1
#3. New-PCXCMDeviceCollection.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\New-PCXCMDeviceCollection.ps1
#4. New-PCXCMDeviceCollectionInFolder.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\New-PCXCMDeviceCollectionInFolder.ps1
#Paste all 4.


What I want next

Run:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\New-PCXCollections.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\New-PCXCMCollections.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\New-PCXCMDeviceCollections.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\New-PCXCMDeviceCollection.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCollections.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMCollectionsToFolder.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMPackageToFolder.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMApplicationToFolder.ps1


Next file I want

Show:

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\Move-PCXCMObject.ps1
Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Folder\New-PCXCMFolder.ps1

Those two are now my primary suspects.

Then test:

Clear-Host
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

#################################################################

Clear-Host

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\New-PCXCMDeviceCollection.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Public\Collection\New-PCXCollections.ps1

New-CMDeviceCollection `
    -Name "TEST_COLLECTION_001" `
    -LimitingCollectionName "All Systems"

Create-PCXCMApplication -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.50"

$ResultNewCollections = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 | Select-String 'function New-PCXCollections'
$ResultNewCollections

Get-content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCollections.ps1


$ResultCollection = New-CMDeviceCollection `
    -Name "TEST000101" `
    -LimitingCollectionName "All Systems"

$ResultCollection

$null = New-Item -Path '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection' -ItemType Directory # -Force
$null = New-Item -Path '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Deployment' -ItemType Directory #-Force
$null = New-Item -Path '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Folder' -ItemType Directory #-Force

Move-Item '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMCollectionFolder.ps1' '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\'

Move-Item '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationDeploymentObjects.ps1' '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Deployment\'

Move-Item '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationCollectionFolder.ps1' '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Folder\'

Move-Item '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationCollectionFolderID.ps1' '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Folder\'

$ResultMovedFunctions = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 | Select-String 'Get-PCXCMApplicationCollectionFolder|Get-PCXCMCollectionFolder|Get-PCXCMApplicationDeploymentObjects'

$ResultMovedFunctions


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMCollectionFolder.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Folder\Get-PCXCMApplicationCollectionFolder.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Folder\Get-PCXCMApplicationCollectionFolderID.ps1

tree .\src\Modules\PCXLab.SCCM\0.11.0\ /f   


$ResultApplicationCollectionFunctions = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application -Filter *.ps1 |
Select-Object Name

$ResultApplicationCollectionFunctions

Create-PCXCMPackage -Path "\\192.168.25.214\Package_Source\Applications\Google\Chrome\Google Chrome 145.0.7632.50"

$ResultNonPCXCMFunctions = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'function (Get|Set|New|Add|Remove|Import|Export|Test|Start|Stop|Invoke|Save)-PCX(?!CM)' |
Select-Object Path, Line

$ResultNonPCXCMFunctions


$ResultCachedPackageReferences = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Get-PCXCMPackageCached'

$ResultCachedPackageReferences

$ResultCollectionNamesReferences = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Get-PCXCollectionNames'

$ResultCollectionNamesReferences




#######################################################

#Yes. At this point I would do a controlled rename batch before adding more functions.

#Don't manually edit one-by-one yet. First collect everything that must change.

#Run these commands and paste the results.

#Step 1 - Find the 3 requirement functions
$ResultRequirementReferences = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Add-PCXDiskSpaceRequirementToDeploymentType|Add-PCXMemoryRequirementToDeploymentType|Add-PCXOSRequirementToDeploymentType'
$ResultRequirementReferences

#Step 2 - Find CollectionNames references
$ResultCollectionNamesReferences = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Get-PCXCollectionNames'
$ResultCollectionNamesReferences

#Step 3 - Find New-PCXCollections references
$ResultNewCollectionsReferences = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'New-PCXCollections'
$ResultNewCollectionsReferences

#Step 4 - Find Set-PCXCollectionRules references
$ResultCollectionRulesReferences = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Set-PCXCollectionRules'
$ResultCollectionRulesReferences

#Step 5 - Find ProgramNames references
$ResultProgramNamesReferences = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Get-PCXProgramNames'
$ResultProgramNamesReferences

#Step 6 - Find CommandLineForPackage references
$ResultCommandLineReferences = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Get-PCXCommandLineForPackage'
$ResultCommandLineReferences

#After you paste the results, I'll give you:


Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCollectionNames.ps1' `
    'Get-PCXCMDeploymentCollectionNames.ps1'

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMDeploymentCollectionNames.ps1'


Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Get-PCXCMDeploymentCollectionNames.ps1'

$ResultCollectionNamesReferences = Get-ChildItem .\src\Modules\PCXLab.SCCM\0.11.0 -Recurse -Filter *.ps1 |
Select-String 'Get-PCXCollectionNames'

$ResultCollectionNamesReferences

############################################


Clear-Host

#Step 3 - Rename New-PCXCollections

#3A Rename file
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCollections.ps1' `
    'New-PCXCMDeploymentCollections.ps1'

#3B Replace function name inside file
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCMDeploymentCollections.ps1') `
-replace 'function New-PCXCollections','function New-PCXCMDeploymentCollections' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\New-PCXCMDeploymentCollections.ps1'

#3C Update all callers automatically
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bNew-PCXCollections\b','New-PCXCMDeploymentCollections' |
    Set-Content $_.FullName
}
# 3D Verify
$ResultNewCollectionsReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'New-PCXCollections'

$ResultNewCollectionsReferences


###############################

#Step 4 - Rename Set-PCXCollectionRules

#This is the next highest-value cleanup.

#4A Rename file
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Set-PCXCollectionRules.ps1' `
    'Set-PCXCMDeploymentCollectionRules.ps1'

#4B Rename function inside file
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Set-PCXCMDeploymentCollectionRules.ps1') `
-replace 'function Set-PCXCollectionRules','function Set-PCXCMDeploymentCollectionRules' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Collection\Set-PCXCMDeploymentCollectionRules.ps1'

#4C Update all callers automatically
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bSet-PCXCollectionRules\b','Set-PCXCMDeploymentCollectionRules' |
    Set-Content $_.FullName
}
# 4D Verify
$ResultCollectionRulesReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Set-PCXCollectionRules'

$ResultCollectionRulesReferences

Expected:

##################################################


#Step 5 - Rename Get-PCXCommandLineForPackage

#5A Rename file
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCommandLineForPackage.ps1' `
    'Get-PCXCMCommandLineForPackage.ps1'

#5B Rename function inside file
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMCommandLineForPackage.ps1') `
-replace 'function Get-PCXCommandLineForPackage','function Get-PCXCMCommandLineForPackage' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMCommandLineForPackage.ps1'

#5C Update all callers automatically
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bGet-PCXCommandLineForPackage\b','Get-PCXCMCommandLineForPackage' |
    Set-Content $_.FullName
}
# 5D Verify
$ResultCommandLineReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Get-PCXCommandLineForPackage'

$ResultCommandLineReferences

##################################################

#Step 6 - Rename Get-PCXProgramNames

#6A Rename file
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXProgramNames.ps1' `
    'Get-PCXCMPackageProgramNames.ps1'
    
#6B Rename function inside file
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageProgramNames.ps1') `
-replace 'function Get-PCXProgramNames','function Get-PCXCMPackageProgramNames' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageProgramNames.ps1'

#6C Update all callers automatically
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bGet-PCXProgramNames\b','Get-PCXCMPackageProgramNames' |
    Set-Content $_.FullName
}
# 6D Verify
$ResultProgramNamesReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Get-PCXProgramNames'

$ResultProgramNamesReferences

Expected:


#################################################

#Step 7 - Disk Space Requirement
#7A Rename file
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXDiskSpaceRequirementToDeploymentType.ps1' `
    'Add-PCXCMApplicationDiskSpaceRequirementToDeploymentType.ps1'

#7B Rename function inside file
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationDiskSpaceRequirementToDeploymentType.ps1') `
-replace 'function Add-PCXDiskSpaceRequirementToDeploymentType','function Add-PCXCMApplicationDiskSpaceRequirementToDeploymentType' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationDiskSpaceRequirementToDeploymentType.ps1'

#7C Update all callers automatically
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bAdd-PCXDiskSpaceRequirementToDeploymentType\b','Add-PCXCMApplicationDiskSpaceRequirementToDeploymentType' |
    Set-Content $_.FullName
}

# 7D Verify
$ResultDiskRequirementReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Add-PCXDiskSpaceRequirementToDeploymentType'

$ResultDiskRequirementReferences

Expected:

######################################################

#Now let's do Step 8 - Memory Requirement.

#8A Rename file
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXMemoryRequirementToDeploymentType.ps1' `
    'Add-PCXCMApplicationMemoryRequirementToDeploymentType.ps1'

#8B Rename function inside file
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationMemoryRequirementToDeploymentType.ps1') `
-replace 'function Add-PCXMemoryRequirementToDeploymentType','function Add-PCXCMApplicationMemoryRequirementToDeploymentType' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationMemoryRequirementToDeploymentType.ps1'

#8C Update all callers automatically
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bAdd-PCXMemoryRequirementToDeploymentType\b','Add-PCXCMApplicationMemoryRequirementToDeploymentType' |
    Set-Content $_.FullName
}

# 8D Verify
$ResultMemoryRequirementReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Add-PCXMemoryRequirementToDeploymentType'

$ResultMemoryRequirementReferences

Expected:

#########################

#Now let's do Step 8 - Memory Requirement.

#8A Rename file
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXMemoryRequirementToDeploymentType.ps1' `
    'Add-PCXCMApplicationMemoryRequirementToDeploymentType.ps1'

#    8B Rename function inside file
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationMemoryRequirementToDeploymentType.ps1') `
-replace 'function Add-PCXMemoryRequirementToDeploymentType','function Add-PCXCMApplicationMemoryRequirementToDeploymentType' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationMemoryRequirementToDeploymentType.ps1'

#8C Update all callers automatically
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bAdd-PCXMemoryRequirementToDeploymentType\b','Add-PCXCMApplicationMemoryRequirementToDeploymentType' |
    Set-Content $_.FullName
}

#8D Verify
$ResultMemoryRequirementReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Add-PCXMemoryRequirementToDeploymentType'

$ResultMemoryRequirementReferences

Expected:

Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application' |
Where-Object Name -like '*Memory*'


Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application' |
Where-Object Name -match 'Disk|Memory|OS'

###############################################

#9A Rename file
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXOSRequirementToDeploymentType.ps1' `
    'Add-PCXCMApplicationOSRequirementToDeploymentType.ps1'

#    9B Rename function inside file
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationOSRequirementToDeploymentType.ps1') `
-replace 'function Add-PCXOSRequirementToDeploymentType','function Add-PCXCMApplicationOSRequirementToDeploymentType' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationOSRequirementToDeploymentType.ps1'

#9C Update all callers
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bAdd-PCXOSRequirementToDeploymentType\b','Add-PCXCMApplicationOSRequirementToDeploymentType' |
    Set-Content $_.FullName
}

#9D Verify
$ResultOSRequirementReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Add-PCXOSRequirementToDeploymentType'

$ResultOSRequirementReferences

Expected:


$ResultNonPCXCMFunctions = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'function (Get|Set|New|Add|Remove|Import|Export|Test|Start|Stop|Invoke|Save)-PCX(?!CM)' |
Select-Object Path, Line

$ResultNonPCXCMFunctions

####################################

$ResultOSHelpers = Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXOSRequirementToXML.ps1'

$ResultOSHelpers

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXOSRequirementOperand.ps1'

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\New-PCXOSRequirementRule.ps1'

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Test-PCXOSRequirementExists.ps1'


$ResultOSHelperReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Add-PCXOSRequirementToXML|Get-PCXOSRequirementOperand|New-PCXOSRequirementRule|Test-PCXOSRequirementExists'

$ResultOSHelperReferences


####################

Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXOSRequirementToXML.ps1' `
    'Add-PCXCMApplicationOSRequirementToXML.ps1'

Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXOSRequirementOperand.ps1' `
    'Get-PCXCMApplicationOSRequirementOperand.ps1'

Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\New-PCXOSRequirementRule.ps1' `
    'New-PCXCMApplicationOSRequirementRule.ps1'

Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Test-PCXOSRequirementExists.ps1' `
    'Test-PCXCMApplicationOSRequirementExists.ps1'

    #################################


    Now do Step 10B - Rename the function names inside those 4 files.

(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationOSRequirementToXML.ps1') `
-replace 'function Add-PCXOSRequirementToXML','function Add-PCXCMApplicationOSRequirementToXML' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Add-PCXCMApplicationOSRequirementToXML.ps1'

(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationOSRequirementOperand.ps1') `
-replace 'function Get-PCXOSRequirementOperand','function Get-PCXCMApplicationOSRequirementOperand' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXCMApplicationOSRequirementOperand.ps1'

(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\New-PCXCMApplicationOSRequirementRule.ps1') `
-replace 'function New-PCXOSRequirementRule','function New-PCXCMApplicationOSRequirementRule' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\New-PCXCMApplicationOSRequirementRule.ps1'

(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Test-PCXCMApplicationOSRequirementExists.ps1') `
-replace 'function Test-PCXOSRequirementExists','function Test-PCXCMApplicationOSRequirementExists' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Test-PCXCMApplicationOSRequirementExists.ps1'

After that, verify the function declarations:

$ResultOSFunctions = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application' -Filter '*OSRequirement*' |
ForEach-Object {
    Select-String -Path $_.FullName -Pattern '^function '
}

$ResultOSFunctions

##############################

#Step 10C - Update all references
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {

    (Get-Content $_.FullName) `
    -replace '\bAdd-PCXOSRequirementToXML\b','Add-PCXCMApplicationOSRequirementToXML' `
    -replace '\bGet-PCXOSRequirementOperand\b','Get-PCXCMApplicationOSRequirementOperand' `
    -replace '\bNew-PCXOSRequirementRule\b','New-PCXCMApplicationOSRequirementRule' `
    -replace '\bTest-PCXOSRequirementExists\b','Test-PCXCMApplicationOSRequirementExists' |
    Set-Content $_.FullName
}
#Step 10D - Verify nothing remains
$ResultOldOSNames = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Add-PCXOSRequirementToXML|Get-PCXOSRequirementOperand|New-PCXOSRequirementRule|Test-PCXOSRequirementExists'

$ResultOldOSNames

Expected result:

PS> $ResultOldOSNames

# No output

#####################################################

$ResultRemainingNonPCXCM = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'function (Get|Set|New|Add|Remove|Import|Export|Test|Start|Stop|Invoke|Save)-PCX(?!CM)' |
ForEach-Object {
    $_.Line.Trim()
} |
Sort-Object

$ResultRemainingNonPCXCM

##############


Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Core\Invoke-PCXAnalysisReport.ps1

Get-Content .\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Save-PCXOSRequirementReport.ps1


$ResultOSRequirementReport = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Where-Object {
    $_.Name -like '*OSRequirementReport*'
}

$ResultOSRequirementReport


Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXApplicationXML.ps1'

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Save-PCXApplicationXML.ps1'

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Import-PCXApplicationList.ps1'

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\New-PCXDetectionClause.ps1'

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXInstaller.ps1'


$ResultInstallerReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Get-PCXInstaller'

$ResultInstallerReferences


#A Rename file
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXInstaller.ps1' `
    'Get-PCXCMPackageInstaller.ps1'


    ###############################

    Now do Step B.

(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageInstaller.ps1') `
-replace 'function Get-PCXInstaller','function Get-PCXCMPackageInstaller' `
-replace '#Get-PCXInstaller','#Get-PCXCMPackageInstaller' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageInstaller.ps1'

Then verify:

Select-String `
-Path '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Get-PCXCMPackageInstaller.ps1' `
-Pattern 'function |#Get-PCX'

#Paste the output and we'll do Step C (update all callers automatically).


#####################################

Now Step C.

Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bGet-PCXInstaller\b','Get-PCXCMPackageInstaller' 

    ######################

   # Now do Step C (update every caller automatically).

Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bGet-PCXInstaller\b','Get-PCXCMPackageInstaller' |
    Set-Content $_.FullName
}

#Then verify no old references remain:

$ResultInstallerReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Get-PCXInstaller'

$ResultInstallerReferences

Expected result:


Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Add-PCXProgram.ps1'

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Test-PCXHasUpgrade.ps1'

Please provide:

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\*\Get-PCXApplicationXML.ps1'

and also:

Select-String -Path '.\src\Modules\PCXLab.SCCM\0.11.0\**\*.ps1' -Pattern 'Get-PCXApplicationXML'

This will let me verify:


Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Get-PCXApplicationXML.ps1'

Then also run:

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Logging\Initialize-PCXLogConfiguration.ps1'

Reason:

#######################

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Add-PCXProgram.ps1'


Now we do Step 5 (rename file):

Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Add-PCXProgram.ps1' `
    'Add-PCXCMPackageProgram.ps1'

###################################

Now Step 6.

(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Add-PCXCMPackageProgram.ps1') `
-replace 'function Add-PCXProgram','function Add-PCXCMPackageProgram' `
-replace '#Add-PCXProgram','#Add-PCXCMPackageProgram' | Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Add-PCXCMPackageProgram.ps1'

################################

Then verify:

Select-String `
    -Path '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Add-PCXCMPackageProgram.ps1' `
    -Pattern 'function |#Add-PCX'

####################

Now Step 7 (update all callers)

Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {
    (Get-Content $_.FullName) `
    -replace '\bAdd-PCXProgram\b','Add-PCXCMPackageProgram' | Set-Content $_.FullName
}

#################################

Step 8: Verify no old references remain.

$ResultReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String 'Add-PCXProgram'

$ResultReferences

Expected: No output

###############################

Now Step 9.

Remove-Item 'C:\Program Files\WindowsPowerShell\Modules\PCXLab.SCCM\*.psd1' -Force




###################

Select-String `
    -Path '.\src\Modules\PCXLab.SCCM\0.11.0\**\*.ps1' `
    -Pattern '\bGet-PCXApplicationXML\b'


    #############################

    #Let's check the sibling function because they should be renamed together.

#Please provide:

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Save-PCXApplicationXML.ps1'

#and

Select-String `
    -Path '.\src\Modules\PCXLab.SCCM\0.11.0\**\*.ps1' `
    -Pattern '\bSave-PCXApplicationXML\b'

My expectation is that:

Next File

Please send:

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\Import-PCXApplicationList.ps1'

and

Select-String `
    -Path '.\src\Modules\PCXLab.SCCM\0.11.0\**\*.ps1' `
    -Pattern '\bImport-PCXApplicationList\b'

I want to verify whether Import-PCXCMApplicationList is the correct name before we


######################

Please send:

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\New-PCXDetectionClause.ps1'

and

Select-String `
    -Path '.\src\Modules\PCXLab.SCCM\0.11.0\**\*.ps1' `
    -Pattern '\bNew-PCXDetectionClause\b'



    Please send:

Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Add-PCXProgram.ps1'

and

Select-String `
    -Path '.\src\Modules\PCXLab.SCCM\0.11.0\**\*.ps1' `
    -Pattern '\bAdd-PCXProgram\b'

#fter that we'll inspect Test-PCXHasUpgrade, verify callers, and then we should have the



Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Package\Test-PCXHasUpgrade.ps1'


Select-String `
    -Path '.\src\Modules\PCXLab.SCCM\0.11.0\**\*.ps1' `
    -Pattern '\bTest-PCXHasUpgrade\b'




#Clear-Host
# Import-Module "C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\src\Modules\PCXLab.SCCM\v_Archive\v0.11.0_Backup24.32\PCXLab.SCCM.psm1"
#
Set-Location C:\Projects\PCXLABCMAutomation_ADDOSREQANTIGRAVITY\
Remove-Module PCXLab.SCCM -Force
Import-Module .\src\Modules\PCXLab.SCCM
Connect-PCXCMSite

tree .\src\Modules\PCXLab.SCCM\0.11.0 /f

Get-Command -module PCXLab.SCCM


##########################
#4. New-PCXDetectionClause → New-PCXCMApplicationDetectionClause
#A - Rename File
Rename-Item `
    '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\New-PCXDetectionClause.ps1' `
    'New-PCXCMApplicationDetectionClause.ps1'

#    B - Rename Function
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\New-PCXCMApplicationDetectionClause.ps1') `
-replace 'function New-PCXDetectionClause','function New-PCXCMApplicationDetectionClause' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Application\New-PCXCMApplicationDetectionClause.ps1'

#C - Rename Callers
Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
ForEach-Object {

    (Get-Content $_.FullName) `
    -replace '\bNew-PCXDetectionClause\b','New-PCXCMApplicationDetectionClause' |
    Set-Content $_.FullName
}

#D - Update Logging Mapping
(Get-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Logging\Initialize-PCXLogConfiguration.ps1') `
-replace '"New-PCXDetectionClause"','"New-PCXCMApplicationDetectionClause"' |
Set-Content '.\src\Modules\PCXLab.SCCM\0.11.0\Private\Logging\Initialize-PCXLogConfiguration.ps1'

#E - Verify Old Name Removed
$ResultNewPCXDetectionClauseReferences = Get-ChildItem '.\src\Modules\PCXLab.SCCM\0.11.0' -Recurse -Filter *.ps1 |
Select-String '\bNew-PCXDetectionClause\b'

$ResultNewPCXDetectionClauseReferences

Expected:

# no output
#F - Reload Module
Remove-Module PCXLab.SCCM -Force -ErrorAction SilentlyContinue

Import-Module .\src\Modules\PCXLab.SCCM -Force
#G - Verify Export
Get-Command -Module PCXLab.SCCM New-PCXCMApplicationDetectionClause

Get-Command -Module PCXLab.SCCM New-PCXDetectionClause -ErrorAction SilentlyContinue

Expected: