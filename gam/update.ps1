Import-Module au

$releases = 'https://github.com/GAM-team/GAM/releases'

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

    $re = 'GAM (?<version>[\d]*\.[\d]*)'
    $version = $releases -match $re | ForEach-Object { $Matches.version }
    $tag = (($releases.links | Where-Object outerHTML -match $re | Select-Object href)[0].href -Split "/")[-1]
    $url = 'https://github.com/GAM-team/GAM/releases/download/' + $tag + '/gam-' + $version + '-windows-x86.msi'
    $url64 = 'https://github.com/GAM-team/GAM/releases/download/' + $tag + '/gam-' + $version + '-windows-x86_64.msi'

    return @{
        URL     = $url
        URL64   = $url64
        Version = $version.Replace('v', '')
    }
}

Update-Package
