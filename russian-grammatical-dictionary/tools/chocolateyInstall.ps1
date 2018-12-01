
$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://www.solarix.ru/for_developers/download/win/russian-grammar-setup.exe'
$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "rgdinstall.ahk"

Start-Process $ahkExe $ahkFile

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    softwareName   = 'Russian Grammatical Dictionary'
    checksum       = '608D2C181EC084FC84E1DED3671C2063DDA7022B3913C2481B6C6472B5C0CE3B'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
