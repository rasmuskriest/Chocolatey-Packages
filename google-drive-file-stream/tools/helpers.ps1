function AlreadyInstalled() {
    param(
        [Parameter(Mandatory = $true)]
        [string]$product
    )
    $uninstallEntry = $(
        Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" -Recurse | Get-ItemProperty | Where-Object DisplayName -eq $product
    )
    
    $uninstallEntryWow64 = $(
        Get-ChildItem "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\" -Recurse | Get-ItemProperty | Where-Object DisplayName -eq $product
    )
  
    if ($uninstallEntry -or $uninstallEntryWow64) {
        return $true
    }
  
    return $false
}
