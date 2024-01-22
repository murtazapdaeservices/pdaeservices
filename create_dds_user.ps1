net user /add DDS Aries2025!

net localgroup Administrators DDS /add

net localgroup "Remote Desktop Users" DDS /add

WMIC USERACCOUNT WHERE “Name='DDS'” SET PasswordExpires=FALSE

Net user DDS /Passwordchg:No
