$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$packageName = $env:ChocolateyPackageName
$softwareName = 'Google Drive'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://dl.google.com/drive-file-stream/GoogleDrive.exe'

$alreadyInstalled = (AlreadyInstalled -product $softwareName)

# The following is implemented as Google Drive File Stream has its own update mechanism that moves the installation to a different directory.
if ($alreadyInstalled -and ($env:ChocolateyForce -ne $true)) {
    Write-Output $(
        "Google Drive for desktop is already installed. " +
        'No need to download and re-install as it updates automatically.'
    )
}
else {  
    $packageArgs = @{
        packageName    = $packageName
        unzipLocation  = $toolsDir
        fileType       = 'exe'
        url            = $url
        softwareName   = 'Google Drive*'
        checksum       = 'e9c865246af8cb0aa694554cf2276b75d051d684aa3eee308d748a83fe049c74'
        checksumType   = 'sha256'
        silentArgs     = '--silent'
        validExitCodes = @(0)
    }

    Install-ChocolateyPackage @packageArgs
}










    








