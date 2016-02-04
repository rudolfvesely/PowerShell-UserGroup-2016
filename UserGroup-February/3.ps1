#region Basic structure

# Describe...
# Context...
# It...
# Run...

Describe 'Testing something' {
    Context 'Success' {
        It 'Should be True' {
            $True | Should Be $True
        }
        It 'Should be False' {
            $False | Should Be $False
        }
    }
    Context 'Fail' {
        It 'Should be False' {
            $False | Should Be $True
        }
        It 'Should be True' {
            $True | Should Be $False
        }
    }
}

# Simple? Can you write it without Pester?

#endregion

#region Multiple tests
Describe 'Multiple tests' {
    It 'Fail' {
        $True | Should Be $True
        $True | Should Be $false
    }
}
#endregion