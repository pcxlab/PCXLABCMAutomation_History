function Initialize-PCXAnalysisReport {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path -Path $Path)) {
        New-Item -Path $Path -ItemType File -Force | Out-Null
    }

    return $Path
}