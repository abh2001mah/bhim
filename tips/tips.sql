mysql autocomplete rescan/enable
	mysql>\#

generate CSV from sql prompt
SELECT order_id,product_name,qty
FROM orders
INTO OUTFILE '/tmp/orders.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'


