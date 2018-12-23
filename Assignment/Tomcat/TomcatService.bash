#!/bin/bash
#
# Name: Tomcat Service
# Description: start, stop, restart, and status of Tomcat Service
#

# Source function library.
. /etc/init.d/functions

prog=TomcatService

start() {
    echo -n $"Starting $prog: "
    daemon /opt/tomcat/apache-tomcat-8.5.35/bin/startup.sh
    ps ax | grep java | grep -i tomcat | awk '{print $1}' > /var/run/TomcatService/$prog.pid
    RETVAL=$?
    echo
    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/TomcatService/$prog
    return $RETVAL
}

stop() {
    echo -n $"Shutting down $prog: "
    killproc -p /var/run/TomcatService/$prog.pid
    RETVAL=$?
    echo
    [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/TomcatService/$prog
    return $RETVAL
}

status() {
    if [ -e /var/run/TomcatService/$prog.pid ]; then
        echo $prog \(pid `cat /var/run/TomcatService/$prog.pid`\) is running...
    else
        echo $prog is stopped
       exit 1
    fi
}

case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  status)
        status
        ;;
  restart)
        stop
        start
        ;;
   *)
        echo $"Usage: $0 {start|stop|status|restart}"
        exit 2
esac
