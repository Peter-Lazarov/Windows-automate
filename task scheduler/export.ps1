# Destination folder
$exportFolder = "D:\ExportedTasks"

# Create the folder if it doesn't exist
if (-not (Test-Path $exportFolder)) {
    New-Item -Path $exportFolder -ItemType Directory | Out-Null
}

# Get tasks explicitly owned by 'Peter' in the root folder only
$tasks = Get-ScheduledTask | Where-Object {
    $_.Principal.UserId -eq "Peter"
}

Write-Host "Tasks found: $($tasks.Count)"

foreach ($task in $tasks) {
    $taskName = $task.TaskName -replace '[\\/:*?"<>|]', '_'
    Write-Host "Exporting: $taskName"
    $xmlPath = Join-Path -Path $exportFolder -ChildPath "${taskName}_backup.xml"
    schtasks.exe /Query /TN "$($task.TaskPath)$($task.TaskName)" /XML > $xmlPath
}
