function Get-PCXCMDeploymentCleanupReport {

    [CmdletBinding()]
    param()

    begin {

        Write-PCXOperationStart
    }

    process {

        try {

            Ensure-PCXCMConnection
            
            $ResultTime = Measure-Command {
    $Cache = Initialize-PCXCMCache -IncludeCollections
}
Write-Host "Cache: $($ResultTime.TotalSeconds) sec"

$ResultTime = Measure-Command {
    $Deployments = Get-CMDeployment
}
Write-Host "Get-CMDeployment: $($ResultTime.TotalSeconds) sec"

$ResultTime = Measure-Command {

    foreach ($Deployment in $Deployments) {

        $DeploymentIntentName = Get-PCXCMDeploymentIntentName `
            -DeploymentIntent $Deployment.DeploymentIntent

        $CollectionMemberCount = Get-PCXCMDeploymentCollectionMemberCount `
            -Deployment $Deployment `
            -Collections $Cache.Collections

        $Enabled = Get-PCXCMDeploymentEnabledStatus `
            -Deployment $Deployment

        $DeploymentAgeDays = Get-PCXCMDeploymentAge `
            -Deployment $Deployment

        $CleanupScore = Get-PCXCMDeploymentCleanupScore `
            -CollectionMemberCount $CollectionMemberCount `
            -NumberTargeted $Deployment.NumberTargeted `
            -Enabled $Enabled

        $Recommendation = Get-PCXCMDeploymentCleanupRecommendation `
            -CollectionMemberCount $CollectionMemberCount `
            -NumberTargeted $Deployment.NumberTargeted `
            -Enabled $Enabled

        $Risk = Get-PCXCMCleanupRisk `
            -Recommendation $Recommendation
    }
}

Write-Host "Loop: $($ResultTime.TotalSeconds) sec"
        }
        catch {
            Write-PCXLog -Message $_.Exception.Message -Level ERROR
            throw
        }
    }
    end {
        Write-PCXOperationEnd
    }
}