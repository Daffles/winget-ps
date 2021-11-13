<#
    .SYNOPSIS
        List installed Winget Packages
    .DESCRIPTION
        The list command of the winget tool displays a list of the applications currently installed on your computer.
        The list command will show apps that were installed through the Windows Package Manager as well as apps that were installed by other means.
        The list command will also display if an update is available for an app

        The list command also supports filters which can be used to limit your list query.
    .PARAMETER example
        Describe here
    .EXAMPLE
        Example here # TODO: Add examples for command
    .NOTES
        Authors: Byron Hawksmith, Lewis Shirer
        Link: https://github.com/Daffles/winget-ps
#>

Function Find-InstalledWgPackages {
    [cmdletbinding(DefaultParameterSetName = "Id")]
    [OutputType("InstalledPackage")]
    Param (
        [Parameter(
            ParameterSetName = "Id",
            Position = 0,
            ValueFromPipelineByPropertyName,
            HelpMessage = "Enter package Id - note parameter is treated as wilcard"
        )]
        [string]$Id,
        [Parameter(
            ParameterSetName = "Name",
            Position = 0,
            ValueFromPipelineByPropertyName,
            HelpMessage = "Enter package Name - note parameter is treated as wilcard"
        )]
        [string]$Name,
        [Parameter(
            ParameterSetName = "Moniker",
            Position = 0,
            ValueFromPipelineByPropertyName,
            HelpMessage = "Enter package Monkier - note parameter is treated as wilcard"
        )]
        [string]$Moniker,
        [Parameter(
            ParameterSetName = "Source",
            Position = 0,
            ValueFromPipelineByPropertyName,
            HelpMessage = "Enter package Source - note parameter is treated as wilcard"
        )]
        [string]$Source,
        [Parameter(
            ParameterSetName = "Exact",
            Position = 0,
            ValueFromPipelineByPropertyName,
            HelpMessage = "Enter exact package name"
        )]
        [string]$Exact
    )
    Begin {
        $cmdwinget = "winget list"
        switch ($PSCmdlet.ParameterSetName) { # TODO: Not sure if 'if' blocks are needed
            "Exact" {
                if (condition) {
                    $cmdwinget += " --exact '$Exact'"
                    Break
                }
            }
            "Id" {
                if (condition) {
                    $cmdwinget += " --id '$Id'"
                }
              }
            "Name" {
                if (condition) {
                    $cmdwinget += " --name '$Name'"
                }
            }
            "Moniker" {
                if (condition) {
                    $cmdwinget += " --moniker '$Moniker'"
                }
            }
            "Source" {
                if (condition) {
                    $cmdwinget += " --source '$Source'"
                }
            }
            
        }
        $winget = [scriptblock]::create($cmdwinget)
    }
    Process { # TODO: All code in process block is example code and is probably non-working
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