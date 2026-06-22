function Update-PCXCMPackageOSPlatform {
    <#
    .SYNOPSIS
        Updates supported OS platforms for programs in SCCM packages and generates a report.

    .DESCRIPTION
        Reads package details from a CSV file and applies OS support settings defined in a config XML. 
        Generates a log and a report CSV detailing actions taken per package/program.

    .PARAMETER CsvFilePath
        Full path to the input CSV containing package names.

    .PARAMETER ConfigFilePath
        Optional. Path to the Config.xml file (default is inside the module folder).

    .OUTPUTS
        CSV report and log file saved in the same directory as the input CSV.

    .NOTES
        Requires the ConfigurationManager module.
    .USAGE
	Update-PCXCMPackageOSPlatform -CsvFilePath "DRIVE:\Path\PCXCMModule\Config\Package_List.csv" -ConfigFilePath "DRIVE:\Path\PCXCMModule\Config\Config.xml" 
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CsvFilePath,

        [string]$ConfigFilePath = (Join-Path $PSScriptRoot '..\Config\Config.xml')
    )

    # Validate paths
    if (-not (Test-Path $CsvFilePath)) {
        throw "CSV file not found at: $CsvFilePath"
    }
    if (-not (Test-Path $ConfigFilePath)) {
        throw "Config file not found at: $ConfigFilePath"
    }

    # Import ConfigurationManager module if not already loaded
    if (-not (Get-Module ConfigurationManager)) {
        Import-Module "$($env:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1" -ErrorAction Stop
    }

    # Ensure we're connected to the SCCM site
    Connect-PCXCMSite

    # Read config and input data
    [xml]$config = Get-Content $ConfigFilePath
    $platform = $config.Configuration.Platform
    $packages = Import-Csv -Path $CsvFilePath

    # Prepare report/log paths
    $timestamp = (Get-Date -Format "yyyyMMdd_HHmmss")
    $baseDir = Split-Path $CsvFilePath
    $reportFile = Join-Path $baseDir "Package_OS_Report_$timestamp.csv"
    $logFile = Join-Path $baseDir "Package_OS_Log_$timestamp.txt"

    Start-Transcript -Path $logFile

    Write-Host "Processing packages from: $CsvFilePath"
    Write-Host "Using config: $ConfigFilePath"
    Write-Host "Output Report: $reportFile"
    Write-Host ""

    $report = @()

    foreach ($package in $packages) {
        $pkg = Get-CMPackage -Name $package.PackageName -Fast -ErrorAction SilentlyContinue

        if (-not $pkg) {
            Write-Warning "Package not found: $($package.PackageName)"
            $report += [PSCustomObject]@{
                PackageName = $package.PackageName
                ProgramName = ''
                Status      = 'Package Not Found'
            }
            continue
        }

        $programs = $pkg | Get-CMProgram
        foreach ($program in $programs) {
            $existingOS = $program.SupportedOperatingSystems
            $targetFound = $existingOS | Where-Object {
                $_.MaxVersion -eq '10.00.99999.9999' -and
                $_.MinVersion -eq '10.00.22000.0' -and
                $_.Platform -eq 'x64'
            }

            if ($targetFound) {
                Write-Host "Already updated: $($program.ProgramName)"
                $status = "Already Updated"
            } else {
                try {
                    $osPlatform = Get-CMSupportedPlatform -Name $platform -Fast
                    Set-CMProgram -PackageName $pkg.Name -ProgramName $program.ProgramName -AddSupportedOperatingSystemPlatform $osPlatform -StandardProgram
                    $status = "Updated"
                    Write-Host "Updated program: $($program.ProgramName)"
                } catch {
                    $status = "Update Failed: $_"
                    Write-Error "Failed to update: $($_.Exception.Message)"
                }
            }

            $report += [PSCustomObject]@{
                PackageName = $pkg.Name
                ProgramName = $program.ProgramName
                Status      = $status
            }
        }
    }

    $report | Export-Csv -Path $reportFile -NoTypeInformation
    Stop-Transcript

    Write-Host "`n Finished. Report saved to: $reportFile"
    Write-Host " Log saved to: $logFile"
}

