$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.microsoft.com/download/0/7/8/078E99E2-F1AE-4F46-B3EE-8208B7D01E5C/BDT5/BingDesktopSetup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'Bing*'
  checksum      = 'c6fc8b635dfdf72cf69fd42899bc86f1'
  checksumType  = 'md5'
  silentArgs   = '/Q'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
