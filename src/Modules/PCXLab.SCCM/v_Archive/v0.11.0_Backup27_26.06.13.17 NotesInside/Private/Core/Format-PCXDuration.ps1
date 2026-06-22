function Format-PCXDuration {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [double]$TotalSeconds
    )

    if ($TotalSeconds -lt 60) {
        return "{0:N2} sec" -f $TotalSeconds
    }

    $TimeSpan = [TimeSpan]::FromSeconds($TotalSeconds)

    if ($TimeSpan.TotalHours -lt 1) {
        return "{0} min {1} sec" -f $TimeSpan.Minutes, $TimeSpan.Seconds
    }

    if ($TimeSpan.TotalDays -lt 1) {
        return "{0} hr {1} min" -f [math]::Floor($TimeSpan.TotalHours), $TimeSpan.Minutes
    }

    if ($TimeSpan.TotalDays -lt 30) {
        return "{0} day {1} hr" -f [math]::Floor($TimeSpan.TotalDays), $TimeSpan.Hours
    }

    if ($TimeSpan.TotalDays -lt 365) {
        $Months = [math]::Floor($TimeSpan.TotalDays / 30)
        $Days = [math]::Floor($TimeSpan.TotalDays % 30)

        return "{0} month {1} day" -f $Months, $Days
    }

    $Years = [math]::Floor($TimeSpan.TotalDays / 365)
    $Months = [math]::Floor(($TimeSpan.TotalDays % 365) / 30)

    return "{0} year {1} month" -f $Years, $Months
}