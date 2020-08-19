Incident Response Powershell script that when executed on a host extracts the below data and imports them into individual files :

 - netstat output (netstat.csv)
 - local users (localuser.csv)
 - scheduled tasks (scheduledtask.csv)
 - tasklist (tasklist.txt)
- Processes (process.csv)
- Services (service.csv)
- nettcpconnection output (nettcpconnection.csv)

The script will then generate a hash for every single  file to prevent tampering and save the output to the "asdaf" txt file.
The end result is a zipped folder that contains all the above mentioned individual files and can be found in the C:\Users\USERPROFILE folder.
The zip folder wil have a name like this -> ir_diag_080620-171223.zip where (080620 = month/day/year, 171223 = hour/minute/seconds).
When the script has finished running and the zip folder is created,windows explorer is instructed to open the path where is the output saved and presents it to the user

Good alternative to run on a system while waiting for an approved AV scan( or instead of a scan) which can reveal outbound traffic to CnC servers and the process that's creating it, established persistence by leveraging scheduled tasks, malicious user accounts etc.

- How to run it:

Download the script.

Open CMD.

Run the command " Powershell.exe -ExecutionPolicy Bypass path "

Replace the word path with the actual path where is the script stored on the machine , e.g Powershell.exe -ExecutionPolicy Bypass C:\Users\ir_diag_1.0.ps1

We use the command -Executionpolicy Bypass so that we can execute the powershell script on computer that has a locked down executionpolicy.
This command will execute the script  in a " Unrestricted " mode WITHOUT actually chaning the policy.
As the name implies ,it would only bypass whatever Executionpolicy you have set on your machine just to execute that specific script but wouldnt do any permanent changes.


- Latest version : 1.0 , Date 19-Aug-2020

All the code is in the ir_diag_1.0.ps1 script
