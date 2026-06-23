function Move-PCXCMPackageToFolder {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [pscustomobject]$meta
    )

    begin {

        Write-PCXOperationStart
    }

    process {
        try {

            $PackageName = "PKG $($meta.Name)"

            $folder = "\Package\Application Installation\$($meta.Company)\$($meta.Product)"

            $null = New-PCXCMFolder -Path $folder

            $PackageLookup = @{}

            Get-PCXCMCachedPackage | ForEach-Object {
                $PackageLookup[$_.Name] = $_
            }

            $packageObject = $PackageLookup[$PackageName]

            if (-not $packageObject) {
                throw "Package not found: $PackageName"
            }

            Move-PCXCMObject `
                -InputObject $packageObject `
                -FolderPath $folder

            Write-PCXLog "Moved Package: $PackageName"
        }
        catch {

            Write-PCXLog `
                -Message "Failed to move package: $PackageName. $($_.Exception.Message)" `
                -Level ERROR

            throw
        }
    }

    end {

        Write-PCXOperationEnd -Status Success
    }
}
