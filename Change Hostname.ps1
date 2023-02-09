param ([string] $oldname, $newname)
Rename-Computer -ComputerName $oldname -NewName $newname -Restart
