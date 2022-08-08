Import-Module au

$history_page = 'https://www.stardock.com/products/groupy/history'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(?i)(.*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
        }
    }
}

function global:au_GetLatest {
    $releases = Invoke-WebRequest -Uri $history_page
    
    $url = "https://cdn.stardock.us/downloads/public/software/groupy/Groupy_setup.exe"

    $re = "Groupy (?<version>[\d\.]+[\d\.]+)"
    $version = $releases -match $re | ForEach-Object { $Matches.version }

    return @{
        URL32   = $url
        Version = $version
    }
}

Update-Package -ChecksumFor none
