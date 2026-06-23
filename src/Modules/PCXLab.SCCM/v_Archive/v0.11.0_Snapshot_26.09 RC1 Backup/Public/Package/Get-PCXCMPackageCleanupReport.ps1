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

            $Packages = Get-CMPackage -Name $Name -Fast

            foreach ($Package in $Packages) {

                $PackageSize = Get-PCXCMPackageSize `
                    -Package $Package

                $SourcePathStatus = Get-PCXCMPackageSourcePathStatus `
                    -SourcePath $Package.PkgSourcePath

                $SourceVersion = Get-PCXCMPackageSourceVersion `
    -Package $Package

                $DeploymentCount = Get-PCXCMPackageDeploymentCount `
                    -Package $Package

                $CollectionCount = Get-PCXCMPackageCollectionCount `
                    -Package $Package

                $ProgramCount = Get-PCXCMPackageProgramCount `
                    -Package $Package    

                $LastModifiedAgeDays = Get-PCXCMPackageLastModifiedAge `
                    -Package $Package

                $DistributionStatus = Get-PCXCMPackageDistributionStatus `
                    -Package $Package

                $Recommendation = Get-PCXCMPackageCleanupRecommendation `
                    -DeploymentCount $DeploymentCount `
                    -CollectionCount $CollectionCount `
                    -LastModifiedAgeDays $LastModifiedAgeDays

                $Risk = Get-PCXCMCleanupRisk `
                    -Recommendation $Recommendation

                [PSCustomObject]@{
                    PackageName         = $Package.Name
                    PackageID           = $Package.PackageID
                    Manufacturer        = $Package.Manufacturer
                    Version             = $Package.Version
                    SourcePath          = $Package.PkgSourcePath
                    PackageSize         = $PackageSize
                    SourcePathStatus    = $SourcePathStatus
                    SourceVersion       = $SourceVersion

                    DeploymentCount     = $DeploymentCount
                    CollectionCount     = $CollectionCount
                    ProgramCount        = $ProgramCount
                    LastModifiedAgeDays = $LastModifiedAgeDays

                    DistributionStatus  = $DistributionStatus

                    Risk                = $Risk
                    Recommendation      = $Recommendation
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