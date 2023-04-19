<#
    .SYNOPSIS
        Installs QuickBooks Enterprise 23

    .NOTES
        File Name: qbinstall.ps1
        Version: 0.0.5
        Author: tldawson

    .LINK
        https://github.com/tldawson/Intune-Win32-Apps/
#>

# Full path of the Quickbooks Enterprise 23.0 executable after installation.
$AppPath = "C:\Program Files\Intuit\QuickBooks Enterprise Solutions 23.0\QBW.EXE"

# Abort if application already exists
if (Test-Path -Path $AppPath -PathType Leaf) {
    stop-process -ID $PID
}


# Product and license numbers for this version of Quickbooks. (Change these!)
$ProductNum = "000-000"
$LicenseNum = "0000-0000-0000-000"

# URI of the QuickBooks installer (Change this if you want to install another version).
$InstallerURI = "https://dlm2.download.intuit.com/akdlm/SBD/QuickBooks/2023/Latest/QuickBooksEnterprise23.exe"


# Filename of the QuickBooks installer
$Installer = $InstallerURI.Substring($InstallerURI.LastIndexOf("/") + 1)

# Create new folder on C: Drive to host setup files
New-Item -ItemType Directory -Force -Path "C:\MDM\QuickBooks" | Out-Null

# Download the QuickBooks installer and save it in the new folder
Invoke-WebRequest -Uri $InstallerURI -OutFile "C:\MDM\QuickBooks\$Installer"

# Install the application
& C:\MDM\QuickBooks\$Installer -s -a QBMIGRATOR=1 MSICOMMAND=/s QB_PRODUCTNUM=$ProductNum QB_LICENSENUM=$LicenseNum | Out-Null

# Remove the installer
Remove-Item -Path "C:\MDM\QuickBooks" -Recurse -Force -Confirm:$false
