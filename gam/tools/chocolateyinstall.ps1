$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/jay0lee/GAM/releases/download/v4.96/gam-4.96-windows-x86.msi'
$url64 = 'https://github.com/jay0lee/GAM/releases/download/v4.96/gam-4.96-windows-x86_64.msi'

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

  checksum       = 'e3e0e3e8d0a0b02827b44cfdc25e90fd8e9b85f4c9d70f724c9994895691bc6b'
  checksumType   = 'sha256'
  checksum64     = 'f96913b4d731417c4f5d88e06ce49ab1a4de3889edcb041ecf6b22384a02d8c0'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








