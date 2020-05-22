$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/jay0lee/GAM/releases/download/v5.10/gam-5.10-windows-x86.msi'
$url64 = 'https://github.com/jay0lee/GAM/releases/download/v5.10/gam-5.10-windows-x86_64.msi'

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

  checksum       = 'f90f6cdec210c42d8a5e6a5dcba5e90cea62e88cc317c7b96a29d361e1265160'
  checksumType   = 'sha256'
  checksum64     = '535795b1e26458d5ffa61f4eca5e111fb0fdac35936701cc6f8b95bbbe6f588c'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








