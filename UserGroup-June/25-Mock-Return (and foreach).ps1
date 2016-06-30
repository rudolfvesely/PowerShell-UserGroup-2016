Function Get-VMForTesting {
    Param(
        $Name
    )

    Begin {
        $ErrorActionPreference = 'Stop'
    }
    
    Process {
        Get-VM -Name @($Name).ForEach{ 'Test-{0}' -f $_ }
    }
}

Describe 'Remove-ItemAndDoItHard' {
    # This is not enough
    # Mock Get-VM

    # This is fine
    Mock Get-VM {
        return [PSCustomObject] @{ Name = 'Test-xxx' }
    }

    # Mock is just a function so this is OK: Mock Get-VM -MockWith { }

    $testNames = 'aaa', 'bbb', 'ccc'

    foreach ($testName in $testNames) {
        It ('Get one item ("{0}")' -f $testName) {
            (Get-VMForTesting -Name $testName).Name | Should Match '^Test*'
        }
    }
}