Add-Type -AssemblyName PresentationFramework

# Load SCCM module (adjust path if needed)
Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1" -ErrorAction SilentlyContinue

# Set Site Code (CHANGE THIS)
$SiteCode = "ABC"
Set-Location "$SiteCode`:"

# XAML UI
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="SCCM Quick Actions Tool" Height="350" Width="400" ResizeMode="NoResize">
    <Grid Margin="10">

        <Label Content="Computer Name:" HorizontalAlignment="Left" VerticalAlignment="Top"/>
        <TextBox Name="txtComputer" Height="25" Margin="0,25,0,0" VerticalAlignment="Top"/>

        <Button Name="btnMachinePolicy" Content="Machine Policy" Height="30" Margin="0,70,0,0" VerticalAlignment="Top"/>
        <Button Name="btnHardwareInv" Content="Hardware Inventory" Height="30" Margin="0,110,0,0" VerticalAlignment="Top"/>
        <Button Name="btnSoftwareScan" Content="Software Updates Scan" Height="30" Margin="0,150,0,0" VerticalAlignment="Top"/>
        <Button Name="btnRestart" Content="Restart Computer" Height="30" Margin="0,190,0,0" VerticalAlignment="Top"/>

        <TextBlock Name="txtStatus" Margin="0,240,0,0" Height="50" TextWrapping="Wrap"/>

    </Grid>
</Window>
"@

# Load XAML
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Get UI Elements
$txtComputer     = $window.FindName("txtComputer")
$btnMachinePolicy = $window.FindName("btnMachinePolicy")
$btnHardwareInv  = $window.FindName("btnHardwareInv")
$btnSoftwareScan = $window.FindName("btnSoftwareScan")
$btnRestart      = $window.FindName("btnRestart")
$txtStatus       = $window.FindName("txtStatus")

# Helper function
function Update-Status {
    param($msg)
    $txtStatus.Text = $msg
}

# Button Actions
$btnMachinePolicy.Add_Click({
    $comp = $txtComputer.Text
    Update-Status "Triggering Machine Policy..."
    Invoke-WmiMethod -Namespace root\ccm -Class SMS_Client -Name TriggerSchedule `
        -ArgumentList "{00000000-0000-0000-0000-000000000021}" -ComputerName $comp
    Update-Status "Machine Policy triggered on $comp"
})

$btnHardwareInv.Add_Click({
    $comp = $txtComputer.Text
    Update-Status "Triggering Hardware Inventory..."
    Invoke-WmiMethod -Namespace root\ccm -Class SMS_Client -Name TriggerSchedule `
        -ArgumentList "{00000000-0000-0000-0000-000000000001}" -ComputerName $comp
    Update-Status "Hardware Inventory triggered on $comp"
})

$btnSoftwareScan.Add_Click({
    $comp = $txtComputer.Text
    Update-Status "Triggering Software Updates Scan..."
    Invoke-WmiMethod -Namespace root\ccm -Class SMS_Client -Name TriggerSchedule `
        -ArgumentList "{00000000-0000-0000-0000-000000000113}" -ComputerName $comp
    Update-Status "Software Scan triggered on $comp"
})

$btnRestart.Add_Click({
    $comp = $txtComputer.Text
    Update-Status "Restarting $comp..."
    Restart-Computer -ComputerName $comp -Force
    Update-Status "$comp restart command sent"
})

# Show Window
$window.ShowDialog() | Out-Null