$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/GAM-team/GAM/releases/download/v6.58/gam-6.58-windows-x86.msi'
$url64 = 'https://github.com/GAM-team/GAM/releases/download/v6.58/gam-6.58-windows-x86_64.msi'

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

  checksum       = '333295aaf4b80a5a210ed2ad6d7622e87f3e3e3988df386230aa1379c79f9437'
  checksumType   = 'sha256'
  checksum64     = '03558402c8218a02fa32a07402eb0875b4fa11a75a7ca763f544eb14688ddc0a'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
