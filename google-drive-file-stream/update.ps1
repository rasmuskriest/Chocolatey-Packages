Import-Module au

$url = 'https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    Invoke-WebRequest -Uri $url -OutFile "$PSScriptRoot\GoogleDriveFSSetup.exe"
    $version = (Get-Item "$PSScriptRoot\GoogleDriveFSSetup.exe").VersionInfo.FileVersion
    return @{
        Version = $version
    }
}

Update-Package
