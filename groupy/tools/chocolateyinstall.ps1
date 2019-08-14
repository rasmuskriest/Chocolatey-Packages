$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://cdn.stardock.us/downloads/public/software/groupy/Groupy1.25_setup_sd.exe'
$killscript = Join-Path $toolsDir "groupykillprocess.ps1"

$killjob = (Start-Process powershell $killscript -PassThru).ID

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    softwareName   = 'Stardock Groupy*'
    checksum       = '03330554E1A0E45907F5B8067F05AEDE052C4A3ACE27FCE0727E62837A790182'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0, 9)
}

Install-ChocolateyPackage @packageArgs

Start-Sleep 6
if (Get-Process -Id $killjob -ErrorAction SilentlyContinue) {
    Stop-Process -Id $killjob
}










    








