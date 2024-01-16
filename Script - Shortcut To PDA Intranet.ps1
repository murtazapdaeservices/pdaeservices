Import-Module BitsTransfer
Start-BitsTransfer -Source 'https://raw.githubusercontent.com/murtazashikora/PDA-E-Services/Intranet_Shortcut/PDA%20Intranet.url' -Destination "C:\PDA Intranet.url"


Copy-Item -Path "C:\PDA Intranet.lnk" -Destination "C:\Users\Staff\Desktop\PDA Intranet.url"
Copy-Item -Path "C:\PDA Intranet.lnk" -Destination "C:\Users\DDS\Desktop\PDA Intranet.url"
