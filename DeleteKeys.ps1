$ErrorActionPreference= 'silentlycontinue'
 
$SSFile = "c:\Windows\System32\PNQScreensaver.scr"
 
Remove-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveActive"
 
Remove-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaverIsSecure"
 
Remove-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveTimeOut"
 
Remove-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "SCRNSAVE.EXE"
 
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name ScreenSaveActive -Value 1 -PropertyType String
 
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name ScreenSaverIsSecure -Value 0 -PropertyType String
 
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name ScreenSaveTimeOut -Value 300 -PropertyType String
 
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name SCRNSAVE.EXE -Value $SSFile -PropertyType String
