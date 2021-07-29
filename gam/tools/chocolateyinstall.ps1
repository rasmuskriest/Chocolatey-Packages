$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/jay0lee/GAM/releases/download/v6.07/gam-6.07-windows-x86.msi'
$url64 = 'https://github.com/jay0lee/GAM/releases/download/v6.07/gam-6.07-windows-x86_64.msi'

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

  checksum       = 'eee07c786732165e4f09f9e04d1564bed5bc19b65f9f56aec97f1f85aef8d751'
  checksumType   = 'sha256'
  checksum64     = 'e1e7433c27f27c3ba60c75e7d0003a368fc37640daa912267c0ec5f5a99b7864'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








