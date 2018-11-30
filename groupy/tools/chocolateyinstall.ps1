$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://storage.stardock.com/files/current/Groupy1.17_setup_sd.exe'
$killscript = Join-Path $toolsDir "groupykillprocess.ps1"

$killjob = (Start-Process powershell $killscript -PassThru).ID

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    softwareName   = 'Stardock Groupy*'
    checksum       = '1ee0fa6a4c7873b9a3e181f60dddcaba8f7c63e9b2007c1a69dc9d26c81249e0'
    checksumType   = 'sha256'
    silentArgs     = '/SILENT /NOREBOOT'
    validExitCodes = @(0, 9)
}

Install-ChocolateyPackage @packageArgs

Start-Sleep 6
if (Get-Process -Id $killjob -ErrorAction SilentlyContinue) {
    Stop-Process -Id $killjob
}










    








