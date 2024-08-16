Start-BitsTransfer -Source 'https://github.com/murtazashikora/PDA-E-Services/blob/Wallpapers/PDA%202nd%20Year.jpg?raw=true
' -Destination c:\PNQ_Lockscreen.jpg


REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP /v LockScreenImagePath /t REG_SZ /d "c:\PNQ_Lockscreen.jpg" /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP /v LockScreenImageUrl /t REG_SZ /d "c:\PNQ_Lockscreen.jpg" /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP /v LockScreenImageStatus /t REG_DWORD /d 1 /f
icacls "C:\ProgramData\Microsoft\Windows\SystemData" /reset /t /c /l