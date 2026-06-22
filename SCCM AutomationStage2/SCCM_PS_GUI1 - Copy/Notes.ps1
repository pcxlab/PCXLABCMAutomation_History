Import-Module ConfigurationManager

New-PSDrive -Name PS1 -PSProvider CMSite -Root CM01.corp.pcxlab.com

Set-Location "PS1:\"


New-PSDrive -Name PS1 -PSProvider CMSite -Root CM01.corp.pcxlab.com


Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1"

New-PSDrive -Name PS1 -PSProvider CMSite -Root CM01.corp.pcxlab.com
cd PS1:
Get-CMDevice

. .\Functions.ps1








