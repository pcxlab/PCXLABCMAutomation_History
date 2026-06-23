function Initialize-PCXCMEnvironment {

    [CmdletBinding()]
    param()

    try {

        Write-PCXLog "[Initialize SCCM Environment] START" -Level INFO

        # Validate SCCM Console
        if ([string]::IsNullOrWhiteSpace($env:SMS_ADMIN_UI_PATH)) {
            throw "SMS_ADMIN_UI_PATH not found. SCCM Console may not be installed."
        }

        # Locate ConfigurationManager module
        $CMModulePath = Join-Path `
            (Split-Path $env:SMS_ADMIN_UI_PATH -Parent) `
            "ConfigurationManager.psd1"

        if (-not (Test-Path $CMModulePath)) {
            throw "ConfigurationManager module not found: $CMModulePath"
        }

        Write-PCXLog "[Initialize SCCM Environment] Importing ConfigurationManager module." -Level INFO

        Import-Module $CMModulePath -Force -Global -ErrorAction Stop

        $CMModule = Get-Module ConfigurationManager -ErrorAction SilentlyContinue

        if (-not $CMModule) {
            throw "ConfigurationManager module failed to load."
        }

        $RequiredCommands = @(
            'Get-CMApplication',
            'New-CMApplication',
            'New-CMCollection',
            'New-CMDeviceCollection'
        )

        foreach ($Command in $RequiredCommands) {

            if (-not (Get-Command $Command -ErrorAction SilentlyContinue)) {

                throw "Required SCCM command unavailable: $Command"
            }
        }

        Write-PCXLog "[Initialize SCCM Environment] SCCM cmdlets verified." -Level INFO

        Write-PCXLog "[Initialize SCCM Environment] COMPLETED" -Level INFO

        return $true
    }
    catch {

        Write-PCXLog `
            -Message "[Initialize SCCM Environment] FAILED. $($_.Exception.Message)" `
            -Level ERROR

        throw
    }
}