$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/GAM-team/GAM/releases/download/20221101.195551/gam-6.30-windows-x86.msi'
$url64 = 'https://github.com/GAM-team/GAM/releases/download/20221101.195551/gam-6.30-windows-x86_64.msi'

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

  checksum       = '17B2D71C4B0512F617626213D040881A42653A125C1C50FDFDC15911BA54D72F'
  checksumType   = 'sha256'
  checksum64     = '497C0E0D6C79FF7DCE8CACCE91BB5C214DCCB10CCD0100954B632039F5C42DEF'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








