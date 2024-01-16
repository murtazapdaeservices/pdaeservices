Import-Module BitsTransfer
Start-BitsTransfer -Source 'https://raw.githubusercontent.com/murtazashikora/PDA-E-Services/Intranet_Shortcut/Test%20Shortcut.url' -Destination "C:\Test Shortcut.url"


Copy-Item -Path "C:\Test Shortcut.url" -Destination "C:\Users\Staff\Desktop\Test Shortcut.url"
Copy-Item -Path "C:\Test Shortcut.url" -Destination "C:\Users\DDS\Desktop\Test Shortcut.url"
