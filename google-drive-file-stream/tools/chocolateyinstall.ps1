$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$packageName = $env:ChocolateyPackageName
$softwareName = 'Google Drive File Stream'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe'

$alreadyInstalled = (AlreadyInstalled -product $softwareName)

# The following is implemented as Google Drive File Stream has its own update mechanism that moves the installation to a different directory.
if ($alreadyInstalled -and ($env:ChocolateyForce -ne $true)) {
    Write-Output $(
        "Google Drive File Stream is already installed. " +
        'No need to download and re-install as it updates automatically.'
    )
}
else {  
    $packageArgs = @{
        packageName    = $packageName
        unzipLocation  = $toolsDir
        fileType       = 'exe'
        url            = $url
        softwareName   = 'Google Drive File Stream*'
        checksum       = '067fa54fd9caa96c6093f51079056046191cd14d5fd71b386736ed4927174042'
        checksumType   = 'sha256'
        silentArgs     = '--silent'
        validExitCodes = @(0)
    }

    Install-ChocolateyPackage @packageArgs
}










    








