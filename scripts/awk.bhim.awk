awk '{print "insert into CMS_INDEXING_REQUESTS (category_id, product_id) values (\47av_media\47,\47"$1"\47);"}' tmp.pids
awk '{print "insert into CMS_ITEMIZATION_REQUESTS (category_id, product_id) values (\47av_media\47,\47"$1"\47);"}' tmp.pids
awk '{print "insert into CMS_ITEMIZATION_REQUESTS (category_id, product_id) values (\47"$1"\47,\47"$2"\47);"}' tmp.pids
awk '{print "insert into CMS_ITEMIZATION_REQUESTS (category_id, product_id) values (\47av_media\47,\47"$2"\47);"}' tmp.pids
