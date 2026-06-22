# File GUI_Package.ps1

Clear-Host

# Load WPF
Add-Type -AssemblyName PresentationFramework

# ================================
# SIMPLE XAML UI
# ================================
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Simple GUI" Height="200" Width="300">

    <StackPanel Margin="10">

        <TextBox Name="txtInput" Height="25" Margin="0,0,0,10"/>

        <Button Name="btnClick" Content="Click Me" Height="30" Margin="0,0,0,10"/>

        <TextBlock Name="txtOutput" />

    </StackPanel>
</Window>
"@

# ================================
# LOAD UI
# ================================
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# ================================
# GET CONTROLS
# ================================
$txtInput  = $window.FindName("txtInput")
$btnClick  = $window.FindName("btnClick")
$txtOutput = $window.FindName("txtOutput")

# ================================
# BUTTON EVENT
# ================================
$btnClick.Add_Click({

    $text = $txtInput.Text

    if ([string]::IsNullOrWhiteSpace($text)) {
        $txtOutput.Text = "Please enter something"
    }
    else {
        $txtOutput.Text = "You typed: $text"
    }

})

# ================================
# SHOW WINDOW
# ================================
$window.ShowDialog() | Out-Null
