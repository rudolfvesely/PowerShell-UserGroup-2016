Function Remove-ItemAndDoItHard {
    Param(
        $Path
    )

    Begin {
        $ErrorActionPreference = 'Stop'
    }
    
    Process {
        Get-Item -Path $Path
        Remove-Item -Path $Path -Recurse -Force
        # Remove-Item -Path $Path -Recurse -Force
    }
}


Describe 'Remove-ItemAndDoItHard' {
    Mock Remove-Item
    
    It 'Remove Windows' {
        Remove-ItemAndDoItHard -Path $env:SystemRoot | Select-Object -ExpandProperty FullName | Should Be $env:SystemRoot
        Assert-MockCalled Remove-Item -Exactly 1 -Scope It
    }
    It 'Remove has correct path' {
        Remove-ItemAndDoItHard -Path $env:SystemRoot | Select-Object -ExpandProperty FullName | Should Be $env:SystemRoot
        Assert-MockCalled Remove-Item -Exactly 1 -Scope It -ParameterFilter { $Path -like '*Windows*' }
    }
}