net user /add Staff Teeth731!
net localgroup "Remote Desktop Users" Staff /add
WMIC USERACCOUNT WHERE Name='Staff' SET PasswordExpires=FALSE
net user Staff /PasswordChg:No
