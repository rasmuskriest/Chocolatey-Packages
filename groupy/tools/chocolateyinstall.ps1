$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://storage.stardock.com/files/current/Groupy1.17_setup_sd.exe'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    softwareName   = 'Stardock Groupy*'
    checksum       = '1ee0fa6a4c7873b9a3e181f60dddcaba8f7c63e9b2007c1a69dc9d26c81249e0'
    checksumType   = 'sha256'
    silentArgs     = '/SILENT /NOREBOOT'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs










    








