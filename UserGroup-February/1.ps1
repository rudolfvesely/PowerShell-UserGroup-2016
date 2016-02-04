# it's open source
Get-Module -Name Pester -ListAvailable
Get-Module -Name Pester -ListAvailable | Select-Object -ExpandProperty Path -OutVariable modulePath

ii (Split-Path -Path $modulePath)