function Ensure-PCXCMConnection {

    [CmdletBinding()]
    param()

    if (Test-PCXCMConnection) {
        return
    }

    Write-PCXLog "No SCCM connection detected. Connecting..."

    try {

        $null = Connect-PCXCMSite

        Write-PCXLog "SCCM connection established."
    }
    catch {

        Write-PCXLog "Failed to establish SCCM connection. $($_.Exception.Message)" "ERROR"

        throw
    }
}