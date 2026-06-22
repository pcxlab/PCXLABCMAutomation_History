function Get-PCXCMCachedDistributionStatus {

    [CmdletBinding()]
    param(
        [switch]$ForceRefresh,

        [int]$ExpiresHours = 24
    )

    $CacheName = 'DistributionStatus'

    if (
        -not $ForceRefresh -and
        (Test-PCXCMCacheExists -Name $CacheName) -and
        (-not (Test-PCXCMCacheExpired -Name $CacheName))
    ) {

        $CacheStatus = Get-PCXCMCacheStatus |
            Where-Object Name -eq $CacheName

        Write-PCXLog `
            -Message "Using cached distribution status. Age=$($CacheStatus.AgeHours)h"

        return Get-PCXCMCache `
            -Name $CacheName
    }

    Write-PCXLog `
        -Message "Refreshing distribution status cache"

    Ensure-PCXCMConnection

    $ResultDistributionStatus = Get-CMDistributionStatus

    Save-PCXCMCache `
        -Name $CacheName `
        -Data $ResultDistributionStatus `
        -ExpiresHours $ExpiresHours

    return $ResultDistributionStatus
}