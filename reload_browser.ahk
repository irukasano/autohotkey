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
;WinActivate ahk_id %original%
Return

; ==========================================================
; Ctrl+Alt+b で Biscuit をアクティヴにする
; ==========================================================
^!b::GoSub, FocusOrStartStation

;; This will probably not act as intended if you have more than one ConEmu64 process running
FocusOrStartStation:
If WinExist("ahk_exe Biscuit.exe")
    WinActivate
Else
    Run,C:\Users\sano\AppData\Local\Programs\biscuit\Biscuit.exe
Return


; ==========================================================
; Ctrl+Alt+a で AS/R をアクティヴにする
; ==========================================================
^!a::GoSub, FocusOrStartASR

;; This will probably not act as intended if you have more than one ConEmu64 process running
FocusOrStartASR:
If WinExist("ahk_exe Asr.exe")
    WinActivate
Else
    Run,C:\Programs\ASR\Asr.exe
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
; Ctrl+Alt+c で ConEmu をアクティヴにする
; cf) https://gist.github.com/bender-the-greatest/5ef4aabbc8f1de3d740dd01483b8110a
; ==========================================================
^!t::GoSub, FocusOrStartConEmu

;; This will probably not act as intended if you have more than one ConEmu64 process running
FocusOrStartConemu:
If WinExist("ahk_exe ConEmu64.exe")
    WinActivate
Else
    Run,%A_ProgramFiles%\ConEmu\ConEmu64.exe
Return



; ==========================================================
; Alt+Shift+F はブラウザにそのキーを送る
; ==========================================================
#+f::GoSub, SendKeyAs1

SendKeyAs1:
Process, Exist, chrome.exe
If(ErrorLevel) {
	pid = %ErrorLevel%
	WinActivate, ahk_pid %pid%
    Send, !+f
}

Return

; ==========================================================
; Windows10で Win+Space での言語切替を無効にする
; ==========================================================
#Space::
