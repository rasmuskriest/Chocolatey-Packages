$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/jay0lee/GAM/releases/download/v6.04/gam-6.04-windows-x86.msi'
$url64 = 'https://github.com/jay0lee/GAM/releases/download/v6.04/gam-6.04-windows-x86_64.msi'

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

  checksum       = '7f93f6d1970fa48a06e319df2fccbea444eb1ebd6c29242c271b15a1fa141356'
  checksumType   = 'sha256'
  checksum64     = '03b045f206deb48ce359ff3460b9fb1c36f1782a72e6d8eb353851abfa3f1720'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








