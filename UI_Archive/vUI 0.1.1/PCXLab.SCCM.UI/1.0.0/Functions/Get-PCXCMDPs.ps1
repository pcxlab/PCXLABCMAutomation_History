function Get-PCXCMDPs {
    [CmdletBinding()]
    param([switch]$ForceRefresh)

    try {
        $DPData = $null

        # Prefer cached module function
        if (Get-Command Get-PCXCMCachedDistributionPoint -ErrorAction SilentlyContinue) {
            $DPData = Get-PCXCMCachedDistributionPoint -ForceRefresh:$ForceRefresh -ErrorAction SilentlyContinue
        }

        # Fallback to direct SCCM query if cache is empty or function missing
        if (-not $DPData -and (Get-Module -Name "ConfigurationManager")) {
            $DPData = Get-CMDistributionPoint -ErrorAction SilentlyContinue
        }

        if ($DPData) {
            # Extract names safely. Get-PCXCMCachedDistributionPoint returns SMS_SCI_SysResUse with NetworkOSPath
            $Names = @()
            foreach ($DP in $DPData) {
                if ($DP.NetworkOSPath) { 
                    $Names += $DP.NetworkOSPath.TrimStart('\')
                }
                elseif ($DP.NetworkName) { $Names += $DP.NetworkName }
                elseif ($DP.ServerName) { $Names += $DP.ServerName }
                elseif ($DP.Name) { $Names += $DP.Name }
            }

            if ($Names.Count -gt 0) {
                return $Names | Sort-Object -Unique
            }
        }
    }
    catch {
        Write-Warning "Failed to query DPs: $($_.Exception.Message)"
    }

    # Static fallback
    return @(
        "cm01.corp.pcxlab.com",
        "man01.corp.pcxlab.com",
        "Ban01.corp.pcxlab.com",
        "PUN01.corp.pcxlab.com",
        "Chi01.corp.pcxlab.com",
        "Koc01.corp.pcxlab.com"
    )
}