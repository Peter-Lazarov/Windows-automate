;Eject flash drive with powershell command
$driveLetter = StringLeft(@ScriptDir, 2)

Run("powershell")
WinWaitActive ("Windows PowerShell", "")
Sleep (1000)
AutoItSetOption ("SendKeyDelay", 30)
;(New-Object -comObject Shell.Application).Namespace(17).ParseName("O:").InvokeVerb("Eject")
Send("(New-Object -comObject Shell.Application).Namespace(17).ParseName(" & Chr(34) & $driveLetter & Chr(34) & ").InvokeVerb(" & Chr(34) & "Eject" & Chr(34) & ")")
Send("{Enter}")
Sleep(2000)
Send("c")

;Close powershell
;Send("exit")
;Send("{Enter}")
