#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 
WinWait, C:\Windows\system32\cmd.exe , , 120
WinActivate
Send {n}
Send {Enter}
Send {n}
Send {Enter}
Sleep, 500
Send {Enter}
