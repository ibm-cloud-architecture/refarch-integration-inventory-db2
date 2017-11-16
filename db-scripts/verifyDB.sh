echo "Verify inventory"
db2 "connect to INVDB"
db2 -x "select id,name from items" |wc -l >> xx
read rows < xx
echo $rows
rm xx

echo "Verify suppliers"
db2 -x "select id,name from supplier" |wc -l >> xx
read rows < xx
echo $rows
rm xx
