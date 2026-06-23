function Get-PCXCMApplicationDeploymentCount {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Application
    )

    try {

        $Deployments = Get-CMApplicationDeployment `
            -Name $Application.LocalizedDisplayName `
            -ErrorAction SilentlyContinue

        return @($Deployments).Count
    }
    catch {

        Write-PCXLog -Message $_.Exception.Message -Level ERROR
        throw
    }
}