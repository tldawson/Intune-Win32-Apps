<#
.SYNOPSIS
    Creates and sets registry items to enable FIDO security key login

.DESCRIPTION
    Script responsible for enabling FIDO security key logins on Intune managed devices.
    Sets the following registry values:
    HKLM:\SOFTWARE\Policies\Microsoft\FIDO - EnableFIDODeviceLogon 0x00000001
    HKLM:\SOFTWARE\Microsoft\Policies\PassportForWork\SecurityKey - UseSecurityKeyForSignin 0x00000001

.NOTES
    File Name:  sklenable.ps1
    Version:    0.0.1
    Author:     tldawson

.LINK
    https://github.com/tldawson/Intune-Win32-Apps
#>

$RegPath = "HKLM:\SOFTWARE\Microsoft\Policies\PassportForWork\SecurityKey"
$RegItem = "UseSecurityKeyForSignin"

# If $RegPath does not exist
if (-Not (Test-Path -Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}
Set-ItemProperty -path $RegPath -Name $RegItem -Value 1 -Type DWORD -Force

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\FIDO"
$RegItem = "EnableFIDODeviceLogon"

# If $RegPath does not exist
if (-Not (Test-Path -Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}
Set-ItemProperty -path $RegPath -Name $RegItem -Value 1 -Type DWORD -Force

