; ==========================================================
; Alt + f8 で Alt + →、↑、エンター、Alt + ← をする
; ==========================================================
#IfWinActive,ahk_class CASCADIA_HOSTING_WINDOW_CLASS
!F8::
Send !{Right}
Send {Up}
Send {Enter}
Send !{Left}
Return
#IfWinActive


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
; Ctrl+Alt+C で chrome をアクティヴにする
; ==========================================================
^!c::GoSub, FocusOrStartChrome

FocusOrStartChrome:
If WinExist("ahk_exe chrome.exe")
    WinActivate
Else
    Run,C:\Programs\chromium\chrome.exe
Return

; ==========================================================
; Ctrl+Alt+e で Excel をアクティヴにする
; ==========================================================
^!e::GoSub, FocusOrStartExcel

FocusOrStartExcel:
If WinExist("ahk_exe Excel.exe")
    WinActivate
Else
    Run,"C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE"
Return

; ==========================================================
; Ctrl+Alt+k で KeepassXC をアクティヴにする
; ==========================================================
^!k::GoSub, FocusOrStartKeepassxc

FocusOrStartKeepassxc:
If WinExist("ahk_exe KeePassXC.exe")
    WinActivate
Else
    Run,C:\Program Files\KeePassXC\KeePassXC.exe
Return

; ==========================================================
; Ctrl+Alt+W で Windows Terminal をアクティヴにする
; ==========================================================
^!w::GoSub, FocusOrStartWt

;; This will probably not act as intended if you have more than one wt process running
FocusOrStartWt:
If WinExist("ahk_class CASCADIA_HOSTING_WINDOW_CLASS"){
    WinActivate
}

Return


; ==========================================================
; Windows10で Win+Space での言語切替を無効にする
; ==========================================================
#Space::
