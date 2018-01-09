$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    softwareName   = 'Google Drive File Stream*'
    checksum       = 'ee9147dbaced32123c576f088e6de525'
    checksumType   = 'md5'
    silentArgs     = '--silent'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs










    








