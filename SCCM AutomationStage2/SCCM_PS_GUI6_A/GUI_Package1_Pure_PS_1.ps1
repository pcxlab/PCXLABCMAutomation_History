# ================================
# Pure PowerShell SCCM Package GUI
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
$form.Size = New-Object System.Drawing.Size(400, 450)
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

# Package Name
$lblPackageName = New-Object System.Windows.Forms.Label
$lblPackageName.Text = "Package Name:"
$lblPackageName.Location = New-Object System.Drawing.Point(10, 70)
$lblPackageName.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($lblPackageName)

$txtPackageName = New-Object System.Windows.Forms.TextBox
$txtPackageName.Location = New-Object System.Drawing.Point(10, 95)
$txtPackageName.Size = New-Object System.Drawing.Size(350, 25)
$txtPackageName.ReadOnly = $true
$form.Controls.Add($txtPackageName)

# Company
$lblCompany = New-Object System.Windows.Forms.Label
$lblCompany.Text = "Company:"
$lblCompany.Location = New-Object System.Drawing.Point(10, 130)
$lblCompany.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($lblCompany)

$txtCompany = New-Object System.Windows.Forms.TextBox
$txtCompany.Location = New-Object System.Drawing.Point(10, 155)
$txtCompany.Size = New-Object System.Drawing.Size(350, 25)
$txtCompany.ReadOnly = $true
$form.Controls.Add($txtCompany)

# Product
$lblProduct = New-Object System.Windows.Forms.Label
$lblProduct.Text = "Product:"
$lblProduct.Location = New-Object System.Drawing.Point(10, 190)
$lblProduct.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($lblProduct)

$txtProduct = New-Object System.Windows.Forms.TextBox
$txtProduct.Location = New-Object System.Drawing.Point(10, 215)
$txtProduct.Size = New-Object System.Drawing.Size(350, 25)
$txtProduct.ReadOnly = $true
$form.Controls.Add($txtProduct)

# Version
$lblVersion = New-Object System.Windows.Forms.Label
$lblVersion.Text = "Version:"
$lblVersion.Location = New-Object System.Drawing.Point(10, 250)
$lblVersion.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($lblVersion)

$txtVersion = New-Object System.Windows.Forms.TextBox
$txtVersion.Location = New-Object System.Drawing.Point(10, 275)
$txtVersion.Size = New-Object System.Drawing.Size(350, 25)
$form.Controls.Add($txtVersion)

# Create Package Button
$btnCreatePackage = New-Object System.Windows.Forms.Button
$btnCreatePackage.Text = "Create Package"
$btnCreatePackage.Location = New-Object System.Drawing.Point(10, 310)
$btnCreatePackage.Size = New-Object System.Drawing.Size(350, 30)
$form.Controls.Add($btnCreatePackage)

# Status TextBlock (Label)
$txtStatus = New-Object System.Windows.Forms.Label
$txtStatus.Location = New-Object System.Drawing.Point(10, 350)
$txtStatus.Size = New-Object System.Drawing.Size(350, 60)
$txtStatus.AutoSize = $false
$txtStatus.BorderStyle = "Fixed3D"
$form.Controls.Add($txtStatus)

# ================================
# Functions
# ================================

# Auto-fill Package Info from Path
$txtSourcePath.Add_TextChanged({
    $path = $txtSourcePath.Text
    if ([string]::IsNullOrWhiteSpace($path)) { return }

    try {
        $pathSplit = $path -split "\\"
        if ($pathSplit.Count -lt 3) { return }

        $packageName = $pathSplit[-1]
        $company     = $pathSplit[-3]
        $product     = $pathSplit[-2]

        $versionSplit = $packageName -split "_"
        $version = $versionSplit[-1]

        $txtPackageName.Text = $packageName
        $txtCompany.Text     = $company
        $txtProduct.Text     = $product
        $txtVersion.Text     = $version
    }
    catch {
        # silent
    }
})

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