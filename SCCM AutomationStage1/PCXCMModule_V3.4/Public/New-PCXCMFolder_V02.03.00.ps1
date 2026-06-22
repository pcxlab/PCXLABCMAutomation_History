###############################
function New-PCXCMFolder {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [string]$Path,

        [string]$Name
    )

    Write-Verbose "********** Function Begin **********"

    try {
        # -------------------------------
        # Step 1: Detect and extract SiteCode
        # -------------------------------
        $siteCode = $null
        $cleanPath = $null

        if ($Path -match '^[A-Za-z0-9]{3}:\\') {
            # Path includes PSDrive (e.g., PS1:\...)
            $siteCode = $Path.Substring(0,3)
            $cleanPath = $Path.Substring(4)
            Write-Verbose "Detected PSDrive in path: $siteCode"
        }
        else {
            # No PSDrive → use function
            $siteCode = Get-PCXCMSiteCode
            if (-not $siteCode) {
                throw "Failed to retrieve SCCM Site Code."
            }
            $cleanPath = $Path
            Write-Verbose "Using detected SiteCode: $siteCode"
        }

        # -------------------------------
        # Step 2: Validate PSDrive
        # -------------------------------
        if (-not (Get-PSDrive -Name $siteCode -ErrorAction SilentlyContinue)) {
            throw "PSDrive '$siteCode' not found. Ensure ConfigurationManager module is loaded."
        }

        $rootPath = "$siteCode`:"
        
        # -------------------------------
        # Step 3: Normalize Path
        # -------------------------------
        $cleanPath = $cleanPath.Trim('\')

        if ([string]::IsNullOrWhiteSpace($cleanPath)) {
            throw "Path cannot be empty."
        }

        $segments = ($cleanPath -split '\\') | Where-Object { $_ }

        Write-Verbose "Normalized Path: $cleanPath"
        Write-Verbose "Segments: $($segments -join ' -> ')"

        # -------------------------------
        # Step 4: Create Path Step-by-Step
        # -------------------------------
        $currentPath = $rootPath

        foreach ($folder in $segments) {
            $nextPath = Join-Path $currentPath $folder

            if (-not (Test-Path $nextPath)) {
                if ($PSCmdlet.ShouldProcess($nextPath, "Create folder")) {
                    New-Item -Path $currentPath -Name $folder -ItemType Directory -ErrorAction Stop
                    Write-Verbose "Created: $nextPath"
                }
            }
            else {
                Write-Verbose "Exists: $nextPath"
            }

            $currentPath = $nextPath
        }

        # -------------------------------
        # Step 5: Handle Optional Name
        # -------------------------------
        if ($Name) {
            if ([string]::IsNullOrWhiteSpace($Name)) {
                throw "Folder name cannot be empty."
            }

            $finalPath = Join-Path $currentPath $Name

            if (-not (Test-Path $finalPath)) {
                if ($PSCmdlet.ShouldProcess($finalPath, "Create folder")) {
                    New-Item -Path $currentPath -Name $Name -ItemType Directory -ErrorAction Stop
                    Write-Verbose "Created final folder: $finalPath"
                }
            }
            else {
                Write-Verbose "Final folder already exists: $finalPath"
            }
        }
        else {
            # No Name → full path already created
            $finalPath = $currentPath
            Write-Verbose "No child name provided. Full path ensured."
        }

        # -------------------------------
        # Step 6: Return Result
        # -------------------------------
        return [PSCustomObject]@{
            Success  = $true
            Path     = $finalPath
            SiteCode = $siteCode
        }
    }
    catch {
        Write-Error "Failed: $($_.Exception.Message)"

        return [PSCustomObject]@{
            Success = $false
            Error   = $_.Exception.Message
        }
    }
}
#############################################################
# Example usage 
<#
New-PCXCMFolder -Path "\DeviceCollection\RootFolder\" -Name "Child"
New-PCXCMFolder -Path "DeviceCollection\RootFolder" -Name "Child"
New-PCXCMFolder -Path "\DeviceCollection\RootFolder" -Name "Child"
New-PCXCMFolder -Path "\DeviceCollection\RootFolder" 

#New-PCXCMFolder -Path "\DeviceCollection\RootFolder\SubFoler" -Name "Child" -AutoCreatePath
#New-PCXCMFolder -Path "PS1:\DeviceCollection\RootFolder\SubFoler" -Name "Child" -AutoCreatePath
#New-PCXCMFolder -Path "DeviceCollection\RootFolder\" -Name "Child" -AutoCreatePath
#New-PCXCMFolder -Path "\DeviceCollection\" -Name "Child" -AutoCreatePath
#New-PCXCMFolder -Path "\DeviceCollection\AAA" -Name "Child"
#>

#############################################################
# Reproducing command 
<#
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\Test"
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder"
Get-ChildItem -path "PS1:\DeviceCollection\RootFolder"
#>

#############################################################
#Remove-Module PCXCMModule
#Remove-Module PCXCMModule -Force
#############################################################
