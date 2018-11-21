
start() {
  echo 'Starting service…' >&2
  sh /root/tomcat/apache-tomcat-8.5.35/bin/startup.sh
  echo 'Service started' >&2
}


stop() {
  kill -15 $(pidof java)
  echo 'Service stopped' >&2
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  retart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
esac
