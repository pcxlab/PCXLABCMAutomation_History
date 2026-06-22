function Get-PCXCMDPs {

    [CmdletBinding()]
    param()

    #
    # TEMPORARY
    # Replace with SCCM query later
    #

    @(
        "cm01.corp.pcxlab.com"
        "man01.corp.pcxlab.com"
        "Ban01.corp.pcxlab.com"
        "PUN01.corp.pcxlab.com"
        "Chi01.corp.pcxlab.com"
        "Koc01.corp.pcxlab.com"
        "cm02.corp.pcxlab.com"
        "man02.corp.pcxlab.com"
        "Ban02.corp.pcxlab.com"
        "PUN02.corp.pcxlab.com"
        "Chi02.corp.pcxlab.com"
        "Koc02.corp.pcxlab.com"
        "cm03.corp.pcxlab.com"
        "man03.corp.pcxlab.com"
        "Ban03.corp.pcxlab.com"
        "PUN03.corp.pcxlab.com"
        "Chi03.corp.pcxlab.com"
        "Koc03.corp.pcxlab.com"
    )
}

<#
function Get-PCXCMDPGroups {

    Get-CMDistributionPointGroup |
        Sort-Object Name |
        Select-Object -ExpandProperty Name
}
#>