$networkName = "DStv_Internet_2.4G_9E6450"
$resultsPath = "C:\Users\ChalasiMbira\Documents\Hacking_Tasks\Results\password-$networkName.txt"
netsh wlan show profile name=$networkName key=clear | Out-File -FilePath $resultsPath
Write-Host "Password details saved to $resultsPath"