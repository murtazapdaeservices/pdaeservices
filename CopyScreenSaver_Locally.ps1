$url = "https://github.com/murtazapdaeservices/pdaeservices/raw/main/PNQ%20Screensaver.scr"

$output = "C:\PNQ Screensaver.scr"

Invoke-WebRequest -Uri $url -OutFile $output
