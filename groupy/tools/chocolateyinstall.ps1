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
    checksum       = '9ed2800e239f496b7f2bd21fe443f4617b862431f259d6f1c1b8fd1644cbd49a'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0, 9)
}

Install-ChocolateyPackage @packageArgs

Start-Sleep 6
if (Get-Process -Id $killjob -ErrorAction SilentlyContinue) {
    Stop-Process -Id $killjob
}










    








