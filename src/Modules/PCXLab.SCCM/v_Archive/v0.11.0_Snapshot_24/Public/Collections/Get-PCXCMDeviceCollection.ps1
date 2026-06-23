function Get-PCXCMDeviceCollection {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    begin {

        Write-PCXOperationStart
    }

    process {

        try {

            if (-not (Test-PCXCMConnection)) {

                throw "No active Configuration Manager connection detected."
            }

            $Collection = Get-CMDeviceCollection `
                -Name $Name `
                -ErrorAction SilentlyContinue

            if ($Collection) {

                Write-PCXLog "Device collection found: $Name"

                return $Collection
            }

            Write-PCXLog "Device collection not found: $Name"

            return $null
        }
        catch {

            Write-PCXOperationEnd -Status Failed

            Write-PCXLog "Failed to get device collection: $Name. $_" "ERROR"
`r`n            Write-PCXOperationEnd -Status Failed
            throw
        }
    }

    end {

        Write-PCXOperationEnd -Status Success
    }
}
