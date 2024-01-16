function New-Shortcut {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$TargetPath,                # the path to the executable
        # the rest is all optional
        [string]$ShortcutPath = (Join-Path -Path ([Environment]::GetFolderPath("Desktop")) -ChildPath 'New Shortcut.lnk'),
        [string[]]$Arguments = $null,       # a string or string array holding the optional arguments.
        [string[]]$HotKey = $null,          # a string like "CTRL+SHIFT+F" or an array like 'CTRL','SHIFT','F'
        [string]$WorkingDirectory = $null,
        [string]$Description = $null,
        [string]$IconLocation = $null,      # a string like "notepad.exe, 0"
        [ValidateSet('Default','Maximized','Minimized')]
        [string]$WindowStyle = 'Default',
        [switch]$RunAsAdmin
    )
    switch ($WindowStyle) {
        'Default'   { $style = 1; break }
        'Maximized' { $style = 3; break }
        'Minimized' { $style = 7 }
    }
    $WshShell = New-Object -ComObject WScript.Shell

    # create a new shortcut
    $shortcut             = $WshShell.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath  = $TargetPath
    $shortcut.WindowStyle = $style
    if ($Arguments)        { $shortcut.Arguments = $Arguments -join ' ' }
    if ($HotKey)           { $shortcut.Hotkey = ($HotKey -join '+').ToUpperInvariant() }
    if ($IconLocation)     { $shortcut.IconLocation = $IconLocation }
    if ($Description)      { $shortcut.Description = $Description }
    if ($WorkingDirectory) { $shortcut.WorkingDirectory = $WorkingDirectory }

    # save the link file
    $shortcut.Save()

    if ($RunAsAdmin) {
        # read the shortcut file we have just created as [byte[]]
        [byte[]]$bytes = [System.IO.File]::ReadAllBytes($ShortcutPath)
        # set bit 6 of byte 21 ON
        # ([math]::Pow(2,5) or 1 -shl 5 --> 32)
        # see https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-shllink/16cb4ca1-9339-4d0c-a68d-bf1d6cc0f943
        # page 13
        $bytes[21] = $bytes[21] -bor 32
        [System.IO.File]::WriteAllBytes($ShortcutPath, $bytes)
    }

    # clean up the COM objects
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($shortcut) | Out-Null
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($WshShell) | Out-Null
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
}


$chromePath = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe').'(Default)'
$props = @{
    'ShortcutPath' = Join-Path -Path ([Environment]::GetFolderPath("Desktop")) -ChildPath 'PDA Intranet.lnk'
    'TargetPath'   = $chromePath
    'Arguments'    = 'https://sites.google.com/pdaeservices.in/pdaintranet/home'
}

New-Shortcut @props