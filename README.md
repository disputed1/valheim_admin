# valheim_admin
This is a collection of rewritten server scripts for steamcmd valheim. These scripts sidestep the systemd method for a more hands on approach allowing for backups of map files and autoupdating. works as of 2/10/2021 update 

Currently three main scripts 

1. start_server.sh
2. stop_server.sh 
3. restart_server.sh 

These have been rewritten to allow the process to run in the background, and to be safe TERMED with execution of new stop/restart script. 
The restart_server script is to reduce the utilization of memory over time, ensure proper patching and to backup our very important map files and can be scheduled hands free with cron 

1. create system user <br>
2. add user to /etc/cron.d/cron.allow <br>
3. place scripts somewhere outside of the install path (they will be overwritten on steam update) and update location in restart script <br>
4. schedule your cronjob on the service user for restart_script.sh EXAMPLE: <br>
    0 4 * * * /var/www/gameservers/valheim/restart_server.sh >> /var/www/html/downloads/valheimserver.log <br>
 
