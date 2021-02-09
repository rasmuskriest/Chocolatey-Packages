Import-Module au

$url = 'https://dl.google.com/drive-file-stream/GoogleDrive.exe'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    Invoke-WebRequest -Uri $url -OutFile "$PSScriptRoot\GoogleDrive.exe"
    $version = (Get-Item "$PSScriptRoot\GoogleDrive.exe").VersionInfo.FileVersion
    return @{
        Version = $version
    }
}

Update-Package
