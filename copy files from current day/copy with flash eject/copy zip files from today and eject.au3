#include <File.au3>
#include <Date.au3>

;"Read settings from file"
$path = @ScriptDir & "\" & @ScriptName & " settings.txt"
$path = StringReplace($path, ".exe", "")

$from = FileReadLine($path, 1)
$whereToCopy = FileReadLine($path, 2)
$howManyArchiveFolders = FileReadLine($path, 3)

;Coping part
   ;Make folder with current date
   $folderName = @YEAR & @MON & @MDAY & "_" & @HOUR & @MIN
   DirCreate($whereToCopy)
   DirCreate($whereToCopy & "\" & $folderName)
      
   FileWrite($whereToCopy & "\" & $folderName & "\copyToday.bat", 'copy "' & $from & '\"*' & @YEAR & "_" & @MON & "_" & @MDAY & "*.zip")
 
   RunWait($whereToCopy & "\" & $folderName & "\copyToday.bat", $whereToCopy & "\" & $folderName & "\")
   
   ;Write current folder name
   FileWriteLine($whereToCopy & "\allFolders.txt", $folderName)
   Sleep(1000)
   FileDelete($whereToCopy & "\" & $folderName & "\copyToday.bat")

;Check and delete part
$Dir = _FileListToArray($whereToCopy,"*",2)
If @error Then 
   MsgBox(0, "Error", "_FileListToArray returned @error = " & @error)
ElseIf $Dir[0] > $howManyArchiveFolders Then
   $readedLine = FileReadLine($whereToCopy & "\allFolders.txt", 1)
   ;MsgBox(0, "Readed line ", @ScriptDir & "\" & $readedLine)
   
   $folderSize = DirGetSize($whereToCopy & "\" & $folderName)
   ;check if copy something
   if $folderSize > 10000000 Then
	  ;Delete folder
	  DirRemove($whereToCopy & "\" & $readedLine, 1)
	  
	  ;Delete folder name in file
	  $wholeFileReaded = FileRead($whereToCopy & "\allFolders.txt")
	  $wholeFileEdited = StringReplace($wholeFileReaded, $readedLine & @CRLF, "")
	  FileDelete($whereToCopy & "\allFolders.txt")
	  FileWrite($whereToCopy & "\allFolders.txt", $wholeFileEdited)
   Else
	  DirRemove($whereToCopy & "\" & $folderName, 1)
	  
	  ;Delete folder name in file
	  $wholeFileReaded = FileRead($whereToCopy & "\allFolders.txt")
	  $wholeFileEdited = StringReplace($wholeFileReaded, $folderName & @CRLF, "")
	  FileDelete($whereToCopy & "\allFolders.txt")
	  FileWrite($whereToCopy & "\allFolders.txt", $wholeFileEdited)
   EndIf
EndIf

Run(@ScriptDir & "\flash drive eject.exe")
