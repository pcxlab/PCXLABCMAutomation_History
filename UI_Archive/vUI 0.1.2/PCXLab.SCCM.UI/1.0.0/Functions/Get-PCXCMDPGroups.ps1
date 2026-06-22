function Get-PCXCMDPGroups {
    [CmdletBinding()]
    param([switch]$ForceRefresh)

    try {
        $GroupData = $null

        # Prefer cached module function
        if (Get-Command Get-PCXCMCachedDistributionPointGroup -ErrorAction SilentlyContinue) {
            $GroupData = Get-PCXCMCachedDistributionPointGroup -ForceRefresh:$ForceRefresh -ErrorAction SilentlyContinue
        }
        
        # Fallback to direct SCCM query
        if (-not $GroupData -and (Get-Module -Name "ConfigurationManager")) {
            $GroupData = Get-CMDistributionPointGroup -ErrorAction SilentlyContinue
        }

        if ($GroupData) {
            $Names = @()
            foreach ($Group in $GroupData) {
                if ($Group.Name) { $Names += $Group.Name }
            }

            if ($Names.Count -gt 0) {
                return $Names | Sort-Object -Unique
            }
        }
    }
    catch {
        Write-Warning "Failed to query DP Groups: $($_.Exception.Message)"
    }

    # Static fallback
    return @(
        "All Mangalore DPs",
        "All Bangalore DPs",
        "All Mumbai DPs",
        "All Chennai DPs",
        "All Pune DPs",
        "All Kochi DPs",
        "All DPs",
        "Pilot DPs",
        "Test DPs"
    )
}