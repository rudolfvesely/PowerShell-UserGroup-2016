#region Tip
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

# Common tests (this is example)
Invoke-PesterMoreTest -TestPath $sut -ItemType 'Function'
#endregion



#region Tip
$content = @'
Get-Item -Name x | Remove-Item
'@
$errorItems = $null
[System.Management.Automation.PSParser]::Tokenize($content, [ref] $errorItems) | Out-Null
$errorItems

$content = @'
dgsdf1234sf.^&$*(df#$%#%#$gsdfdfgsd
'@
$errorItems = $null
[System.Management.Automation.PSParser]::Tokenize($content, [ref] $errorItems) | Out-Null
$errorItems
#endregion



#region Tip
Invoke-ScriptAnalyzer -Path 'C:\Users\tm\Desktop\New folder\3\60-CodeCoverage.ps1'
#endregion



#region Tip
Describe 'Run crazy tests' -Tags 'NotProduction' {
    It 'Will totally crash system' {
        Nuke-System
    }
}

$PSDefaultParameterValues += @{
    'Invoke-Pester:ExcludeTag' = 'NotProd'
}

# Invoke-Pester -ExcludeTag 'NotProd'
Invoke-Pester

#endregion