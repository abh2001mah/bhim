insert into CMS_ITEMIZATION_REQUESTS (category_id, product_id) values ('av_media', '');

insert into CMS_INDEXING_REQUESTS (category_id, product_id) values ('av_media', '');

insert into CMS_INDEXING_REQUESTS (category_id, product_id) (select 'av_media', product_id from CMS_INDEXING_FAILURES order by last_updated desc);

insert into CMS_ITEMIZATION_REQUESTS (category_id, product_id) (select 'av_media', product_id from CMS_ITEMIZATION_FAILURES order by last_updated desc);

select product_id from PRODUCT_AV_MEDIA order by product_id into outfile '/tmp/3aug.pids';

select category_id, product_id from CMS_INDEXING_FAILURES order by last_updated desc limit 0,50;

select category_id, product_id from CMS_INDEXING_FAILURES order by last_updated desc into outfile '/tmp/11aug.pids';

select failure_summary, last_updated from CMS_INDEXING_FAILURES order by last_updated desc limit 0,50;

select product_name, media_format, media_category, media_edition, language, release_year, product_id from PRODUCT_AV_MEDIA where product_id in ('');

select product_name, media_format, media_category, media_edition, language, release_year, product_id from PRODUCT_AV_MEDIA where product_id='';

select item_id, product_id from PRODUCT_ITEMS where product_id in ('','','');

select item_id, product_id from PRODUCT_ITEMS where product_id='';

select na.supplier_id, na.supplier_item_id from SUPPLIER_PRODUCT_NO_APPROX_MATCH_ISSUES na, SUPPLIER_PRODUCT_MATCH_ISSUES mi where mi.supplier_id=na.supplier_id and mi.supplier_item_id = na.supplier_item_id; 

select count(distinct product_id) from CMS_MERGE_REQUESTS;

select media_category, count(*) from PRODUCT_AV_MEDIA group by media_category;

select media_category, count(*) from PRODUCT_AV_MEDIA where brief_description is not null group by media_category;

select pam.media_category, count(*) from PRODUCT_AV_MEDIA pam, PRODUCT_STOCKS ps where pam.product_id=ps.product_id and ps.is_available=1 group by pam.media_category;

select pam.media_category, count(*) from SUPPLIER_EAV_TABLE seav, PRODUCT_AV_MEDIA pam where pam.product_id=seav.product_id and seav.attr_name='supplier_image' and seav.attr_value is not null group by pam.media_category;

select pam.media_category, ps.shipping_days, count(*) from PRODUCT_AV_MEDIA pam, PRODUCT_STOCKS ps where pam.product_id=ps.product_id and ps.is_available=1 and group by pam.media_category, ps.shipping_days;

select pam.media_category, count(*) from PRODUCT_EAV_TABLE peav, PRODUCT_AV_MEDIA pam where peav.product_id=pam.product_id and peav.attr_name='contributor' and peav.attr_qualifier is null group by pam.media_category;

select shipping_days, count(*) from PRODUCT_STOCKS where product_id like 'avm%' group by shipping_days;

select pam.media_category, ps.shipping_days , count(*) from PRODUCT_STOCKS ps, PRODUCT_AV_MEDIA pam where pam.product_id=ps.product_id group by pam.media_category , ps.shipping_days; 

select media_category, count(*) from PRODUCT_AV_MEDIA group by media_category;

select media_category, count(*) from PRODUCT_AV_MEDIA where brief_description is not null group by media_category;

select pam.media_category, ps.is_available, count(*) from PRODUCT_STOCKS ps, PRODUCT_AV_MEDIA pam where pam.product_id=ps.product_id group by pam.media_category, ps.is_available;

select pam.media_category, ps.is_available, count(*) from PRODUCT_STOCKS ps, PRODUCT_AV_MEDIA pam where pam.product_id=ps.product_id group by pam.media_category, ps.is_available;






