function Write-PCXOperationEnd {

    [CmdletBinding()]
    param(

        [ValidateSet("Success", "Failed")]
        [string]$Status = "Success"
    )

    if (
        $Global:PCXOperationStack -and
        $Global:PCXOperationStack.Count -gt 0
    ) {

        $Operation = $Global:PCXOperationStack.Pop()

        $Operation.Stopwatch.Stop()

        $Duration = [math]::Round(
            $Operation.Stopwatch.Elapsed.TotalSeconds,
            2
        )

        $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

        $Line = "$TimeStamp [$($Operation.Name)] [INFO] COMPLETED ($($Status.ToUpper())) - $Duration sec - $($Global:PCXLogConfiguration.Website)"

        Write-Host $Line -ForegroundColor $Global:PCXLogConfiguration.TerminalAppearance.SuccessColor

        Add-Content `
            -Path $Global:PCXLogFile `
            -Value $Line
    }
    else {

        Write-PCXLog "COMPLETED ($($Status.ToUpper())) - Unknown Operation - $($Global:PCXLogConfiguration.Website)"
    }
}

