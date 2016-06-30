#region Be
Describe 'Be / BeExactly' {   
    It 'Be' {
        1 | Should Be 1
    }
    It 'Not Be' {
        'Hello' | Should Not Be 'Hi'
    }
    It 'BeExactly' {
        'Hello' | Should BeExactly 'Hello'
    }
}
#endregion



#region Be Data Type
Describe 'Will not work' {   
    It 'Will not work' {
        'hi' | Should Be [System.String]
    }
}
Describe 'It''s OK' {   
    It 'GetType().FullName' {
        $myString = 'hi'
        'hi'.GetType().FullName | Should Be 'System.String'
    }
    It 'more cool' {
        $myString = 'hi'
        'hi' -is [string] | Should Be $true
    }
}
#endregion


#region BeNullOrEmpty
Describe 'BeNullOrEmpty-Success' {   
    It '$null' {
        $null | Should BeNullOrEmpty
    }
    It '@()' {
        @() | Should BeNullOrEmpty
    }
    It '''''' {
        '' | Should BeNullOrEmpty
    }
}
Describe 'BeNullOrEmpty-Fail' {   
    It '$false' {
        $false | Should BeNullOrEmpty
    }
    It '0' {
        0 | Should BeNullOrEmpty
    }
}
Describe 'BeNullOrEmpty-How to use $false or 0' {   
    It '[bool] 0' {
        [bool] 0 | Should Be $false
    }
}
#endregion



#region Exist
Describe 'Exist' {   
    It 'Exist' {
        $path = 'C:\Windows'
        $path | Should Exist
    }
}
#endregion



#region Contain / ContainExactly
Describe 'Contain / ContainExactly' {   
    $path = 'TestDrive:\myFile.txt'
    Set-Content -Path $path -Value 'Monday Tuesday Sunday'

    It 'Contain' {
        $path | Should Contain 'Monday'
    }
    It 'Not Contain' {
        $path | Should Not Contain 'Friday'
    }
    It 'Not ContainExactly' {
        $path | Should Not ContainExactly 'monday'
    }
}
#endregion



#region Match / MatchExactly
Describe 'Match / MatchExactly' {   
    It 'Match' {
        'I am Rudolf Vesely, @RudolfVesely' | Should Match '^I.+Vesely.+[x-z]$'
    }
    It 'MatchExactly' {
        'I am Rudolf Vesely, @RudolfVesely' | Should MatchExactly '^I.+Vesely.+[x-z]$'
    }
}
#endregion



#region Throw
Describe 'Throw' {   
    It 'Throw' {
        {
            notExistingCommnd
        } | Should Throw
    }
    It 'Throw' {
        {
            1 / 0
        } | Should Throw
    }
    It 'Not Throw' {
        {
            1 + 1
        } | Should Not Throw
    }
    It 'Throw with specific message' {
        {
            throw 'specific message'
        } | Should Throw 'specific message'
    }
}
#endregion