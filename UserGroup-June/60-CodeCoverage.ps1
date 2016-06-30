Function Get-SomeDate {
    Param(
        [switch] $SwitchMe
    )

    if ($SwitchMe) {
        return 'Yes'
    } else {
        return 'No'
    }
}

Describe 'Demonstrating Code Coverage' {
    It 'First test' {
        Get-SomeDate -SwitchMe | Should Be 'Yes'
    }
    It 'Second test' {
        Get-SomeDate           | Should Be 'No'
    }
}

# Invoke-Pester -Script .\60-CodeCoverage.ps1 -CodeCoverage @{Path = '.\60-CodeCoverage.ps1'; Function = 'Get-SomeDate' }