net user /add DDS1 Aries2025!

net localgroup Administrators DDS1 /add

net localgroup "Remote Desktop Users" DDS1 /add

WMIC USERACCOUNT WHERE “Name='DDS1'” SET PasswordExpires=FALSE

Net user DDS1 /Passwordchg:No