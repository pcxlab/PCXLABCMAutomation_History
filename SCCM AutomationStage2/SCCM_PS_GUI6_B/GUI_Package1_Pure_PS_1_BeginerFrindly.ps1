# ================================
# Simplified SCCM Package GUI
# ================================

Clear-Host
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Load your functions (IMPORTANT)
. "$PSScriptRoot\Functions.ps1"
. "$PSScriptRoot\Package Function_V0.8.3.ps1"

# Connect SCCM
Connect-SCCM

# ================================
# Create Form
# ================================
$form = New-Object System.Windows.Forms.Form
$form.Text = "SCCM Package Tool"
$form.Size = New-Object System.Drawing.Size(400, 250)
$form.StartPosition = "CenterScreen"

# ================================
# Controls
# ================================

# Source Path Label
$lblSource = New-Object System.Windows.Forms.Label
$lblSource.Text = "Source Path:"
$lblSource.Location = New-Object System.Drawing.Point(10, 10)
$lblSource.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($lblSource)

# Source Path TextBox
$txtSourcePath = New-Object System.Windows.Forms.TextBox
$txtSourcePath.Location = New-Object System.Drawing.Point(10, 35)
$txtSourcePath.Size = New-Object System.Drawing.Size(280, 25)
$form.Controls.Add($txtSourcePath)

# Browse Button
$btnBrowse = New-Object System.Windows.Forms.Button
$btnBrowse.Text = "..."
$btnBrowse.Location = New-Object System.Drawing.Point(300, 35)
$btnBrowse.Size = New-Object System.Drawing.Size(60, 25)
$form.Controls.Add($btnBrowse)

# Create Package Button
$btnCreatePackage = New-Object System.Windows.Forms.Button
$btnCreatePackage.Text = "Create Package"
$btnCreatePackage.Location = New-Object System.Drawing.Point(10, 75)
$btnCreatePackage.Size = New-Object System.Drawing.Size(350, 30)
$form.Controls.Add($btnCreatePackage)

# Status Box (Label)
$txtStatus = New-Object System.Windows.Forms.Label
$txtStatus.Location = New-Object System.Drawing.Point(10, 120)
$txtStatus.Size = New-Object System.Drawing.Size(350, 60)
$txtStatus.AutoSize = $false
$txtStatus.BorderStyle = "Fixed3D"
$form.Controls.Add($txtStatus)

# ================================
# Functions
# ================================

# Browse Button
$btnBrowse.Add_Click({
    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.Title = "Select any file inside the Package folder"
    $dialog.InitialDirectory = "C:\"
    $dialog.Filter = "All files (*.*)|*.*"

    if ($dialog.ShowDialog() -eq "OK") {
        $folderPath = Split-Path $dialog.FileName -Parent
        $txtSourcePath.Text = $folderPath
    }
})

# Create Package Button
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
# Show Form
# ================================
$form.Add_Shown({ $form.Activate() })
[void]$form.ShowDialog()