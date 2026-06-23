function Save-PCXApplicationXML {

    [CmdletBinding()]
    param(

        [Parameter(Mandatory)]
        $Application,

        [Parameter(Mandatory)]
        $Xml
    )

    begin {

        Write-PCXOperationStart
    }
    process {
        try {

            $UpdatedXML = [Microsoft.ConfigurationManagement.ApplicationManagement.Serialization.SccmSerializer]::SerializeToString(
                $Xml,
                $True
            )

            $Application.SDMPackageXML = $UpdatedXML

            $Application.Put()

            return Set-CMApplication `
                -InputObject $Application `
                -PassThru
        }
        catch {
            Write-PCXLog "Failed to save application XML. $($_.Exception.Message)" "ERROR"`r`n            Write-PCXOperationEnd -Status Failed
            throw
        }
        
    }
    end {

        Write-PCXOperationEnd -Status Success
    }
}

