###############################
function New-PCXCMFolder {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [string]$Path,

        [Parameter(Mandatory)]
        [string]$Name,

        [switch]$AutoCreatePath
    )

    if ([string]::IsNullOrWhiteSpace($Name)) {
        throw "Folder name cannot be empty."
    }

    $siteCode = Get-PCXCMSiteCode
    if (-not $siteCode) {
        throw "Failed to retrieve SCCM Site Code."
    }

    if (-not (Get-PSDrive -Name $siteCode -ErrorAction SilentlyContinue)) {
        throw "PSDrive '$siteCode' not found. Load ConfigurationManager module."
    }

    $rootPath = "$siteCode`:"
    $segments = ($Path.Trim('\') -split '\\') | Where-Object { $_ }

    $currentPath = $rootPath

    try {
        if ($AutoCreatePath) {
            foreach ($folder in $segments) {
                $nextPath = Join-Path $currentPath $folder

                if (-not (Test-Path $nextPath)) {
                    if ($PSCmdlet.ShouldProcess($nextPath, "Create folder")) {
                        New-Item -Path $currentPath -Name $folder -ItemType Directory -ErrorAction Stop
                        Write-Verbose "Created: $nextPath"
                    }
                }
                $currentPath = $nextPath
            }
        } else {
            $currentPath = Join-Path $rootPath ($segments -join '\')

            if (-not (Test-Path $currentPath)) {
                throw "Path '$Path' does not exist. Use -AutoCreatePath."
            }
        }

        $finalPath = Join-Path $currentPath $Name

        if (-not (Test-Path $finalPath)) {
            if ($PSCmdlet.ShouldProcess($finalPath, "Create folder")) {
                New-Item -Path $currentPath -Name $Name -ItemType Directory -ErrorAction Stop
                Write-Verbose "Created: $finalPath"
            }
        } else {
            Write-Verbose "Already exists: $finalPath"
        }

        return [PSCustomObject]@{
            Success = $true
            Path    = $finalPath
        }

    } catch {
        Write-Error "Failed to create folder: $_"
        return [PSCustomObject]@{
            Success = $false
            Error   = $_.Exception.Message
        }
    }
}
###############################

#New-PCXCMFolder -Path "\DeviceCollection\RootFolder\SubFoler" -Name "Child" -AutoCreatePath
#New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFoler" -Name "Child" -AutoCreatePath
#New-PCXCMFolder -Path "DeviceCollection\RootFolder\" -Name "Child" -AutoCreatePath
#New-PCXCMFolder -Path "\DeviceCollection\" -Name "Child" -AutoCreatePath
#New-PCXCMFolder -Path "\DeviceCollection\AAA" -Name "Child"

###############################
