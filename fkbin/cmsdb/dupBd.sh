#!/bin/bash
trim() { echo $1; }

db_name="cms"
groupDupPids="$1"
if [ "$1" = "" ]; then
	groupDupPids="/tmp/groupDupPids.txt"
fi
echo "Keep	ProductID	SupplierID	MRP	Title	Format	Media_Category	Media_Edition	Language	Release_Year"
exec<$groupDupPids
while IFS=',' read -ra pids; do
	for pid in "${pids[@]}"; do
		#echo "|$pid|"
		pid="$(trim $pid)"
		query="select 'N', pam.product_id, sp.supplier_id, sp.component_value, pam.product_name, pam.media_format, pam.media_category, pam.media_edition, pam.language, pam.release_year from PRODUCT_AV_MEDIA pam,  SUPPLIER_PRICING sp where pam.product_id='$pid' and sp.product_id='$pid' and sp.price_component='mrp';"
		mysql -N -uroot $db_name -e "$query"
	done
done


