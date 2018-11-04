if [[ -e $1 ]]
then

        username=$(sed -n '/username=/p' $1 | sed 's/username=//')
        if [[ -n $username ]]
        then
                        pwd=$(sed -n '/pwd=/p' $1 | sed 's/pwd=//')
                        if [[ -n $pwd ]]
                        then
                                host=$(sed -n '/host=/p' $1 | sed 's/host=//')
                                if [[ -n $host ]]
                                then
                                                port=$(sed -n '/port=/p' $1 | sed 's/port=//')

                                                if [[ -n $port ]]
                                                then
                                                        sed -n 's/${username}/'$username'/; s/${pwd}/'$pwd'/; s/${host}/'$host'/; s/${port}/'$port'/;p' web.xml
                                                        # sed -i.bak 's/${username}/'$username'/; s/${pwd}/'$pwd'/; s/${host}/'$host'/; s/${port}/'$port'/;p' web.xml

                                                else
                                                        echo "Port Value is missing."
                                                fi
                                else
                                        echo "Host value is missing, Script cannot continue."
                                fi
                        else
                                echo "Password value missing. Script cannot continue."
                        fi
        else
                echo "Username Key Vaule missing. Script cannot continue."
        fi
else
        echo "Property file not exist"
fi

