function Get-PCXCMCleanupDashboard {

    [CmdletBinding()]
    param()

    begin {

        Write-PCXOperationStart
    }

    process {

        try {

            $ResultApplicationCleanupSummary = Get-PCXCMApplicationCleanupSummary
            $ResultPackageCleanupSummary = Get-PCXCMPackageCleanupSummary
            $ResultCollectionCleanupSummary = Get-PCXCMCollectionCleanupSummary
            $ResultDeploymentCleanupSummary = Get-PCXCMDeploymentCleanupSummary

            [PSCustomObject]@{
                Applications = $ResultApplicationCleanupSummary
                Packages     = $ResultPackageCleanupSummary
                Collections  = $ResultCollectionCleanupSummary
                Deployments  = $ResultDeploymentCleanupSummary
            }
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