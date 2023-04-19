# 7-Zip for Intune  
  
Deploys the 7-Zip application as a Win32 app in Intune. First checks if 7-Zip is already installed.  
  
1. Go to the [7-Zip downloads page](https://www.7-zip.org/download.html).  
2. Download the 64-bit MSI installer.  
3. Put the MSI in a new folder alongside the 7zinstall.ps1 and 7zuninstall.ps1 scripts.  
4. Update the `$installer` variable in 7zinstall.ps1 with the MSI installer's filename.  
5. Begin Intune wrapping.  
  
## Intune WinAppUtil Setup  
  
 - Source Folder: Folder containing scripts and MSI installer  
 - Source File: 7zinstall.ps1  
  
## Intune Win32 Application Setup  
  
Program setup:  
  
- Install command: `powershell -ex bypass -file 7zinstall.ps1`  
- Uninstall command: `powershell -ex bypass -file 7zuninstall.ps1`  
  
Detection rules:  
  
- Rules format: Manually configure  
- Rule type: File  
- Path: C:\Program Files\7-Zip  
- File or folder: 7zFM.exe 
- Detection method: File or folder exists  
  
