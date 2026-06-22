function Get-PackageInfo01 {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Path
    )

    # Normalize path
    #$resolvedPath = Resolve-Path -Path $Path -ErrorAction Stop
    $resolvedPath = (Resolve-Path -Path $Path -ErrorAction Stop).ProviderPath


    # Extract parts using built-in cmdlets
    $packageName = Split-Path -Path $resolvedPath -Leaf
    $product     = Split-Path -Path (Split-Path -Path $resolvedPath -Parent) -Leaf
    $company     = Split-Path -Path (Split-Path -Path (Split-Path -Path $resolvedPath -Parent) -Parent) -Leaf

    # Extract version safely
    $version = if ($packageName -match '_(.+)$') {
        $Matches[1]
    } else {
        $null
    }

   $PackageInfo = [PSCustomObject]@{
        PackageName = $packageName
        Company     = $company
        Product     = $product
        Version     = $version
        FullPath    = $resolvedPath

    }
        return $PackageInfo

}

$result = Get-PackageInfo01 -Path "\\192.168.25.214\Package_Source\Applications\Igor_Pavlov\7zip\7zip_26.0.0"

$result

<#
Usage Exanple
$result = Get-PackageInfo -Path "\\192.168.25.214\Package_Source\Applications\Igor_Pavlov\7Zip\7Zip_26.0.0.0"

$result
$result.Company
#>