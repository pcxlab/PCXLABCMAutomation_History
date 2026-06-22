function Remove-PCXCMFolder {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FolderPath
    )

    # Validate folder
    if (-not $FolderPath -or -not (Test-Path $FolderPath)) {
        Write-Warning "Folder '$FolderPath' does not exist or is invalid."
        return
    }

    # Get all child folders
    $childFolders = Get-ChildItem -Path $FolderPath | Where-Object { $_.PSIsContainer }

    foreach ($child in $childFolders) {
        if ($child.FullName) {
            # Recursive call - delete subfolder first
            Remove-PCXCMFolder -FolderPath $child.FullName
        }
    }

    # After all subfolders are gone, delete the folder itself
    try {
        $folder = Get-Item -Path $FolderPath
        $folder.Delete()
        Write-Host "Deleted folder: $FolderPath"
    } catch {
        Write-Warning "Failed to delete folder: $FolderPath. $_"
    }
}


# Example usage 
<#

Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\"
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\Test\Sub\Folders"
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\Test"
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\Test\Sub"
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder"

# Test when folder contains collection # this will fail
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\Test\Sub\Folders"

# Test when folder contains collection
Remove-PCXCMFolder "PS1:\DeviceCollection\RootFolder\Test\sub"
#>

# Commnad to reproduce

#New-PCXCMFolder -Path "\DeviceCollection\RootFolder\Test\Sub\Folders"

<#
#############################

$folder = Get-ChildItem "PS1:\DeviceCollection\RootFolder"
$folder.Delete()  # or Remove() depending on provider

###############################
#>
