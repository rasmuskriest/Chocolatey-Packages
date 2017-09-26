$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe'
$ahkExe         = 'AutoHotKey'
$ahkFile        = Join-Path $toolsDir "bingdesktopinstall.ahk"

Start-Process $ahkExe $ahkFile

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'google-drive-file-stream*'
  checksum      = '9c29caaf38c41c7e46b0855024943b9b'
  checksumType  = 'md5'
  silentArgs   = '--silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs










    








