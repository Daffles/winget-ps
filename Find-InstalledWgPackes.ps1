<#
    .SYNOPSIS
        Synopsis here
    .DESCRIPTION
        Description here
    .PARAMETER example
        Describe here
    .EXAMPLE
        Example here
    .NOTES
        Authors: Byron Hawksmith, Lewis Shirer
        Link: https://github.com/Daffles/winget-ps
#>

Function Find-InstalledWgPackages {
    [cmdletbinding()]
    Param (
        [string]$Name
    )
    Begin {
        
    }
    Process {
        $testData = winget.exe list
        $count = 0

        $packages = New-Object System.Collections.ArrayList
        foreach ($row in $testData) {
            $count += 1
            if ($count -ge 5) {
                if ($row.length -gt 117) {
                    $pkgObj = [PSCustomObject]@{
                        name = ($row.Substring(0,45)).Trim()
                        id = ($row.Substring(46,45)).Trim()
                        version = ($row.Substring(92,19)).Trim()
                        source = ($row.Substring(111,7)).Trim()
                    }
                    $packages.Add($pkgObj) | Out-Null
                }
            }
        }
        foreach ($obj in $packages) {
            Write-Host $obj.name -and $obj.source
        }
    }
    End {

    }
}