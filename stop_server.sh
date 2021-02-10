#!/bin/bash

v=`pidof valheim*`

##Depreciated 02-09-21
##echo 1 > /var/www/gameservers/valheim/server_exit.drp

kill -2 $v
