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

        Write-PCXLog `
            -Message $_.Exception.Message `
            -Level ERROR

        throw
    }
}