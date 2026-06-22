function Get-PCXCMDPGroups {

    [CmdletBinding()]
    param()

    #
    # TEMPORARY
    # Replace with SCCM query later
    #

    @(
        "All Mangalore DPs"
        "All Bangalore DPs"
        "All Mumbai DPs"
        "All Chennai DPs"
        "All Pune DPs"
        "All Kochi DPs"
        "All DPs"
        "Pilot DPs"
        "Test DPs"
    )
}

<#
function Get-PCXCMDPGroups {

    Get-CMDistributionPointGroup |
        Sort-Object Name |
        Select-Object -ExpandProperty Name
}
#>