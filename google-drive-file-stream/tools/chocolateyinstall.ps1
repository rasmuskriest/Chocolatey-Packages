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
    checksum       = 'f00b77909cd339dcf0adc94c6b146e8110310023faa7a6ef378eaf11af954220'
    checksumType   = 'sha256'
    silentArgs     = '--silent'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs










    








