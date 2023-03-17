#NoTrayIcon
; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Not required as of v2 as SendInput is available.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.
#SingleInstance Force
 
WinWait("C:\Windows\system32\cmd.exe" , , 120)
WinActivate
SendInput "{n}"
SendInput "{Enter}"
SendInput "{n}"
SendInput "{Enter}"
Sleep(500)
SendInput "{Enter}"
