$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/jay0lee/GAM/releases/download/v6.08/gam-6.08-windows-x86.msi'
$url64 = 'https://github.com/jay0lee/GAM/releases/download/v6.08/gam-6.08-windows-x86_64.msi'

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

  checksum       = '93d81e2d535a4f4d7b5b2773bc4e342f8ba2f397bb691953d580cbb68748a34f'
  checksumType   = 'sha256'
  checksum64     = '6c59275e75569ef496a652805ad18d45cc05065e07f9ffcf6bbc6e8e424fdd34'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








