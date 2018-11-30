# Loop every 10 seconds until GroupyConfig.exe is found and killed.

$processNames = @("GroupyConfig")
$killedNames = @()

while ( !($processNames -eq $killedNames)) {
    foreach ($process in $processNames) {
        if (Get-Process $process -ErrorAction SilentlyContinue) {   
            Write-Output "$process found, killing now"
            Stop-Process -Name $process
            $killedNames += $process
        }
        else {
            "$process not found, retrying in a bit"
            Start-Sleep 3
        }
    }
}
