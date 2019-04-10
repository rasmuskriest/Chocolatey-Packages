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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = "-x86_64-pc-windows-msvc.zip"
    $url = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href
    $url = 'https://github.com' + $url

    $version = $url -split '-|.zip' | Select-Object -Last 1 -Skip 5

    return @{
        URL32   = $url
        Version = $version.Replace('v', '')
    }
}

Update-Package
