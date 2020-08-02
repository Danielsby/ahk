#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Custom shortcuts
#Persistent
SetCapsLockState, AlwaysOff

!e:: Send ^{Home}
!r:: Send !{F4}
!s::  Winset, Alwaysontop, , A
^l:: Send {Right}
^i:: Send {Up}
^j:: Send {Left}
^k:: Send {Down}
^e:: Send ^{End}

!q::
WinMinimize, A
return

; Multiple delete keybindings
~u & 2::
If !GetKeyState("Ctrl")
	Return
Send ^{BS}
Return

~u & 3::
If !GetKeyState("Ctrl")
	Return
Send ^{BS}^{BS}
Return

;^!u::Send {End}{Shift Down}{Up}{End}{Shift Up}{Backspace}

; Jump / mark shortcuts
; Left
~j & 2::   
if (GetKeyState("LAlt")) {
	Send ^{left}
}
if (GetKeyState("LCtrl")) {
	Send {left}
}
if (GetKeyState("LWin")) {
	Send +^{Left}
}
Return

~j & 3::   
if (GetKeyState("LAlt")) {
	Send ^{left}^{left}
}
if (GetKeyState("LCtrl")) {
	Send {left}{left}
}
if (GetKeyState("LWin")) {
	Send +^{Left}+^{Left}
}
Return

; Multiple jumps left
~j & 4::   
if (GetKeyState("LAlt")) {
	Send ^{left}^{left}^{left}
}
if (GetKeyState("LCtrl")) {
	Send {left}{left}{left}
}
if (GetKeyState("LWin")) {
	Send +^{Left}+^{Left}^{left}

}
Return

; Right
~l & 2::   
if (GetKeyState("LAlt")) {
	Send ^{right}
}
if (GetKeyState("LCtrl")) {
	Send {right}
}
if (GetKeyState("LWin")) {
	Send +^{right}
}
Return

~l & 3::   
if (GetKeyState("Alt")) {
	Send ^{right}^{right}
}
if (GetKeyState("Ctrl")) {
	Send {right}{right}
}
if (GetKeyState("LWin")) {
	Send +^{right}+^{right}
}
Return

~l & 4::   
if (GetKeyState("Alt")) {
	Send ^{right}^{right}^{right}
}
if (GetKeyState("Ctrl")) {
	Send {right}{right}{right}
}
if (GetKeyState("LWin")) {
	Send +^{right}+^{right}+^{right}
}
Return

; Up
~i & 2::   
if (GetKeyState("Ctrl")) {
	Send {up}
}
else {
	Send +{up}
}
Return

~i & 3::   
if (GetKeyState("Ctrl")) {
	Send {up}{up}
}
else {
	Send +{up}+{up}
}
Return

~i & 4::   
if (GetKeyState("Ctrl")) {
	Send {up}{up}{up}
}
else {
	Send +{up}+{up}+{up}
}
Return

; Down
~k & 2::   
if (GetKeyState("Ctrl")) {
	Send {down}
}
else {
	Send +{down}
}
Return

~k & 3::   
if (GetKeyState("Ctrl")) {
	Send {down}{down}
}
else {
	Send +{down}+{down}
}
Return


~k & 4::   
if (GetKeyState("Ctrl")) {
	Send {down}{down}{down}
}
else {
	Send +{down}+{down}+{down}
}
Return

~LAlt Up:: return

; Right side of keyboard
!l:: Send ^{Right}
!i:: Send !{Up}
!j:: Send ^{Left}
!k:: Send !{Down}
^p:: Send ^+{Del}	   
^o:: Send ^{Del}
^u:: Send ^{BS}
!u:: Send {Home}
!o:: Send {End}
#i:: Send +{Up}
#k:: Send +{Down}
#j:: Send +^{Left}
#l:: Send +^{Right}
#u:: Send +{Home}
#o:: Send +{End}

;Mousewheel
WheelRight::Send {Up}
WheelLeft::Send {Down}
^WheelDown::Send, ^{TAB}
^WheelUp::Send, ^+{TAB}
+WheelUp::Send, {PgUp}
+WheelDown::Send, {PgDn}
^#WheelUp::Send, ^#{Left}
^#WheelDown::Send, ^#{Right}
LAlt & WheelDown::AltTab
LAlt & WheelUp::ShiftAltTab

Capslock & j::Send +{left}
Capslock & l::Send +{right}
Capslock & i::Send +{up}
Capslock & k::Send +{down}

; Scrol tabs with intellij 
#MaxHotkeysPerInterval 10000

#IfWinActive ahk_class SunAwtFrame
 ~$WheelDown:: 
 ~$WheelUp:: 
    MouseGetPos,, yaxis 
    IfGreater,yaxis,110, Return 
    IfEqual,A_ThisHotkey,~$WheelDown, Send !{Right}
                                 Else Send !{Left}
Return 
#IfWinActive

