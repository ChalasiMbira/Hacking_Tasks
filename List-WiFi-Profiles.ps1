# Lists all saved Wi-Fi profiles and saves them to Results/profiles.txt
$resultsPath = "C:\Users\YourName\Desktop\WiFi-PowerShell-Labs\Results\profiles.txt"
netsh wlan show profiles | Out-File -FilePath $resultsPath
Write-Host "Profiles saved to $resultsPath"