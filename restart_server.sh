#!/bin/bash

## useful commands
# ~/steamcmd +login anonymous +force_install_dir /var/www/gameservers/valheim/ +app_update 896660 validate +exit
# echo 1 > /var/www/gameservers/valheim/server_exit.drp

v=$(pidof valheim*)
worldfiles=/home/steamuser/.config/unity3d/IronGate/Valheim/worlds
startscript=/var/www/gameservers/valheim/start_server.sh
log=/var/www/html/downloads/valheimserver.log
timestamp=`date "+%H:%M:%S-%Y%m%d"`

if [[ ! -z "$v"  ]];
  then
    echo $timestamp "PID found, executing restart" $v
    kill -2 $v
    while [ -e /proc/$v ]
      do
        sleep .5
      done
    echo $timestamp "server PID no longer exists"
    zip -r /var/www/gameservers/backup/$timestamp'_worldname'.zip /home/steamuser/.config/unity3d/IronGate/Valheim/worlds;
    if [[ $? -eq 0 ]];
      then
        echo $timestamp "world backup completed"
      else
    echo $timestamp "world file backup failed"
    exit 1
fi
    /home/steamuser/.steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /var/www/gameservers/valheim/ +app_update 896660 validate +exit;
    cp -pv /var/www/gameservers/backup/start_server.sh /var/www/gameservers/valheim/;
    cp -pv /var/www/gameservers/backup/stop_server.sh /var/www/gameservers/valheim/;
    cp -pv /var/www/gameservers/backup/restart_server.sh /var/www/gameservers/valheim/;
    echo $timestamp "update completed / custom files copied"
    $startscript
    if [[ ! $? -eq 0  ]];
      then
        echo $timestamp "server start failed, reattempting"
        $startscript
        wait $?
        echo $timestamp "server start after restart completed"
      else
        echo $timestamp "server started successfully"
    fi
 else
    echo $timestamp "No server PID found, starting"
    $startscript
    wait $v
    echo $v
fi
