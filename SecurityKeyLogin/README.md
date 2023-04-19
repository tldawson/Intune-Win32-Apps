# Security Key Login
  
Creates and sets registry values to enable the use of FIDO security keys for Windows login.  
  
When using a YubiKey on an Intune managed endpoint, sometimes a problem with the default configuration can cause the endpoint to recognize the key as a smartcard (Not supported with Intune/Azure AD) instead of a security key (Supported with Intune/Azure AD). This aims to fix that.  
  
## Intune WinAppUtil Setup  
  
 - Source Folder: Folder containing scripts
 - Source File: sklenable.ps1  
  
## Intune Win32 Application Setup  
  
Program setup:  
  
- Install command: `powershell -ex bypass -file sklenable.ps1`  
- Uninstall command: `powershell -ex bypass -file skldisable.ps1`  
  
Detection rules:  
  
- Rules format: Manually configure  
- Rule type: Registry
    - Path: HKLM:\SOFTWARE\Microsoft\Policies\PassportForWork\SecurityKey
    - Value name: UseSecurityKeyForSignin
    - Detection method: Integer Comparison
    - Operator: Equals
    - Value: 1
- Rule type: Registry
    - Path: HKLM:\SOFTWARE\Policies\Microsoft\FIDO
    - Value name: EnableFIDODeviceLogon
    - Detection method: Integer Comparison
    - Operator: Equals
    - Value: 1
  
