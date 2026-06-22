function Ensure-PCXCMConnection {

    [CmdletBinding()]
    param()

    try {

        if (Test-PCXCMConnection) {

            Write-PCXLog "Using existing SCCM connection."
            return
        }

        Write-PCXLog "Connecting SCCM..."

        $null = Connect-PCXCMSite

        Write-PCXLog "Connected SCCM."
    }
    catch {

        Write-PCXLog "Failed to establish SCCM connection. $($_.Exception.Message)" "ERROR"

        throw
    }
}