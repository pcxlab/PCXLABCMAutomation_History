function Write-PCXAnalysisResult {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [psobject]$InputObject,

        [Parameter(Mandatory)]
        [string]$Path
    )

    $FileExists = Test-Path -Path $Path

    if ($FileExists) {
        $InputObject | Export-Csv -Path $Path -NoTypeInformation -Append -Force
        return
    }

    $InputObject | Export-Csv -Path $Path -NoTypeInformation -Force
}