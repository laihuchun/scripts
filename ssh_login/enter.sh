#!/bin/sh
echo "				pls input host code"
awk '{printf"%s %s\n",NR,$2}' host
echo "input: "
read r
sed -n "${r}p" host > ./tmp
export pararmeterno=`sed -n "${r}p" host |awk '{print NF}'`
export ip=`awk '{print $1}' ./tmp`
export port=`awk '{print $3}' ./tmp`
export pwd=`awk '{print $4}' ./tmp`
export user=`awk '{print $5}' ./tmp`
export cert=`awk '{print $6}' ./tmp`
export args_no=`awk '{print NF}' ./tmp`

if [ $args_no -eq 6 ]; then
./connect.exp ${ip} ${port} ${pwd} ${user}   ${cert};

elif [ $args_no -eq 5 ]; then
./connect.exp ${ip} ${port} ${pwd} ${user}  ; 
else echo "pls input correct number:     ";
fi 

