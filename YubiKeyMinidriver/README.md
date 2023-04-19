# YubiKey Minidriver for Intune  
  
Deploys the YubiKey Minidriver as a Win32 app in Intune. First checks if YubiKey Minidriver is already installed.  
  
1. Go to the [YubiKey downloads page](https://www.yubico.com/support/download/smart-card-drivers-tools/).  
2. Download the 64-bit MSI installer.  
3. Put the MSI in a new folder alongside the ykmdinstall.ps1 and ykmduninstall.ps1 scripts.  
4. Update the `$installer` variable with the MSI installer's filename.  
5. Begin Intune wrapping.  
  
## Intune WinAppUtil Setup  
  
 - Source Folder: Folder containing scripts and MSI installer  
 - Source File: ykmdinstall.ps1  
  
## Intune Win32 Application Setup  
  
Program setup:  
  
- Install command: `powershell -ex bypass -file ykmdinstall.ps1`  
- Uninstall command: `powershell -ex bypass -file ykmduninstall.ps1`  
  
Detection rules:  
  
- Rules format: Manually configure  
- Rule type: File  
- Path: C:\Windows\syswow64  
- File or folder: ykmd.dll 
- Detection method: File or folder exists  
  
