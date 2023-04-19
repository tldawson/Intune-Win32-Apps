<#
.SYNOPSIS
    Uninstalls 7zip

.NOTES
    File Name:  7zuninstall.ps1
    Version:    0.0.1
    Author:     tldawson

.LINK
    https://github.com/tldawson/Intune-Win32-Apps
#>

# If a previous version was installed, there are two ways to uninstall
if (Test-Path -Path "C:\Program Files\7-Zip\Uninstall.exe" -PathType Leaf) {
    # Uninstall 7zip through the uninstaller
    & "C:\Program Files\7-Zip\Uninstall.exe" /S
} else {
    # Uninstall 7zip through msiexec.exe
    $AppGUID = (Get-WmiObject win32_product | where{$_.Name -match "^7-Zip"}).IdentifyingNumber
    msiexec.exe /qn /x $AppGUID
}

