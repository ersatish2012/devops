username=$(sed -n '1p' $1 | cut -d"=" -f2)
pwd=$(sed -n '2p' $1 | cut -d"=" -f2)
host=$(sed -n '3p' $1 | cut -d"=" -f2)
port=$(sed -n '4p' $1 | cut -d"=" -f2)

sed -i.bak 's:${username}:'$username':; s:${pwd}:'$pwd':; s:${host}:'$host':; s:${port}:'$port':' web.xml
