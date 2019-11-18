Import-Module au

$releases = 'https://github.com/jay0lee/GAM/releases'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"            = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = '-windows-x86.msi'
    $re64 = "-windows-x86_64.msi"
    $url = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href
    $url = 'https://github.com' + $url
    $url64 = $download_page.links | Where-Object href -match $re64 | Select-Object -First 1 -expand href
    $url64 = 'https://github.com' + $url64

    $version = $url -split '/' | Select-Object -Last 1 -Skip 1

    return @{
        URL     = $url
        URL64   = $url64
        Version = $version.Replace('v', '')
    }
}

Update-Package
