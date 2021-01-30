echo "client start"
echo $server_host
for i in 1 2 3 4 5
do
echo $i" request"
 curl $server_host/$i
 sleep 2
done

echo "5 requests are done"