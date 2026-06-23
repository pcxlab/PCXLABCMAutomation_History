function Get-PCXCMApplication {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ApplicationName
    )

    begin {
        Write-PCXOperationStart
    }
    process {
        try {
            $Application = Get-PCXCMCachedApplication | Where-Object LocalizedDisplayName -eq $ApplicationName | Select-Object -First 1

            if (-not $Application) {
                throw "Application not found: $ApplicationName"
            }

            return $Application
        }
        catch {
            Write-PCXLog -Message "Failed to get application: $ApplicationName. $($_.Exception.Message)" -Level ERROR
            throw
        }
    }
    end {
        Write-PCXOperationEnd -Status Success
    }
}




