#!/bin/sh
# Note: I've written this using sh so it works in the busybox container too

# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" HUP INT QUIT KILL TERM

# start nginx in background
echo "startimg nginx"
/usr/sbin/service nginx start


echo "[hit ctrl-c to exit] or run 'docker stop <container>'"

# start the fcgi wrapper in the background for nginx to hit
echo "starting fcgiwrap 8999"
/usr/sbin/fcgiwrap -c 5 -s tcp:127.0.0.1:8999


# stop service and clean up here
echo "stopping nginx"
/usr/sbin/service nginx stop

echo "stopping fcgiwrap"
kill -9 `ps auxwww|grep fcgiwrap|grep -v grep|awk '{ print $2; }'`

echo "exited $0"
