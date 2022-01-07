; KeebMangler
; Copyright (C) 2021 Patrick McFarland <pmcfarland@adterrasperaspera.com>

; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see http://www.gnu.org/licenses/.

#NoEnv
#Warn
#SingleInstance force
#UseHook on

Sendmode Input
SetWorkingDir %A_ScriptDir%

global version := "1.1"

global ini_km := "keebmangler"
global ini_clh := "capslock_hyper"
global ini_raa := "ralt_altgr"
global ini_mac := "mac_swap"
global ini_xev := "xev"

global menu_km := "KeebMangler"
global menu_clh := "CapsLock " . Chr(129046) . " Hyper"
global menu_raa := "RAlt " . Chr(129046) . " AltGr"
global menu_mac := "Mac Swap"
global menu_xev := "Event Spy (xev)"

global enable_clh
global enable_raa
global enable_mac
global enable_xev

global config := A_AppData . "/" . ini_km . ".ini"

; Load init
if (!FileExist(config)) {
	FileAppend, "[%ini_km%]", %config%, CP0
}

IniRead, enable_clh, %config%, %ini_km%, %ini_clh%, %true%
IniRead, enable_raa, %config%, %ini_km%, %ini_raa%, %true%
IniRead, enable_mac, %config%, %ini_km%, %ini_mac%, %false%
IniRead, enable_xev, %config%, %ini_km%, %ini_xev%, %false%

; Menu
Menu, Tray, NoStandard
Menu, Tray, Icon, Shell32.dll, 174
Menu, Tray, Tip, %menu_km% %version% (AHK %A_AhkVersion%)

Menu, Tray, Add, %menu_clh%, handle_clh
Menu, Tray, Add, %menu_raa%, handle_raa
Menu, Tray, Add, %menu_mac%, handle_mac

Menu, Tray, Add,

Menu, Tray, Add, %menu_xev%, handle_xev

Menu, Tray, Add,

Menu, Tray, Add, Reload, handle_reload
Menu, Tray, Add, Exit, handle_exit

if(enable_clh)
	Menu, Tray, ToggleCheck, %menu_clh%

if(enable_raa)
	Menu, Tray, ToggleCheck, %menu_raa%

if(enable_mac)
	Menu, Tray, ToggleCheck, %menu_mac%

if(enable_xev) {
	Menu, Tray, ToggleCheck, %menu_xev%
	SetTimer, Xev_Tooltip, 17
}

handle_clh() {
	enable_clh := !enable_clh
	Menu, Tray, ToggleCheck, %menu_clh%
	IniWrite, %enable_clh%, %config%, %ini_km%, %ini_clh%
}

handle_raa() {
	enable_raa := !enable_raa
	Menu, Tray, ToggleCheck, %menu_raa%
	IniWrite, %enable_raa%, %config%, %ini_km%, %ini_raa%
}

handle_mac() {
	enable_mac := !enable_mac
	Menu, Tray, ToggleCheck, %menu_mac%
	IniWrite, %enable_mac%, %config%, %ini_km%, %ini_mac%
}

handle_xev() {
	enable_xev := !enable_xev
	Menu, Tray, ToggleCheck, %menu_xev%
	IniWrite, %enable_xev%, %config%, %ini_km%, %ini_xev%

	if(enable_xev)
		SetTimer, Xev_Tooltip, 17
	else
		SetTimer, Xev_Tooltip, Off
}

handle_reload() {
	Reload
}

handle_exit() {
	ExitApp
}

; Xev
Xev_Tooltip() {
	MouseGetPos, , , id, control
	WinGetTitle, title, ahk_id %id%
	WinGetClass, class, ahk_id %id%
	ControlGetFocus, ActiveWin, A

	pkeys := ""
	lkeys := ""

	Loop, 255 {
		key := GetKeyName(Format("vk{:x}", A_Index))

		if(key == "Shift" || key == "Alt" || key == "Control")
			continue

		if(GetKeyState(key, "p"))
			pkeys = %pkeys% %key%

		if(GetKeyState(key, ""))
			lkeys = %lkeys% %key%
	}

	if(pkeys or lkeys)
		Tooltip, physical: %pkeys%`nlogical: %lkeys%
	else
		Tooltip
}

; Maps
#if !enable_clh
SetCapsLockState Off
#if

#if enable_clh
SetCapsLockState AlwaysOff
*CapsLock::send {Blind}{LCtrl down}{LWin down}
*CapsLock Up::send {Blind}{LCtrl up}{LWin up}
#if

#if enable_mac
*LAlt::send {Blind}{LWin down}
*LAlt up::send {Blind}{LWin up}

*LWin::send {Blind}{LAlt down}
*LWin up::send {Blind}{LAlt up}

*RAlt::send {Blind}{AppsKey down}
*RAlt up::send {Blind}{AppsKey up}
#if

#if !enable_mac && enable_raa
*RAlt::send {Blind}{LCtrl down}{RAlt down}
*RAlt up::send {Blind}{LCtrl up}{RAlt up}
#if

#if enable_mac && !enable_raa
*RWin::send {Blind}{RAlt down}
*RWin up::send {Blind}{RAlt up}
#if

#if enable_mac && enable_raa
*RWin::send {Blind}{LCtrl down}{RAlt down}
*RWin up::send {Blind}{LCtrl up}{RAlt up}
#if

