<#
.SYNOPSIS
    Sets registry items to disable FIDO security key login

.DESCRIPTION
    Script responsible for disabling FIDO security key logins on Intune managed devices.
    Sets the following registry values:
    HKLM:\SOFTWARE\Policies\Microsoft\FIDO - EnableFIDODeviceLogon 0x00000000
    HKLM:\SOFTWARE\Microsoft\Policies\PassportForWork\SecurityKey - UseSecurityKeyForSignin 0x00000000

.NOTES
    File Name:  skldisable.ps1
    Version:    0.0.1
    Author:     tldawson

.LINK
    https://github.com/tldawson/Intune-Win32-Apps
#>

$RegPath = "HKLM:\SOFTWARE\Microsoft\Policies\PassportForWork\SecurityKey"
$RegItem = "UseSecurityKeyForSignin"

Set-ItemProperty -path $RegPath -Name $RegItem -Value 0 -Type DWORD -Force -ErrorAction SilentlyContinue

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\FIDO"
$RegItem = "EnableFIDODeviceLogon"

Set-ItemProperty -path $RegPath -Name $RegItem -Value 0 -Type DWORD -Force -ErrorAction SilentlyContinue

