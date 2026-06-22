function Remove-PCXCMDeviceCollection {

    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [psobject]$CleanupInfo
    )

    begin {
        Write-PCXOperationStart
    }
    process {
        try {

            Ensure-PCXCMConnection
            
            foreach ($Collection in $CleanupInfo.Collections) {

                if ($PSCmdlet.ShouldProcess($Collection.Name, 'Remove Collection')) {

                    #Write-PCXLog -Message "Removing Collection: $($Collection.Name)"
                    Write-PCXLog -Message "Removing Collection: $($Collection.Name) [$($Collection.CollectionID)]"

                    Remove-CMDeviceCollection -Id $Collection.CollectionID -Force -ErrorAction Stop

                    #Write-PCXLog -Message "Removed Collection: $($Collection.Name)"
                    Write-PCXLog -Message "Removed Collection: $($Collection.Name) [$($Collection.CollectionID)]"
                }
            }
        }
        catch {
            Write-PCXLog -Message $_.Exception.Message -Level ERROR
            throw
        }
    }
    end {
        Write-PCXOperationEnd
    }
}