function Get-PCXCMCachedCollection {

    [CmdletBinding()]
    param(
        [switch]$ForceRefresh,

        [int]$ExpiresHours = 24
    )

    $CacheName = 'Collections'

    if (
        -not $ForceRefresh -and
        (Test-PCXCMCacheExists -Name $CacheName) -and
        (-not (Test-PCXCMCacheExpired -Name $CacheName))
    ) {

        $CacheStatus = Get-PCXCMCacheStatus `
            -Name Collections

        Write-PCXLog `
            -Message "Using cached collections. Age=$($CacheStatus.AgeHours)h"

        return Get-PCXCMCache -Name $CacheName
    }

    Write-PCXLog -Message "Refreshing collections cache"

    Ensure-PCXCMConnection

    $ResultCollections = Get-CMDeviceCollection

    Save-PCXCMCache `
        -Name $CacheName `
        -Data $ResultCollections `
        -ExpiresHours $ExpiresHours

    return $ResultCollections
}