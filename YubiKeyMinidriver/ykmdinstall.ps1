<#
.SYNOPSIS
    Installs YubiKey Minidriver (64-bit)

.NOTES
    File Name:  ykmdinstall.ps1
    Version:    0.0.1
    Author:     tldawson

.LINK
    https://github.com/tldawson/Intune-Win32-Apps
#>

$AppPath = "C:\Windows\syswow64\ykmd.dll"
# Abort if application already exists
if (Test-Path -Path $AppPath -PathType Leaf) {
    stop-process -ID $PID 
}
    

# Installer filename
$Installer = "YubiKey-Minidriver-4.1.1.210-x64.msi"

# Create new folder on C: Drive to host setup files
New-Item -ItemType Directory -Force -Path "C:\MDM\YubiKeyMinidriver" | Out-Null

# Copy $Installer to newly created folder
Copy-Item -Path "$PSScriptRoot\$Installer" -Destination "C:\MDM\YubiKeyMinidriver\$Installer"

# Install the application
msiexec.exe /qn /i "C:\MDM\YubiKeyMinidriver\$Installer" | Out-Null

# Remove the installer    
Remove-Item -Path "C:\MDM\YubiKeyMinidriver" -Recurse -Force -Confirm:$false

