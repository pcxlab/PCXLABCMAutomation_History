function Get-PCXCMCachedApplication {

    [CmdletBinding()]
    param(
        [switch]$ForceRefresh,

        [int]$ExpiresHours = 24
    )

    $CacheName = 'Applications'

    if (
        -not $ForceRefresh -and
        (Test-PCXCMCacheExists -Name $CacheName) -and
        (-not (Test-PCXCMCacheExpired -Name $CacheName))
    ) {

        $CacheStatus = Get-PCXCMCacheStatus `
            -Name $CacheName

        Write-PCXLog `
            -Message "Using cached applications. Age=$($CacheStatus.AgeHours)h"

        return Get-PCXCMCache `
            -Name $CacheName
    }

    Write-PCXLog `
        -Message 'Refreshing applications cache'

    Ensure-PCXCMConnection

    $ResultApplications = Get-CMApplication -Fast

    Save-PCXCMCache `
        -Name $CacheName `
        -Data $ResultApplications `
        -ExpiresHours $ExpiresHours

    return $ResultApplications
}