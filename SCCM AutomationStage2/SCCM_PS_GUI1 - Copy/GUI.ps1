# File : GUI.ps1 

Add-Type -AssemblyName PresentationFramework

# Load functions
. "$PSScriptRoot\Functions.ps1"

# Connect to SCCM
Connect-SCCM

# XAML UI (IMPORTANT: inside @" "@)
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="SCCM Tool" Height="300" Width="350">

    <Grid Margin="10">

        <Label Content="Collection Name:" VerticalAlignment="Top"/>
        <TextBox Name="txtCollection" Height="25" Margin="0,25,0,0" VerticalAlignment="Top"/>

        <Button Name="btnCreateCollection" Content="Create Collection" Height="30" Margin="0,70,0,0" VerticalAlignment="Top"/>

        <TextBlock Name="txtStatus" Margin="0,120,0,0" Height="50" TextWrapping="Wrap"/>

    </Grid>
</Window>
"@

# Load UI
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Controls
$txtCollection = $window.FindName("txtCollection")
$btnCreateCollection = $window.FindName("btnCreateCollection")
$txtStatus = $window.FindName("txtStatus")

# Button click
$btnCreateCollection.Add_Click({

    $name = $txtCollection.Text

    if ([string]::IsNullOrWhiteSpace($name)) {
        $txtStatus.Text = "Enter collection name!"
        return
    }

    $txtStatus.Text = "Creating collection..."

    $result = New-SCCMDeviceCollection -CollectionName $name

    $txtStatus.Text = $result
})

# Show GUI
$window.ShowDialog() | Out-Null









