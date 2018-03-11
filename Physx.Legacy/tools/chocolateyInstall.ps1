$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://us.download.nvidia.com/Windows/9.13.0604/PhysX-9.13.0604-SystemSoftware-Legacy.msi'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'msi'
    url            = $url
    softwareName   = 'PhysX (Legacy)*'
    checksum       = 'c73bd5c9631735b8c2d071aa05a7b598'
    checksumType   = 'md5'
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
