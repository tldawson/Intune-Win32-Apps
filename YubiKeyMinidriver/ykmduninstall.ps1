<#
.SYNOPSIS
    Uninstalls YubiKey Minidriver

.NOTES
    File Name:  ykmduninstall.ps1
    Version:    0.0.1
    Author:     tldawson

.LINK
    https://github.com/tldawson/Intune-Win32-Apps
#>

# Uninstall YubiKey Minidriver through msiexec.exe
$AppGUID = (Get-WmiObject win32_product | where{$_.Name -match "^YubiKey.*Minidriver"}).IdentifyingNumber
msiexec.exe /qn /x $AppGUID

