$url = "https://github.com/murtazapdaeservices/pdaeservices/raw/main/PNQ%20Screensaver.scr"

$output = "C:\PNQScreensaver.scr"

Invoke-WebRequest -Uri $url -OutFile $output
