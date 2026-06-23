function Initialize-PCXLogConfiguration {

    $Global:PCXLogConfiguration = @{

        FrameworkName      = "PCXLab Automation Framework"
        Website            = "www.pcxlab.com"

        ShowBranding       = $true

        StartText          = "START"

        UseFriendlyNames   = $true

        TerminalAppearance = @{

            # Future use
            #EnableCustomColors = $false
            EnableCustomColors = $true

            InfoColor          = "White"
            WarningColor       = "Yellow"
            ErrorColor         = "Red"
            DebugColor         = "Cyan"

            StartColor         = "Magenta"
            SuccessColor       = "Green"
            FailedColor        = "Red"
        }
    }

    $Global:PCXOperationNames = @{

        # Packages
        "Create-PCXCMPackage"            = "Create Package"
        "Move-PCXCMPackageToFolder"      = "Move Package"

        # Applications
        "Create-PCXCMApplication"        = "Create Application"
        "New-PCXDetectionClause"         = "Create Detection Clause"

        # SCCM
        "Connect-PCXCMSite"              = "Connect SCCM Site"
        "Start-PCXCMContentDistribution" = "Distribute Content"

        # Collections
        "New-PCXCollections"             = "Create Collections"
        "Set-PCXCollectionRules"         = "Configure Collection Rules"

        # Path
        "Test-PCXPackagePath"            = "Validate Package Path"

        "Get-PCXApplicationXML"          = "Get Application XML"
        "Get-PCXCMApplication"           = "Get Application"
        "Get-PCXOSRequirementOperand"    = "Get OS Requirement Operand"
        "Import-PCXApplicationList"      = "Import Application List"
        "New-PCXOSRequirementRule"       = "Create OS Requirement Rule"
        "Save-PCXApplicationXML"         = "Save Application XML"
        "Test-PCXOSRequirementExists"    = "Test OS Requirement"
    }

    # Operation stack
    $Global:PCXOperationStack = New-Object System.Collections.Stack
}