# SIG # Begin signature block
# MIIKmwYJKoZIhvcNAQcCoIIKjDCCCogCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU5BlRCAUmeon+yb+co8LpVxQD
# lgugggfxMIIH7TCCBdWgAwIBAgITfgAqDS38gi3RBcr9PwAAACoNLTANBgkqhkiG
# 9w0BAQsFADBcMRMwEQYKCZImiZPyLGQBGRYDY29tMRcwFQYKCZImiZPyLGQBGRYH
# bXBoYXNpczEUMBIGCgmSJomT8ixkARkWBGNvcnAxFjAUBgNVBAMTDU1waGFzaXNS
# b290Q0EwHhcNMjUwMTI3MTIxNTE1WhcNMjcwMTI3MTIxNTE1WjCBuTETMBEGCgmS
# JomT8ixkARkWA2NvbTEXMBUGCgmSJomT8ixkARkWB21waGFzaXMxFDASBgoJkiaJ
# k/IsZAEZFgRjb3JwMR0wGwYDVQQLExRNcGhhc2lTIEJQTyBTZXJ2aWNlczESMBAG
# A1UECxMJTWFuZ2Fsb3JlMRQwEgYDVQQLEwtNb3JnYW4gR2F0ZTESMBAGA1UECxMJ
# QWxsIFVzZXJzMRYwFAYDVQQDEw1IYXJzaGl0aHJhaiBQMIIBIjANBgkqhkiG9w0B
# AQEFAAOCAQ8AMIIBCgKCAQEAxMQa6w0z2RxDuXsD42TVI+y6pNJGSfctL3Wo7FlZ
# 13PDFGwzrJ+MHYrHdXbTDXx9QNwRmp1XEACLBzXvtfkTvptoJXm8S5an710FmIhQ
# X1UaRtMBmxcPHPXYx9srPo/IrspfzjjfzIcA3iyV/kPp/BHc5TAUTwtkaUVDOfsr
# Eo+f0AkJTZY3+4U39rvVSh3Tymo8yett0lFMG+Mo8XoGxXhjmcDYr4WgdPnmRUf7
# 2NprzPYTAr9+CgiAMMlI2oEFVhevReXiYWI8NeBlnDxHF3Wz8vapN82qO/AyCvsu
# 9A8HWsFdKynYlgmqjcEFeq5LTDkqBG40M+mwUwlmrkfdHQIDAQABo4IDSDCCA0Qw
# OwYJKwYBBAGCNxUHBC4wLAYkKwYBBAGCNxUIhMyCH8+9G4LVjRuzxzWGhuksgUCG
# mfcDrJoTAgFkAgEOMBMGA1UdJQQMMAoGCCsGAQUFBwMDMAsGA1UdDwQEAwIHgDAb
# BgkrBgEEAYI3FQoEDjAMMAoGCCsGAQUFBwMDMFIGCSsGAQQBgjcZAgRFMEOgQQYK
# KwYBBAGCNxkCAaAzBDFTLTEtNS0yMS0xMDc5NTc2NTIzLTM4NTgxMjM1NjUtMTkw
# OTY3OTkxNS05NTg5MDQyME8GA1UdEQRIMEagKQYKKwYBBAGCNxQCA6AbDBlIYXJz
# aGl0aHJhai5QQG1waGFzaXMuY29tgRlIYXJzaGl0aHJhai5QQG1waGFzaXMuY29t
# MB0GA1UdDgQWBBSkZDx6EbPefW2Ud8IXKJ6tZ3dLPzAfBgNVHSMEGDAWgBQjRSRz
# 1j1XGGn4I9WpMcdUqHHtjTCB2wYDVR0fBIHTMIHQMIHNoIHKoIHHhoHEbGRhcDov
# Ly9DTj1NcGhhc2lzUm9vdENBLENOPVNSVkJBTjA5Q1JBVVZNMSxDTj1DRFAsQ049
# UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJh
# dGlvbixEQz1jb3JwLERDPW1waGFzaXMsREM9Y29tP2NlcnRpZmljYXRlUmV2b2Nh
# dGlvbkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludDCC
# AQEGCCsGAQUFBwEBBIH0MIHxMIG0BggrBgEFBQcwAoaBp2xkYXA6Ly8vQ049TXBo
# YXNpc1Jvb3RDQSxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049
# U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1jb3JwLERDPW1waGFzaXMsREM9
# Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9u
# QXV0aG9yaXR5MDgGCCsGAQUFBzABhixodHRwOi8vU1JWQkFOMDlDUkFVVk0xLmNv
# cnAubXBoYXNpcy5jb20vb2NzcDANBgkqhkiG9w0BAQsFAAOCAgEAK86w/bs3xZR1
# wCj+aHRSPYtMjPWaBV1x7FYIRUI4cYUWh8/LSXd+SeecR9ZILHv98WmpHHSCANMm
# AjmLx0GufMz1IS+CuWrMmbtWA81zlYICoCMC8sNGoOHAm16njFwm09Yj0/7lB5OA
# UMbPdy1FoL7FTrOTgnWElBxbZZd4DyEKfC4f+f+6L7cIrFgXiansLLiYy8mTHNUW
# /T4ZipxPYMdcKXkItY94NCsQzccy12xDI8JCd2PFk5p8IVE85yUxP7xT9jc7ZSKg
# AGOuwJ9PDWAFMXQe8DmYyVCrrw0oVn0t7OWcmBsjId8kUjm1kq+lUcMyx+xwhO6q
# 8DbgqFekH6KLJA/fKsSGgxInpqvJzQ9ExTpAuxATrdTZkrlfkIEArqp1DPBMBF7+
# 2pewhdwF3PWqd1zRI1Phmo6lm4ixUST0sVRygV+PT5KuDWVCnrkD39rGn2XcZ5Tk
# /+0eezAMjG4xnXmwja7pu3h0jcDwt7RQoLKKMHc70pFiyKGr5lY5/jWLClFLh3RV
# 7Z/2zKRTRf8NL/uiiS6z9Qv7vuZZ+IqrzB4XxPdCytpKZwoy4vSxBFob6syDLc2r
# FaTctXl3Yg27zp4NYG0+CP+y6fsGw2V6g4zz50wp1SAmWkLL7WK2e3gDzbdUrXq2
# WD+POBA6s8795fJpOk+tkFSY8SENWR0xggIUMIICEAIBATBzMFwxEzARBgoJkiaJ
# k/IsZAEZFgNjb20xFzAVBgoJkiaJk/IsZAEZFgdtcGhhc2lzMRQwEgYKCZImiZPy
# LGQBGRYEY29ycDEWMBQGA1UEAxMNTXBoYXNpc1Jvb3RDQQITfgAqDS38gi3RBcr9
# PwAAACoNLTAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZ
# BgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYB
# BAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUMyWXSqyVBLfAoeJ25UzUPs3G16kwDQYJ
# KoZIhvcNAQEBBQAEggEAVJCp1ztlVPLlD99OYM7qB31DBmOgMGpbIW/0ygj8PtD4
# z0UKt3t7LIKWglvkEapdRslrr7Zs1at0+R5Zm7aWz0OJ4FalBjo8KWMS2XbmM7ce
# 0wvS2Ded6qcZv7jjG0e6HIjKDK32lyqkPutXI344fc7ayqSiUoHQFsQbecJoculG
# gYU1qgR4ra4EwQk5tZ40PaZDz/KVTx9LTRgCDadDko3Mtx/ndquqMMQjA7Mtq73O
# q/vJ4YfRz+Bt3LIfUL8qfLfYmABWkZWrJUpIizk4EbJCa9s0r6wbeLm0y394Flh4
# SbyGDlNQafNJxf6qJYdK9AXV/j0Lcy9ipwRbQBwQ7w==
# SIG # End signature block
