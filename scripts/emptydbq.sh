#!/bin/bash

db_name="cms"
cat="$1"
src="CMS_MERGE_REQUESTS" 
echo "$src($cat)" : `/usr/bin/mysql -uroot $db_name -e "delete from $src"`
src="CMS_MERGE_FAILURES" 
echo "$src($cat)" : `/usr/bin/mysql -uroot $db_name -e "delete from $src"`
src="CMS_INDEXING_REQUESTS" 
echo "$src($cat)" : `/usr/bin/mysql -uroot $db_name -e "delete from $src"`
src="CMS_INDEXING_FAILURES"
echo "$src($cat)" : `/usr/bin/mysql -uroot $db_name -e "delete from $src"`
src="CMS_ITEMIZATION_REQUESTS" 
echo "$src($cat)" : `/usr/bin/mysql -uroot $db_name -e "delete from $src"`
src="CMS_ITEMIZATION_FAILURES"
echo "$src($cat)" : `/usr/bin/mysql -uroot $db_name -e "delete from $src"`
src="CMS_COMPATIBILITY_REQUESTS" 
echo "$src($cat)" : `/usr/bin/mysql -uroot $db_name -e "delete from $src"`
src="CMS_COMPATIBILITY_FAILURES"
echo "$src($cat)" : `/usr/bin/mysql -uroot $db_name -e "delete from $src"`
src="CMS_FEED_QUEUE"
echo "$src($cat)" : `/usr/bin/mysql -uroot $db_name -e "delete from $src"`
src="CONTENT_ERRORS"
echo "$src($cat)" : `/usr/bin/mysql -uroot $db_name -e "delete from $src"`

#find $SOURCE -type d -empty -prune -exec rmdir --ignore-fail-on-non-empty -p \{\} \;
#find ./ -type f -print0 | xargs -0 cp -v --target-directory=../schome/uploads

#~/bhim/cmsdb/cr

