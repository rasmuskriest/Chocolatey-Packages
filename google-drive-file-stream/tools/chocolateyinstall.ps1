$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'Google Drive File Stream*'
  checksum      = '0f4ca2cafcfc99f98de7f6e268c0d9db'
  checksumType  = 'md5'
  silentArgs   = '--silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs










    








