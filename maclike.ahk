#SingleInstance force

#UseHook ; I don't know so much, but this is said to be better.
#NoEnv   ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn    ; Enable warnings to assist with detecting common errors.

SendMode Input   ; Recommended for new scripts due to its superior speed and reliability.
SetBatchLines -1 ; Let's get no sleep on each execution.
ListLines Off    ; Don't record history.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GroupAdd, TerminalApps, ahk_exe WindowsTerminal.exe
GroupAdd, TerminalApps, ahk_exe Hyper.exe

kill_line(Wait) ; Wait: [ms] this value depends on your environment
{
  Send,{ShiftDown}{End}{ShiftUp}
  Sleep,Wait
  Send,^x
  Return
}

kill_back(Wait)
{
  Send,{ShiftDown}{Home}{ShiftUp}
  Sleep,Wait
  Send,^x
  Return
}

;; mac-like underscore
vkE2::_

;; mac-like desktop move
F13 &  Left::#^Left
F13 & Right::#^Right

;; IME toggle


;; shell-like key-bindings
F13 & f::Right     ; forward char
F13 & p::Up        ; previous line
F13 & n::Down      ; next line
F13 & b::left      ; backward char
F13 & a::Home      ; move beginning of line
F13 & e::End       ; move end of line
F13 & i::Tab       ; tab

F13 & d::Del ; delete char
F13 & h::BS  ; delete backward char
F13 & w::^BS ; delete backward word

F13 & k::kill_line(20) ; kill line
F13 & u::kill_back(20) ; kill line backward

F13 & y::^v ; yank
F13 & /::^z ; redo

F13 & m::Enter ; newline
F13 & g::Esc   ; emacs like quit (simply Esc)

;; ctrl compat
F13 & c::^c
F13 & l::^l
F13 & z::^z
F13 & x::^x
F13 & v::^v
F13 & Enter::^Enter
F13 & Space::^Space

;; Nothing to do
F13 & q::Return
F13 & r::Return
F13 & t::Return
F13 & s::Return
F13 & o::Return
F13 & j::Return 

F13::Return

;; IME operation
<+RShift::Send,{vk1Csc079}
>+LShift::Send,{vk1Dsc07B}

;; For terminal emulators
#IfWinActive ahk_group TerminalApps
F13 & a::^a
F13 & b::^b
F13 & c::^c
F13 & d::^d
F13 & e::^e
F13 & f::^f
F13 & g::^g
F13 & h::^h
F13 & i::^i
F13 & j::^j
F13 & k::^k
F13 & l::^l
F13 & m::^m
F13 & n::^n
F13 & o::^o
F13 & p::^p
F13 & q::^q
F13 & r::^r
F13 & s::^s
F13 & t::^t
F13 & u::^u
F13 & v::^v
F13 & w::^w
F13 & x::^x
F13 & y::^y
F13 & z::^z
#If
