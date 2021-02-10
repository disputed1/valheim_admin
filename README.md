# valheim_admin
This is a collection of rewritten server scripts for steamcmd valheim 

Currently three main scripts 

1. start_server.sh
2. stop_server.sh 
3. restart_server.sh 

These have been rewritten to allow the process to run in the background, and to be safe TERMED with execution of new stop/restart script. 
The restart_server script is to reduce the utilization of memory over time, ensure proper patching and to backup our very important map files and can be scheduled hands free with cron 

The files to replace are located in your install directory for the steamcmd server. 
