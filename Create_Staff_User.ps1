net user /add Staff Teeth731!

net localgroup "Remote Desktop Users" Staff /add

WMIC USERACCOUNT WHERE “Name='Staff'” SET PasswordExpires=FALSE

Net user Staff /Passwordchg:No