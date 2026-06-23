function Get-PCXCMCachedTaskSequenceDeployment {

    [CmdletBinding()]
    param(
        [switch]$ForceRefresh,

        [int]$ExpiresHours = 24
    )

    $CacheName = 'TaskSequenceDeployments'

    if (
        -not $ForceRefresh -and
        (Test-PCXCMCacheExists -Name $CacheName) -and
        (-not (Test-PCXCMCacheExpired -Name $CacheName))
    ) {

        $CacheStatus = Get-PCXCMCacheStatus `
            -Name $CacheName

        Write-PCXLog `
            -Message "Using cached task sequence deployments. Age=$($CacheStatus.AgeHours)h"

        return Get-PCXCMCache -Name $CacheName
    }

    Write-PCXLog `
        -Message "Refreshing task sequence deployments cache"

    Ensure-PCXCMConnection

    $ResultTaskSequenceDeployments = @(
        Get-CMTaskSequenceDeployment -Fast
    )

    if ($null -eq $ResultTaskSequenceDeployments) {
        $ResultTaskSequenceDeployments = @()
    }

    Save-PCXCMCache `
        -Name $CacheName `
        -Data $ResultTaskSequenceDeployments `
        -ExpiresHours $ExpiresHours

    return $ResultTaskSequenceDeployments
}