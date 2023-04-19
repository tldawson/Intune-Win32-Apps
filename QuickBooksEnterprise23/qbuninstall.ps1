<#
    .SYNOPSIS
        Uninstalls QuickBooks Enterprise 23

    .NOTES
        File Name: qbuninstall.ps1
        Version: 0.0.2
        Author: tldawson

    .LINK
        https://github.com/tldawson/Intune-Win32-Apps/
#>

# Major version number for QuickBooks 23.0
$MajorVersion = 33

# Get GUID for QuickBooks 23.0. Will match ANY QuickBooks edition (pro, premier, enterprise, etc.).
$AppGUID = (Get-WmiObject win32_product | where{$_.Name -contains "quickbooks" -and $_.Version -match "^$MajorVersion"}).IdentifyingNumber

# Uninstall the application. 
# You may need to add additional PROPERTY=VALUE statements for different versions.
msiexec /x $AppGUID REMOVE="all" ADDREMOVE=1 DOUNINSTALLSURVEY=0 INSTALLFLOW=3 /qn | Out-Null
