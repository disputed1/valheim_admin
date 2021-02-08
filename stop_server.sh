#!/bin/bash
# Splitting this command off allows the server to run in the background, and be killed by executing this script

echo 1 > /var/www/gameservers/valheim/server_exit.drp
