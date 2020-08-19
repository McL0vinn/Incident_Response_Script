$mytimestamp = Get-Date -Format "MMddyy-HHmmss"
$outputzip = "ir_diag_" + $mytimestamp

New-Item -ItemType directory -Path ${env:TEMP}\script
& ${env:WINDIR}\System32\netstat -abno > ${env:TEMP}\script\netstat.csv
Get-LocalUser | export-csv -path ${env:TEMP}\script\localuser.csv
Get-ScheduledTask | export-csv -path ${env:TEMP}\script\scheduledtask.csv
& ${env:WINDIR}\System32\tasklist /v > ${env:TEMP}\script\tasklist.txt
Get-Process | Sort-Object Id | export-csv -path ${env:TEMP}\script\process.csv
Get-Service | export-csv -path ${env:TEMP}\script\service.csv
Get-nettcpconnection | Sort-Object RemotePort | export-csv -path ${env:TEMP}\script\nettcpconnection.csv
get-filehash -path ${env:TEMP}\script\* > ${env:TEMP}\asdaf.txt
Get-ChildItem -Path ${env:TEMP}\script, ${env:TEMP}\asdaf.txt | Compress-Archive -DestinationPath ${env:USERPROFILE}\$outputzip -Force
Remove-Item ${env:TEMP}\script -Recurse
Remove-Item ${env:TEMP}\asdaf.txt -Recurse
ii ${env:USERPROFILE}\