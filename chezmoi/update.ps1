Import-Module au

$releases = 'https://github.com/twpayne/chezmoi/releases'

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
    $releases = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = 'v(?<version>[\d]*\.[\d]*\.[\d]*)'
    $version = $releases -match $re | ForEach-Object { $Matches.version }
    $url = 'https://github.com/twpayne/chezmoi/releases/download/v' + $version + '/chezmoi_' + $version + '_windows_i386.zip'
    $url64 = 'https://github.com/twpayne/chezmoi/releases/download/v' + $version + '/chezmoi_' + $version + '_windows_amd64.zip'

    return @{
        URL     = $url
        URL64   = $url64
        Version = $version.Replace('v', '')
    }
}

Update-Package
