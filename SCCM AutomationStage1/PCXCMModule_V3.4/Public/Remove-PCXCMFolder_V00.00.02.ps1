function Remove-PCXCMFolder {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FolderPath
    )

    # Check if folder exists
    if (-not (Test-Path $FolderPath)) {
        Write-Warning "Folder '$FolderPath' does not exist."
        return
    }

    # Get all child items (folders and files)
    $items = Get-ChildItem -Path $FolderPath

    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            # Recursively delete subfolders
            Remove-PCXCMFolder -FolderPath $item.FullName
        } else {
            # Delete files
            Remove-Item -Path $item.FullName -Force
        }
    }

    # Finally, remove the current folder itself
    Remove-Item -Path $FolderPath -Force
    Write-Host "Deleted folder: $FolderPath"
}


# Example usage
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\"
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\Test\Sub\Folders"
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\Test"
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\Test\Sub"
#Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder"
#Get-ChildItem -path "PS1:\DeviceCollection\RootFolder"

#New-PCXCMFolder -Path "\DeviceCollection\RootFolder" -Name "Test"
#New-PCXCMFolder -Path "\DeviceCollection\RootFolder\Test\Sub\Folders"

<#
#############################

$folder = Get-ChildItem "PS1:\DeviceCollection\RootFolder"
$folder.Delete()  # or Remove() depending on provider

###############################
#>
