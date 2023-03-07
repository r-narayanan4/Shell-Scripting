#!/bin/bash
#difference between break and continue
#!/bin/bash
echo "starting for loop"
<< mycom
for each in $(seq 1 10)
do
  if [[ $each -gt 5 ]]
  then
	 break
  fi 
  echo "$each"
done
mycom

<< com
for each in $(seq 1 10)
do
  if [[ $each -ne 5 ]]
  then
     echo "$each"
  fi

done

com

for each in $(seq 1 10)
do
   if [[ $each -eq 5 ]]
   then
	   continue
   fi	 

   echo "$each"
done

echo "for loop is over"

