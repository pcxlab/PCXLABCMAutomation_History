function Get-PCXCMApplication {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ApplicationName
    )

    begin {
        Write-PCXLog "BEGIN - PCXLab Automation"
    }
    process {
        try {
            $Application = Get-CMApplication -Name $ApplicationName -ErrorAction SilentlyContinue

            if (-not $Application) {
                throw "Application not found: $ApplicationName"
            }

            return $Application
        }
        catch {
            Write-PCXLog "Failed to get application: $ApplicationName. $($_.Exception.Message)" "ERROR"`r`n            Write-PCXOperationEnd -Status Failed
            throw
        }
        
    }
    end {
        Write-PCXLog "END - www.pcxlab.com"
    }
}
