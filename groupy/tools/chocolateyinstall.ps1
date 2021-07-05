$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://cdn.stardock.us/downloads/public/software/groupy/Groupy_setup.exe'
$killscript = Join-Path $toolsDir "groupykillprocess.ps1"

$killjob = (Start-Process powershell $killscript -PassThru).ID

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    softwareName   = 'Stardock Groupy*'
    checksum       = 'd7a1bf094f00708522b6ac5d06ca0770dcf5eba696808de1d9dedb4feacb9aca'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0, 9)
}

Install-ChocolateyPackage @packageArgs

Start-Sleep 6
if (Get-Process -Id $killjob -ErrorAction SilentlyContinue) {
    Stop-Process -Id $killjob
}










    








