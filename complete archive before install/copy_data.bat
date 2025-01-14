set UserName=YourUserName
set ComputerName=computer1
set Drive=f:

mkdir "%Drive%\%ComputerName%\Desktop"
robocopy "c:\Users\%UserName%\Desktop" "%Drive%\%ComputerName%\Desktop" /E /COPYALL /R:3 /W:5
mkdir "%Drive%\%ComputerName%\Downloads"
robocopy "c:\Users\%UserName%\Downloads" "%Drive%\%ComputerName%\Downloads" /E /COPYALL /R:3 /W:5
mkdir "%Drive%\%ComputerName%\Documents"
robocopy "c:\Users\%UserName%\Documents" "%Drive%\%ComputerName%\Documents" /E /COPYALL /R:3 /W:5
mkdir "%Drive%\%ComputerName%\Music"
robocopy "c:\Users\%UserName%\Music" "%Drive%\%ComputerName%\Music" /E /COPYALL /R:3 /W:5
mkdir "%Drive%\%ComputerName%\OneDrive"
robocopy "c:\Users\%UserName%\OneDrive" "%Drive%\%ComputerName%\OneDrive" /E /COPYALL /R:3 /W:5
mkdir "%Drive%\%ComputerName%\Pictures"
robocopy "c:\Users\%UserName%\Pictures" "%Drive%\%ComputerName%\Pictures" /E /COPYALL /R:3 /W:5
mkdir "%Drive%\%ComputerName%\Videos"
robocopy "c:\Users\%UserName%\Videos" "%Drive%\%ComputerName%\Videos" /E /COPYALL /R:3 /W:5

mkdir "%Drive%\%ComputerName%\Data"
robocopy "d:\" "%Drive%\%ComputerName%\Data" /E /COPYALL /R:3 /W:5
