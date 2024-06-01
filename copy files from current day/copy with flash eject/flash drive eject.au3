;Eject flash drive with powershell command
$driveLetter = StringLeft(@ScriptDir, 2)

Run("powershell")
WinWaitActive ("Windows PowerShell", "")
Sleep (1000)
AutoItSetOption ("SendKeyDelay", 30)
;(New-Object -comObject Shell.Application).Namespace(17).ParseName("O:").InvokeVerb("Eject")
;Send("(New-Object -comObject Shell.Application).Namespace(17).ParseName(" & Chr(34) & $driveLetter & Chr(34) & ").InvokeVerb(" & Chr(34) & "Eject" & Chr(34) & ")")

ClipPut("(New-Object -comObject Shell.Application).Namespace(17).ParseName(" & Chr(34) & $driveLetter & Chr(34) & ").InvokeVerb(" & Chr(34) & "Eject" & Chr(34) & ")")
AutoItSetOption ("MouseCoordMode", 0)
AutoItSetOption ("SendKeyDelay", 700)
MouseClick("Right", 100, 100, 1)
Send("{Enter}")
WinWaitActive("Microsoft Windows", "")
Send("c")

;Close powershell
;Send("exit")
;Send("{Enter}")
