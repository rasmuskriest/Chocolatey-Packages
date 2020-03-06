$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://github.com/sharkdp/bat/releases/download/v0.12.1/bat-v0.12.1-x86_64-pc-windows-msvc.zip'

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    fileType      = 'exe'
    url           = $url
    checksum      = 'd6136b0133ad7f16029f7b996fc36cfb9af83828420e4a29d9798249fb8b37df'
    checksumType  = "sha256"
}

Install-ChocolateyZipPackage @packageArgs
