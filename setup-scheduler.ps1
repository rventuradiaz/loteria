#Requires -RunAsAdministrator

$action = New-ScheduledTaskAction `
    -Execute '"C:\Program Files\R\R-4.3.3\bin\x64\Rscript.exe"' `
    -Argument '"D:\Dropbox\R\projects\loteria\muestreo.R"' `
    -WorkingDirectory 'D:\Dropbox\R\projects\loteria'

$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At "12:00PM"

$settings = New-ScheduledTaskSettingsSet `
    -ExecutionTimeLimit (New-TimeSpan -Hours 2) `
    -StartWhenAvailable `
    -RunOnlyIfNetworkAvailable:$false

Register-ScheduledTask `
    -TaskName "Loteria_Muestreo_Weekly" `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -Description "Weekly lottery sampling analysis — runs muestreo.R every Sunday at noon" `
    -Force
