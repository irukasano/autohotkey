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
; Alt+Shift+F はブラウザにそのキーを送る
; ==========================================================
;#+f::GoSub, SendKeyAs1
;
;SendKeyAs1:
;Process, Exist, chrome.exe
;If(ErrorLevel) {
;	pid = %ErrorLevel%
;	WinActivate, ahk_pid %pid%
;    Send, !+f
;}
;
;Return

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

;; This will probably not act as intended if you have more than one ConEmu64 process running
FocusOrStartExcel:
If WinExist("ahk_exe Excel.exe")
    WinActivate
Else
    Run,"C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE"
Return



; ==========================================================
; Ctrl+Alt+R で acrobatReaderDC をアクティヴにする
; ==========================================================
^!r::GoSub, FocusAcrobatReader

;; This will probably not act as intended if you have more than one ConEmu64 process running
FocusAcrobatReader:
If WinExist("ahk_exe AcroRd32.exe")
    WinActivate
Return

; ==========================================================
; Ctrl+Alt+T で ConEmu をアクティヴにする
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
; Windows10で Win+Space での言語切替を無効にする
; ==========================================================
#Space::
