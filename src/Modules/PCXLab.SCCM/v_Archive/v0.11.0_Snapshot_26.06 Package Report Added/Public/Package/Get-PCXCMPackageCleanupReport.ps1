function Get-PCXCMPackageCleanupReport {

    [CmdletBinding()]
    param(
        [string]$Name = '*'
    )

    begin {

        Write-PCXOperationStart
    }

    process {

        try {

            Ensure-PCXCMConnection

            $Packages = Get-CMPackage `
                -Name $Name `
                -Fast

            foreach ($Package in $Packages) {

                $SourcePathStatus = Get-PCXCMPackageSourcePathStatus `
                    -SourcePath $Package.PkgSourcePath

                $DeploymentCount = Get-PCXCMPackageDeploymentCount `
                    -Package $Package

                $CollectionCount = Get-PCXCMPackageCollectionCount `
                    -Package $Package

                $LastModifiedAgeDays = Get-PCXCMPackageLastModifiedAge `
                    -Package $Package

                $DistributionStatus = Get-PCXCMPackageDistributionStatus `
                    -Package $Package

                $Risk = Get-PCXCMPackageCleanupRisk `
                    -Recommendation $Recommendation

                $Recommendation = Get-PCXCMPackageCleanupRecommendation `
                    -DeploymentCount $DeploymentCount `
                    -CollectionCount $CollectionCount `
                    -LastModifiedAgeDays $LastModifiedAgeDays

                [PSCustomObject]@{
                    PackageName         = $Package.Name
                    PackageID           = $Package.PackageID
                    Manufacturer        = $Package.Manufacturer
                    Version             = $Package.Version
                    SourcePath          = $Package.PkgSourcePath
                    SourcePathStatus    = $SourcePathStatus

                    DeploymentCount     = $DeploymentCount
                    CollectionCount     = $CollectionCount
                    LastModifiedAgeDays = $LastModifiedAgeDays

                    DistributionStatus = $DistributionStatus

                    Risk               = $Risk
                    Recommendation     = $Recommendation
                }
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