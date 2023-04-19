<#
.SYNOPSIS
    Installs 7zip

.NOTES
    File Name:  7zinstall.ps1
    Version:    0.0.1
    Author:     tldawson

.LINK
    https://github.com/tldawson/Intune-Win32-Apps
#>

$AppPath = "C:\Program Files\7-Zip\7zFM.exe"
# Abort if application already exists
if (Test-Path -Path $AppPath -PathType Leaf) {
    stop-process -ID $PID 
}
    
# Installer filename (You probably need to change this!)
$Installer = "7z2201-x64.msi"

# Create new folder on C: Drive to host setup files
New-Item -ItemType Directory -Force -Path "C:\MDM\7zip" | Out-Null

# Copy $Installer to newly created folder
Copy-Item -Path "$PSScriptRoot\$Installer" -Destination "C:\MDM\7zip\$Installer"

# Install the application
msiexec.exe /qn /i C:\MDM\7zip\$Installer | Out-Null

# Remove the installer    
Remove-Item -Path "C:\MDM\7zip" -Recurse -Force -Confirm:$false

