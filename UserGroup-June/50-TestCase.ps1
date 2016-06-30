Describe 'TestCases' {   
    $testCases = @(
        @{ Number = 0; SizeBytes = 10737418240    } # 10 GB
        @{ Number = 1; SizeBytes = 21474836480    } # 20 GB
        @{ Number = 2; SizeBytes = 15393162788864 } # 14 TB
        @{ Number = 3; SizeBytes = 16492674416640 } # 15 TB
        @{ Number = 4; SizeBytes = 54975581388800 } # 50 TB
        @{ Number = 5; SizeBytes = 65970697666560 } # 60 TB
    )

    It 'Create disk number <Number> that has size <SizeBytes> B' -TestCases $testCases {
        Param($Number, $SizeBytes)
        
        Write-Verbose -Message ('Disk #{0} that has size {1} GB' -f $Number, ([Math]::Round(($SizeBytes / 1073741824), 0))) -Verbose
        $true | Should Be $true
    }
}


#
# New-PSDrive -Name MyPF -PSProvider FileSystem -Root 'C:\Program Files'
# Get-PSDrive -Name ('MyPF:\Windows Defender' -replace '^([a-zA-Z0-9]{2,}):.*', '$1') | Select-Object -ExpandProperty Root
#