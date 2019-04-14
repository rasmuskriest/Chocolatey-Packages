$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://github.com/sharkdp/bat/releases/download/v0.10.0/bat-v0.10.0-x86_64-pc-windows-msvc.zip'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    checksum      = '84e6b1408d62811ccddce2361915f0f3bf98b196bfa03498e6c9909da37643fb'
    checksumType  = "sha256"
}

Install-ChocolateyZipPackage @packageArgs
