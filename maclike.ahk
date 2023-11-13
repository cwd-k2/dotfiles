#SingleInstance force

#InstallKeybdHook
#UseHook ; I don't know so much, but this is said to be better.
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

; CapsLock / LControl (Left to A key) -> F13
; Muhenkan / Eisu                     -> F14
; Henkan   / Kana                     -> F15

kill_line()
{
  Send,+{End}
  Sleep,KillWait
  Send,^x
  Sleep,Wait
  Return
}

kill_back()
{
  Send,+{Home}
  Sleep,KillWait
  Send,^x
  Sleep,Wait
  Return
}

s_send(Key)
{
  Send,{Blind}%Key%
  Sleep,Wait
  Return
}

with_ctrl(Key)
{
  Send,{Blind}^%Key%
  Sleep,Wait
  Return
}

;; mac-like underscore
vkE2::_

;; mac-like desktop move
;F13 &  Left::#^Left
;F13 & Right::#^Right

;; IME toggle

;; shell-like key-bindings
F13 & f::s_send("{Right}") ; forward char
F13 & p::s_send("{Up}")    ; previous line
F13 & n::s_send("{Down}")  ; next line
F13 & b::s_send("{left}")  ; backward char
F13 & a::s_send("{Home}")  ; move beginning of line
F13 & e::s_send("{End}")   ; move end of line
F13 & i::s_send("{Tab}")   ; tab

F13 & d::s_send("{Del}")   ; delete char
F13 & h::s_send("{BS}")    ; delete backward char
F13 & w::with_ctrl("{BS}") ; delete backward word

F13 & k::kill_line() ; kill line
F13 & u::kill_back() ; kill line backward

F13 & y::with_ctrl("v") ; yank
F13 & /::with_ctrl("z") ; redo

F13 & m::s_send("{Enter}") ; newline
F13 & g::s_send("{Esc}")   ; emacs like quit (simply Esc)

;; ctrl compat
F13 & c::with_ctrl("c")
F13 & l::with_ctrl("l")
F13 & z::with_ctrl("z")
F13 & x::with_ctrl("x")
F13 & v::with_ctrl("v")
F13 & j::with_ctrl("j")
F13 & Enter::with_ctrl("{Enter}")
F13 & Space::with_ctrl("{Space}")

;; Nothing to do
;F13 & q::Return
;F13 & r::Return
;F13 & t::Return
;F13 & s::Return
;F13 & o::Return
;F13::Return

;; IME operation and Thumb Shift
F14::
  Send,{Blind}{LShift Down}
  KeyWait,F14
  if (A_PriorKey = "F14" and A_TimeSinceThisHotkey < 200)
  {
    Send,{vk1Dsc07B}
  }
  Send,{LShift Up}
  Return
F15::
  Send,{Blind}{LShift Down}
  KeyWait,F15
  if (A_PriorKey = "F15" and A_TimeSinceThisHotkey < 200)
  {
    Send,{vk1Csc079}
  }
  Send,{LShift Up}
  Return

;; For terminal emulators
#IfWinActive ahk_group TerminalApps
F13 & a::with_ctrl("a")
F13 & b::with_ctrl("b")
F13 & c::with_ctrl("c")
F13 & d::with_ctrl("d")
F13 & e::with_ctrl("e")
F13 & f::with_ctrl("f")
F13 & g::with_ctrl("g")
F13 & h::with_ctrl("h")
F13 & i::with_ctrl("i")
F13 & j::with_ctrl("j")
F13 & k::with_ctrl("k")
F13 & l::with_ctrl("l")
F13 & m::with_ctrl("m")
F13 & n::with_ctrl("n")
F13 & o::with_ctrl("o")
F13 & p::with_ctrl("p")
F13 & q::with_ctrl("q")
F13 & r::with_ctrl("r")
F13 & s::with_ctrl("s")
F13 & t::with_ctrl("t")
F13 & u::with_ctrl("u")
F13 & v::with_ctrl("v")
F13 & w::with_ctrl("w")
F13 & x::with_ctrl("x")
F13 & y::with_ctrl("y")
F13 & z::with_ctrl("z")
#If
