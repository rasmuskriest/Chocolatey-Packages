Import-Module au

$releases = 'https://github.com/sharkdp/bat/releases'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $releases = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = "v(?<version>[\d]*\.[\d]*\.[\d]*)"
    $version = $releases -match $re | ForEach-Object { $Matches.version }
    $url = 'https://github.com/sharkdp/bat/releases/download/v' + $version + "/bat-v" + $version + "-x86_64-pc-windows-msvc.zip"

    return @{
        URL32   = $url
        Version = $version.Replace('v', '')
    }
}

Update-Package
