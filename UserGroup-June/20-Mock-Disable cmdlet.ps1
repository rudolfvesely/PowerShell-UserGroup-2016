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
    }
}


Describe 'Remove-ItemAndDoItHard' {
    # You can mock here
    # Mock Remove-Item
    It 'Remove Windows' {
        # Or in higher scope...
        Mock Remove-Item

        # How can you "disable" bult-in cmdlet?
        # Get-Help -Name about_Command_Precedence -ShowWindow
        
        # Do you need to Mock Get-Item?

        Remove-ItemAndDoItHard -Path $env:SystemRoot | Select-Object -ExpandProperty FullName | Should Be $env:SystemRoot
    }
}

