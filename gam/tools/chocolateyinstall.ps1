$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/GAM-team/GAM/releases/download/v6.18/gam-6.18-windows-x86.msi'
$url64 = 'https://github.com/GAM-team/GAM/releases/download/v6.18/gam-6.18-windows-x86_64.msi'

$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "gaminstall.ahk"

Start-Process $ahkExe $ahkFile

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = $url
  url64bit       = $url64

  softwareName   = 'gam*'

  checksum       = 'd495be8f9c6c785c70ab0b645e61d4d4aaa7c4ca1ed0cb75da40b87dba09a194'
  checksumType   = 'sha256'
  checksum64     = '339151f0ff0f7efdd46e9e6b9a405321ede4d056bd4a250bd92051fc275ea38a'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








