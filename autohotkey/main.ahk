#SingleInstance force

#InstallKeybdHook
#UseHook
#NoEnv   ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn    ; Enable warnings to assist with detecting common errors.

SendMode Input   ; Recommended for new scripts due to its superior speed and reliability.
SetBatchLines -1 ; Let's get no sleep on each execution.
ListLines Off    ; Don't record history.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GroupAdd, TerminalApps, ahk_exe WindowsTerminal.exe
GroupAdd, TerminalApps, ahk_exe Hyper.exe

; (Kill)Wait: [ms] this value depends on your environment
global Wait := 10
global KillWait := 20

; Recommended physical key assignments (mac JIS keyboard)
; CapsLock / LControl (Left to A key) -> F13
; Muhenkan / Eisu                     -> F14
; Henkan   / Kana                     -> F15

#include include/maclike.ahk
#include include/thumbutil.ahk