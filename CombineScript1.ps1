$url = "https://github.com/murtazapdaeservices/pdaeservices/raw/main/PNQ%20Screensaver.scr"

$output = "C:\PNQScreensaver.scr"

Invoke-WebRequest -Uri $url -OutFile $output


Copy-Item -Path C:\PNQScreensaver.scr -Destination c:\Windows\System32\

reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v SCRNSAVE.EXE /t REG_SZ /d C:\Windows\system32\PNQScreensaver.scr /f

rundll32.exe user32.dll, UpdatePerUserSystemParameters
