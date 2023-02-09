$pcname= ConvertFrom-StringData -StringData $args[0]
Rename-Computer -NewName $pcname -Restart
