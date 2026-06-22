function Write-PCXAnalysisResult {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [psobject]$InputObject,

        [Parameter(Mandatory)]
        [string]$Path
    )

    $FileExists = Test-Path -Path $Path
    $ExportParams = @{
        Path              = $Path
        NoTypeInformation = $true
        Force             = $true
    }

    if ($FileExists) {
        $InputObject | Export-Csv @ExportParams -Append
        return
    }

    $InputObject | Export-Csv @ExportParams
}