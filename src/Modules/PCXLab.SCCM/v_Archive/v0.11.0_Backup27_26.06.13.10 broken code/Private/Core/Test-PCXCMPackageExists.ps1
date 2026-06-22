function Test-PCXCMPackageExists {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$PackageName
    )

    try {

        return $null -ne (
            Get-PCXCMPackageCached |
            Where-Object {
                $_.Name -eq $PackageName
            } |
            Select-Object -First 1
        )
    }
    catch {

        Write-PCXLog `
            -Message $_.Exception.Message `
            -Level ERROR

        throw
    }
}
