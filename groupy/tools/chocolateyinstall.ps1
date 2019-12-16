$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://cdn.stardock.us/downloads/public/software/groupy/Groupy1.30_setup_sd.exe'
$killscript = Join-Path $toolsDir "groupykillprocess.ps1"

$killjob = (Start-Process powershell $killscript -PassThru).ID

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    softwareName   = 'Stardock Groupy*'
    checksum       = 'b4229f878f847323aa1f7b462c2498441ea7ae39bfab064d94df48c8c24d5528'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0, 9)
}

Install-ChocolateyPackage @packageArgs

Start-Sleep 6
if (Get-Process -Id $killjob -ErrorAction SilentlyContinue) {
    Stop-Process -Id $killjob
}










    








