function New-PCXCMFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Name,

        [switch]$AutoCreatePath
    )

    Write-Host "**********Function begin**********" -ForegroundColor Yellow

    if ([string]::IsNullOrWhiteSpace($Name)) {
        throw "Cannot create a folder with an empty name."
    }

    # improvement required not sure if the get-pcxcmsitecode is correcdt at this section?

    $Path = $Path.Trim('\')
   # $rootPath = "$($SiteCode):"
    $siteCode = Get-PCXCMSiteCode
    $rootPath = "$siteCode" + ":"
   # $rootPath = "PS1:"
    $segments = $Path -split '\\'
    $currentPath = $rootPath

    try {
        if ($AutoCreatePath) {
            foreach ($folder in $segments) {
                $nextPath = Join-Path -Path $currentPath -ChildPath $folder
                if (-not (Test-Path $nextPath)) {
                    #Write-Host "Folder $folder not found we will create it now" -ForegroundColor Red
                    New-Item -Path $currentPath -Name $folder -ItemType Directory -ErrorAction Stop
                    Write-Host "Foler $folder not found so created at $currentPath" -ForegroundColor Yellow
                    Write-Verbose "Created path segment: $nextPath"
                }
                $currentPath = $nextPath
            }
        } else {
            $currentPath = Join-Path -Path $rootPath -ChildPath ($segments -join '\')
            if (-not (Test-Path $currentPath)) {
                throw "Path '$Path' does not exist. Use -AutoCreatePath to create it."
            }
        }

        $finalPath = Join-Path -Path $currentPath -ChildPath $Name

        if (-not (Test-Path $finalPath)) {
            New-Item -Path $currentPath -Name $Name -ItemType Directory -ErrorAction Stop
            Write-Host "Folder '$Name' created at '$Path'." -ForegroundColor $ColSuccess
        } else {
            Write-Host "Folder '$Name' already exists at '$Path'." -ForegroundColor $ColInform
        }
        return $true
    } catch {
        Write-Host "Error creating folder '$Name' at '$Path': $_" -ForegroundColor $ColError
        return $false
    }
}

# Usage
#New-PCXCMFolder -Path "\DeviceCollection\Parent" -Name "Child" -AutoCreatePath
#New-PCXCMFolder -Path "\DeviceCollection\RootFolder\SubFoler" -Name "Child" -AutoCreatePath

New-PCXCMFolder -Path "\DeviceCollection\RootFolder\SubFoler" -Name "Child" -AutoCreatePath

