echo "Verify customer"
db2 "connect to CUSTDB"
db2 -x "select id,name from customers" |wc -l >> xx
read rows < xx
echo $rows
rm xx

echo "Verify accounts"
db2 -x "select id,accountNumber from accounts" |wc -l >> xx
read rows < xx
echo $rows
rm xx
