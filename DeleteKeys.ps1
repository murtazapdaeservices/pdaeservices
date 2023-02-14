$ErrorActionPreference= 'silentlycontinue'
 
$SSFile = "${Env:SystemRoot}\PNQScreensaver.scr.scr"
 
Remove-ItemProperty -Path "HKEY_CURRENT_USER\Control Panel\Desktop" -Name "ScreenSaveActive"
 
Remove-ItemProperty -Path "HKEY_CURRENT_USER\Control Panel\Desktop" -Name "ScreenSaverIsSecure"
 
Remove-ItemProperty -Path "HKEY_CURRENT_USER\Control Panel\Desktop" -Name "ScreenSaveTimeOut"
 
Remove-ItemProperty -Path "HKEY_CURRENT_USER\Control Panel\Desktop" -Name "SCRNSAVE.EXE"
