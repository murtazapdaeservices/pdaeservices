# PowerShell script to revert SMB signing settings on both client and server

# Revert SMB signing on the Client (Workstation)
$clientKeyPath = "HKLM:\System\CurrentControlSet\Services\LanManWorkstation\Parameters"
Set-ItemProperty -Path $clientKeyPath -Name "RequireSecuritySignature" -Value 0
Set-ItemProperty -Path $clientKeyPath -Name "EnableSecuritySignature" -Value 0

# Revert SMB signing on the Server (LanmanServer)
$serverKeyPath = "HKLM:\System\CurrentControlSet\Services\LanmanServer\Parameters"
Set-ItemProperty -Path $serverKeyPath -Name "RequireSecuritySignature" -Value 0
Set-ItemProperty -Path $serverKeyPath -Name "EnableSecuritySignature" -Value 0

# Restart LanmanWorkstation and LanmanServer services to apply changes
Restart-Service -Name "LanmanWorkstation" -Force
Restart-Service -Name "LanmanServer" -Force

# Check the values to verify that SMB signing is disabled
$clientRequireSecuritySignature = Get-ItemProperty -Path $clientKeyPath -Name "RequireSecuritySignature"
$clientEnableSecuritySignature = Get-ItemProperty -Path $clientKeyPath -Name "EnableSecuritySignature"
$serverRequireSecuritySignature = Get-ItemProperty -Path $serverKeyPath -Name "RequireSecuritySignature"
$serverEnableSecuritySignature = Get-ItemProperty -Path $serverKeyPath -Name "EnableSecuritySignature"

# Output the results for verification
Write-Host "Client SMB Signing Settings Reverted:"
Write-Host "RequireSecuritySignature: $($clientRequireSecuritySignature.RequireSecuritySignature)"
Write-Host "EnableSecuritySignature: $($clientEnableSecuritySignature.EnableSecuritySignature)"
Write-Host "Server SMB Signing Settings Reverted:"
Write-Host "RequireSecuritySignature: $($serverRequireSecuritySignature.RequireSecuritySignature)"
Write-Host "EnableSecuritySignature: $($serverEnableSecuritySignature.EnableSecuritySignature)"

Write-Host "SMB signing has been successfully disabled on both client and server."
