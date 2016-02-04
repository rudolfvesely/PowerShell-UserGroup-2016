# Housecleaning
$path = 'C:\temp\PesterTest'
if (Test-Path -Path $path) {
    Set-Location -Path (Join-Path -Path (Split-Path -Qualifier -Path $path) -ChildPath \)
    Remove-Item -Path $path -Recurse -Confirm:$false -Verbose
}
New-Item -Path $path -ItemType Directory
Set-Location -Path $path

# Scaffolding
New-Fixture -Path TestCase -Name TestCase 
Set-Location -Path .\TestCase
Get-ChildItem | ForEach-Object -Process { & powershell_ise.exe $_.FullName }

# Invoke Pester...