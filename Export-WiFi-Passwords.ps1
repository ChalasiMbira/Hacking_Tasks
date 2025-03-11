# Extracts all Wi-Fi passwords and saves them to Results/wifi-passwords.csv
$profiles = (netsh wlan show profiles) | Select-String "All User Profile\s+:\s+(.+)$" | ForEach-Object { $_.Matches.Groups[1].Value }
$results = @()
foreach ($profile in $profiles) {
    $password = (netsh wlan show profile name=$profile key=clear) | Select-String "Key Content\s+:\s+(.+)$" | ForEach-Object { $_.Matches.Groups[1].Value }
    if (-not $password) { $password = "Not found" }
    $results += [PSCustomObject]@{
        ProfileName = $profile
        Password    = $password
    }
}
$resultsPath = "C:\Users\ChalasiMbira\Documents\Hacking_Tasks\Results\wifi-passwords.csv"
$results | Format-Table -AutoSize
$results | Export-Csv -Path $resultsPath -NoTypeInformation
Write-Host "Passwords saved to $resultsPath"