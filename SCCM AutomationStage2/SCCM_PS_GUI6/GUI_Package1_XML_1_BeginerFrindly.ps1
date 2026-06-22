# ================================
# Simplified SCCM Package GUI (XAML Version)
# ================================

Clear-Host
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework

# Load your functions
. "$PSScriptRoot\Functions.ps1"
. "$PSScriptRoot\Package Function_V0.8.3.ps1"

# Connect SCCM
Connect-SCCM

# ================================
# XAML UI
# ================================
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="SCCM Package Tool" Height="250" Width="400">

    <Grid Margin="10">

        <!-- Source Path -->
        <Label Content="Source Path:" VerticalAlignment="Top"/>
        <TextBox Name="txtSourcePath" Margin="0,25,80,0" Height="25" VerticalAlignment="Top"/>

        <!-- Browse Button -->
        <Button Name="btnBrowse" Content="..." Width="60" Height="25"
                Margin="0,25,0,0" HorizontalAlignment="Right" VerticalAlignment="Top"/>

        <!-- Create Package Button -->
        <Button Name="btnCreatePackage" Content="Create Package" Height="30"
                Margin="0,75,0,0" VerticalAlignment="Top"/>

        <!-- Status Box -->
        <TextBlock Name="txtStatus" Margin="0,120,0,0" Height="60" TextWrapping="Wrap"/>

    </Grid>
</Window>
"@

# ================================
# Load UI
# ================================
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# ================================
# Get Controls
# ================================
$txtSourcePath   = $window.FindName("txtSourcePath")
$btnCreatePackage = $window.FindName("btnCreatePackage")
$txtStatus       = $window.FindName("txtStatus")
$btnBrowse       = $window.FindName("btnBrowse")

# ================================
# Browse Button
# ================================
$btnBrowse.Add_Click({
    $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $openFileDialog.Title = "Select any file inside the Package folder"
    $openFileDialog.InitialDirectory = "C:\"
    $openFileDialog.Filter = "All files (*.*)|*.*"

    if ($openFileDialog.ShowDialog() -eq "OK") {
        $folderPath = Split-Path $openFileDialog.FileName -Parent
        $txtSourcePath.Text = $folderPath
    }
})

# ================================
# Create Package Button
# ================================
$btnCreatePackage.Add_Click({
    $srcPath = $txtSourcePath.Text
    if ([string]::IsNullOrWhiteSpace($srcPath)) {
        $txtStatus.Text = "Enter Source Path!"
        return
    }

    try {
        $txtStatus.Text = "Running package creation..."
        Create-Package -Path $srcPath
        $txtStatus.Text = "Package creation completed!"
    }
    catch {
        $txtStatus.Text = $_.Exception.Message
    }
})

# ================================
# Show Window
# ================================
$window.ShowDialog() | Out-Null