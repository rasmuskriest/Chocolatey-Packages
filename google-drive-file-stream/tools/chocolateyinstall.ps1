$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'google-drive-file-stream*'
  checksum      = 'c015c613d5ba54941934df3045459091'
  checksumType  = 'md5'
  silentArgs   = '--silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs










    








