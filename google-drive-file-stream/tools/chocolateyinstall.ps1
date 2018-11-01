$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
    url            = $url
    softwareName   = 'Google Drive File Stream*'
    checksum       = '13d60f3f915bee7476395caa6b1c71894a7f527c6e0fad4ff80e7ebcec72840a'
    checksumType   = 'sha256'
    silentArgs     = '--silent'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs










    








