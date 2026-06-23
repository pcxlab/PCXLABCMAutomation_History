function Get-PCXCMPackageCached {

    [CmdletBinding()]
    param(
        [switch]$ForceRefresh,

        [int]$ExpiresHours = 24
    )

    $CacheName = 'Packages'

    if (
        -not $ForceRefresh -and
        (Test-PCXCMCacheExists -Name $CacheName) -and
        (-not (Test-PCXCMCacheExpired -Name $CacheName))
    ) {

        $CacheStatus = Get-PCXCMCacheStatus `
            -Name $CacheName

        Write-PCXLog `
            -Message "Using cached packages. Age=$($CacheStatus.AgeHours)h"

        return Get-PCXCMCache `
            -Name $CacheName
    }

    Write-PCXLog `
        -Message 'Refreshing packages cache'

    Ensure-PCXCMConnection

    $ResultPackages = Get-CMPackage -Fast

    Save-PCXCMCache `
        -Name $CacheName `
        -Data $ResultPackages `
        -ExpiresHours $ExpiresHours

    return $ResultPackages
}