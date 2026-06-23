function Get-PCXCMCachedTaskSequence {

    [CmdletBinding()]
    param(
        [switch]$ForceRefresh,

        [int]$ExpiresHours = 24
    )

    $CacheName = 'TaskSequences'

    if (
        -not $ForceRefresh -and
        (Test-PCXCMCacheExists -Name $CacheName) -and
        (-not (Test-PCXCMCacheExpired -Name $CacheName))
    ) {

        $CacheStatus = Get-PCXCMCacheStatus `
            -Name $CacheName

        Write-PCXLog `
            -Message "Using cached task sequences. Age=$($CacheStatus.AgeHours)h"

        return Get-PCXCMCache -Name $CacheName
    }

    Write-PCXLog `
        -Message "Refreshing task sequences cache"

    Ensure-PCXCMConnection

    $ResultTaskSequences = @(
        Get-CMTaskSequence -Fast
    )

    if ($null -eq $ResultTaskSequences) {
        $ResultTaskSequences = @()
    }

    Save-PCXCMCache `
        -Name $CacheName `
        -Data $ResultTaskSequences `
        -ExpiresHours $ExpiresHours

    return $ResultTaskSequences
}