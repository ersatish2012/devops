files=($(find * -type f))
for item in ${files[@]}
do
  a=$(md5sum ${item} | awk '{ print $1 }' )
  for((b=0;b<${#files[@]};b++))
  do
        hash=$(md5sum ${files[${b}]} | awk '{print $1}')

        if [ "$a" = "$hash" ]
        then
                if [ "$item" != "${files[${b}]}" ]
                then
                 echo "$item is identical to ${files[${b}]}"
                fi
        fi
  done
done
