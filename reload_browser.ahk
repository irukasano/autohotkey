; ==========================================================
; Alt + b でアクティヴでないブラウザをF5する
; ==========================================================
!b::

; Save current window
WinGet, original, , A

; ---------------------------------------

; Refresh Firefox
Process, Exist, firefox.exe
    If(ErrorLevel) {
        WinActivate, ahk_pid %ErrorLevel%
        Send {F5}
    }

; Refresh Chrome
Process, Exist, chrome.exe
    If(ErrorLevel) {
        WinActivate, ahk_pid %ErrorLevel%
        Send {F5}
    }


; Refresh Internet Explorer
Process, Exist, iexplore.exe
    If(ErrorLevel) {
        WinActivate, ahk_pid %ErrorLevel%
        Send {F5}
    }

; ---------------------------------------

; Return to original window
WinActivate ahk_id %original%
Return

; ==========================================================
; Win+Alt+s で Station をアクティヴにする
; ==========================================================
#!s::

Process, Exist, station.exe
If(ErrorLevel) {
    WinActivate, ahk_pid %ErrorLevel%
}

Return

; Save current window
; WinGet, original, , A

; Input, tabNum, B L1 T2, {Esc}, 1,2,3,4,5,6,7,8,9
; IF ErrorLevel = Match
; {
; 	Process, Exist, station.exe
; 	If(ErrorLevel) {
;         WinActivate, ahk_pid %ErrorLevel%
;         Send ^%tabNum%
; 	}
; 
; }

; Return to original window
; WinActivate ahk_id %original%
; Return


; ==========================================================
; Win+Alt+c で ConEmu をアクティヴにする
; cf) https://gist.github.com/bender-the-greatest/5ef4aabbc8f1de3d740dd01483b8110a
; ==========================================================
#!c::GoSub, FocusOrStartConEmu

;; This will probably not act as intended if you have more than one ConEmu64 process running
FocusOrStartConemu:
If WinExist("ahk_exe ConEmu64.exe")
    WinActivate
Else
    Run,%A_ProgramFiles%\ConEmu\ConEmu64.exe
Return

; ==========================================================
; ConEmu の指定のタブの１つまえのコマンドを実行する(fish shell前提)
; Win+Alt+p + 1-9
; ==========================================================
; #!p::

; ?? どうやって現在のタブを取得して戻れるのか？

