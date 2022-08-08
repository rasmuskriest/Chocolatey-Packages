$ErrorActionPreference = 'Stop';

$toolsDir               = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url                    = 'https://cdn.stardock.us/downloads/public/software/groupy/Groupy_setup.exe'
$checksum               = 'd7a1bf094f00708522b6ac5d06ca0770dcf5eba696808de1d9dedb4feacb9aca'
$checksumType           = 'sha256'

$killscript = Join-Path $toolsDir "groupykillprocess.ps1"

$killjob = (Start-Process powershell $killscript -PassThru).ID

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    softwareName   = 'Stardock Groupy*'
    url            = $url
    checksum       = $checksum
    checksumType   = $checksumType
    silentArgs     = '/s'
    validExitCodes = @(0, 9)
}

[version]$OSVer = (Get-WmiObject Win32_OperatingSystem).Version
$min='6.1.7601'

If ( $OSVer -lt [version]$min ) {
  Write-Warning "*** Stardock Groupy requires a desktop OS running Windows 7 or higher... ***`n"
  throw
} Else {
  Install-ChocolateyPackage @packageArgs
}

Start-Sleep 6
if (Get-Process -Id $killjob -ErrorAction SilentlyContinue) {
    Stop-Process -Id $killjob
}










    








