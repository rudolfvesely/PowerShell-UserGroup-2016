Describe 'TestDrive' {   
    $dir0 = 'TestDrive:\dir0'
    $dir1 = 'TestDrive:\dir1'

    # $dir0 = Join-Path -Path $TestDrive -ChildPath 'dir0'
    # $dir1 = Join-Path -Path $TestDrive -ChildPath 'dir1'
    New-Item -Path $dir0 -ItemType Directory
    New-Item -Path (Join-Path -Path $dir0 -ChildPath 'file.txt') -ItemType File
    
    It 'Copy using robocopy' {
        & robocopy $dir0, $dir1
        $dir1 | Should Exist
    }
}


#
# New-PSDrive -Name MyPF -PSProvider FileSystem -Root 'C:\Program Files'
# Get-PSDrive -Name ('MyPF:\Windows Defender' -replace '^([a-zA-Z0-9]{2,}):.*', '$1') | Select-Object -ExpandProperty Root
#