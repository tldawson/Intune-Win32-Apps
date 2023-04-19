# QuickBooks Enterprise 23.0 for Intune  
  
Deploys the QuickBooks Enterprise 23.0 application as a Win32 app in Intune. First checks if QuickBooks is already installed.  
  
To prevent wasting bandwidth, this script only downloads the ~1GB installer when it needs to rather than every time the endpoint checks in with Intune.  
  
1. Edit the qbinstall.ps1 script and update the `$ProductNum` and `$LicenseNum` variables.  
    - If necessary, also update the `$InstallerURI` variable. [You can find download links for different versions here.](https://downloads.quickbooks.com/app/qbdt/products)
2. Begin Intune wrapping.  
  
## Intune WinAppUtil Setup  
  
 - Source Folder: Folder containing scripts
 - Source File: qbinstall.ps1  
  
## Intune Win32 Application Setup  
  
Program setup:  
  
- Install command: `powershell -ex bypass -file qbinstall.ps1`  
- Uninstall command: `powershell -ex bypass -file qbuninstall.ps1`  
  
Detection rules:  
  
- Rules format: Manually configure  
- Rule type: File  
- Path: C:\Program Files\Intuit\QuickBooks Enterprise Solutions 23.0  
- File or folder: QBW.exe  
- Detection method: File or folder exists  
  
## Configure For Different QuickBooks Versions  
  
1. Edit *qbinstall.ps1*:  
    - Update `$AppPath` variable. (Use table and replace \<YEAR> or \<VERSION> where applicable.)  

        Edition                 | Application Path  
        ------------------------|-----------------  
        Premier (32 bit)  | "C:\Program Files (x86)\Intuit\QuickBooks \<YEAR>\QBW32.EXE"  
        Enterprise (32 bit)     | "C:\Program Files (x86)\Intuit\QuickBooks Enterprise Solutions \<VERSION>\QBW32.EXE"  
        Premier (64 bit)  | "C:\Program Files\Intuit\QuickBooks \<YEAR>\QBW.EXE"  
        Enterprise (64 bit)     | "C:\Program Files\Intuit\QuickBooks Enterprise Solutions \<VERSION>\QBW.EXE"  
    - Update `$Installer` variable with new installer filename 
  
2. Edit *qbuninstall.ps1*:  
  
    - Update `$MajorVersion` variable. (Use table)
  
        QuickBooks Version  | Major Version  
        --------------------|--------------  
        Quickbooks 2023/23.0| 33  
        Quickbooks 2022/22.0| 32  
        Quickbooks 2021/21.0| 31  
        Quickbooks 2020/20.0| 30  
        Quickbooks 2019/19.0| 29  
        Quickbooks 2018/18.0| 28  
  
