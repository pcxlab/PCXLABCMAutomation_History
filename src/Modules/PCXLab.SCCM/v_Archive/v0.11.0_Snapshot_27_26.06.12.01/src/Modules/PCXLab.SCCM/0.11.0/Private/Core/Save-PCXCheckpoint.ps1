function Save-PCXCheckpoint {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path,

        [Parameter(Mandatory)]
        [string]$CurrentObject
    )

    @{
        CurrentObject = $CurrentObject
        Timestamp = Get-Date
    } | ConvertTo-Json | Set-Content -Path $Path
}