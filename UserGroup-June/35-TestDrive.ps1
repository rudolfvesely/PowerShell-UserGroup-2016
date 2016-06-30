Describe 'TestDrive' {   
    It 'Create some files' {
        New-Item -Path TestDrive:\myItem.txt -ItemType File | Should Not BeNullOrEmpty
    }
    It 'Remove it' {
        {
            Remove-Item -Path TestDrive:\myItem.txt
        } | Should Not Throw
    }
}

Describe 'TestDrive' {   
    It 'Remove it' {
        {
            Remove-Item -Path TestDrive:\myItem.txt -ErrorAction Stop
        } | Should Not Throw
    }
}