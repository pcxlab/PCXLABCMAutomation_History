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

        Write-PCXLog `
            -Message $_.Exception.Message `
            -Level ERROR

        throw
    }
}