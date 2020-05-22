$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://github.com/twpayne/chezmoi/releases/download/v1.8.1/chezmoi_1.8.1_windows_i386.zip'
$url64 = 'https://github.com/twpayne/chezmoi/releases/download/v1.8.1/chezmoi_1.8.1_windows_amd64.zip'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    url64bit       = $url64
    checksum       = '3425294ff421816f49ef81cd6f7a67ec89c230354d959229ed5057157a73173d'
    checksumType   = 'sha256'
    checksum64     = 'a914f05e2a84a3637d030bd68b6da807e73745d858e7c17afa5b9ff32e4fda67'
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
