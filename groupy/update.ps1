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

    $tag = "h2"
    $re = "\w[Groupy]\s\d"
    $ver = "\d\.\d{0,}(\n|$|\.\d{0,})"

    $version = (($releases.AllElements | Where-Object { $_.TagName -eq $tag -and $_.innerText -Match $re }).innerText | Select-Object -First 1) -Match $ver
    $url = "https://cdn.stardock.us/downloads/public/software/groupy/Groupy_setup.exe"
    # Old $url including the specific version. Keeping for now as Stardock changes their URL scheme often.
    # $url = ( -Join ("https://cdn.stardock.us/downloads/public/software/groupy/Groupy", $Matches[0], "_setup_sd.exe") )

    return @{
        URL32   = $url
        Version = $Matches[0]
    }
}

Update-Package
