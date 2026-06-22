function Get-PCXCMCachedDeployment {

    [CmdletBinding()]
    param(
        [switch]$ForceRefresh,

        [int]$ExpiresHours = 24
    )

    $CacheName = 'Deployments'

    if (
        -not $ForceRefresh -and
        (Test-PCXCMCacheExists -Name $CacheName) -and
        (-not (Test-PCXCMCacheExpired -Name $CacheName))
    ) {

        $CacheStatus = Get-PCXCMCacheStatus `
            -Name $CacheName

        Write-PCXLog `
            -Message "Using cached deployments. Age=$($CacheStatus.AgeHours)h"

        return Get-PCXCMCache `
            -Name $CacheName
    }

    Write-PCXLog `
        -Message "Refreshing deployments cache"

    Ensure-PCXCMConnection

    $ResultDeployments = Get-CMDeployment

    Save-PCXCMCache `
        -Name $CacheName `
        -Data $ResultDeployments `
        -ExpiresHours $ExpiresHours

    return $ResultDeployments
}