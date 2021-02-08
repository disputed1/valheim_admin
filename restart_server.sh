v=`pidof valheim*`
export v
startscript=/path/to/file/valheim/start_server.sh
log=/path/to/file/valheimserver.log
timestamp=`date "+%H:%M:%S-%Y%m%d"`

if [[ ! -z "$v"  ]];
  then
    echo $timestamp "PID found, executing restart" $v >> $log
    echo 1 > /path/to/file/valheim/server_exit.drp
    while [ -e /proc/$v ]
      do
        sleep .5
      done
    echo $timestamp "server PID no longer exists" >> $log
    $startscript
    if [[ -z "$v"  ]];
      v2=`pidof valheim*`
      then
        echo $timestamp "server start failed, reattempting" >> $log
        $startscript
        wait $v
        echo $timestamp "server start after restart completed" >> $log
      else
        echo $timestamp "server started successfully" >> $log
    fi
 else
    echo $timestamp "No server PID found, starting" >> $log
    $startscript
    wait $v
    echo $v
fi
