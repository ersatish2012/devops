username=$(echo $1 | cut -d"=" -f2)
pwd=$(echo $2 | cut -d"=" -f2)
host=$(echo $3 | cut -d"=" -f2)
port=$(echo $4 | cut -d"=" -f2)

sed -i.bak 's:${username}:'$username':; s:${pwd}:'$pwd':; s:${host}:'$host':; s:${port}:'$port':' web.xml
