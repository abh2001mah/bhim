#!/usr/bin/perl -w 

my $emailid = "vallies\@flipkart.com,pankajk\@flipkart.com,sachin\@flipkart.com,binny\@flipkart.com,mekin\@flipkart.com,amod\@flipkart.com";

#Getting yesterday's date
my ($mday,$mon,$year) = (localtime(time - 24*60*60))[3,4,5];
my $date = sprintf "%4d-%02d-%02d",$year+1900,$mon+1,$mday ;

my $subject = "Server Metrics for all Prod Webservers for $date ";

`mkdir -p /tmp/percentile`;

foreach my $host ( 1 .. 9 ) {
	 `rsync -az rsync://w3-web${host}:/fk-logs/w3/website/events*.$date /tmp/percentile/`;
	 `mv /tmp/percentile/events.log.$date /tmp/percentile/$host.events`;
}

my $body;
my ($total_percentile,$product_percentile,$search_percentile,$browse_percentile,$home_percentile) = percentile("events", 0);
$body .= qq{
Analysis for Events logs
++++++++++++++++++++++++

Non-Crawlers
++++++++++++

All requests
============
$total_percentile 

ProductPage
============
$product_percentile

Search
==========
$search_percentile

BrowsePage
==============
$browse_percentile

HomePage
=========
$home_percentile
};

my ($total_crawler_percentile,$product_crawler_percentile,$search_crawler_percentile,$browse_crawler_percentile,$home_crawler_percentile) = percentile("events", 1);
$body .= qq{
Crawlers
++++++++

All requests
============
$total_crawler_percentile 

ProductPage
============
$product_crawler_percentile

Search
==========
$search_crawler_percentile

BrowsePage
==============
$browse_crawler_percentile

HomePage
=========
$home_crawler_percentile
};

foreach my $host ( 1 .. 9 ) {
	`rm /tmp/percentile/$host.events`;
}

sendalert($body,$emailid,$subject);
insertIntoDB($total_percentile,$product_percentile,$search_percentile,$browse_percentile,$home_percentile,$total_crawler_percentile,
				$product_crawler_percentile,$search_crawler_percentile,$browse_crawler_percentile,$home_crawler_percentile);

sub percentile {
	my ($pattern,$isCrawler) = (@_); 
	my $total_percentile = check_percentile($pattern, " ", $isCrawler);
	my $product_percentile = check_percentile($pattern, "ProductPageController", $isCrawler);
	my $search_percentile = check_percentile($pattern, "SearchResultController", $isCrawler);
	my $browse_percentile = check_percentile($pattern, "BrowsePageController" ,$isCrawler);
	my $home_percentile = check_percentile($pattern, "HomePageController", $isCrawler);
	return ($total_percentile, $product_percentile, $search_percentile, $browse_percentile, $home_percentile);
}

sub check_percentile {
	my ($pattern,$event,$isCrawler) = (@_); 
	my $crawler = 'grep -v "iscrawler"';
	if($isCrawler) {
		$crawler = 'grep "iscrawler=1"';
	}
	my $result = `cat /tmp/percentile/*$pattern|grep "url="|grep "tt="|grep "$event"|$crawler|perl -n -e 'print "\$1\n" if / tt=([0-9]+)/'|perl /usr/share/fk-w3-crons/scripts/metrics/getStats.pl`;
	return $result;	
}
sub sendalert
{
	my ($string,$to,$subject) = (@_);
	print "alerting $to...\n";
	open(MAIL, "|/usr/sbin/sendmail -t");
	print MAIL "To: $to\n";
	print MAIL "Subject: $subject\n\n";
	print MAIL "$string";
	close(MAIL);
}

sub insertIntoDB{
	my ($total_percentile,$product_percentile,$search_percentile,$browse_percentile,$home_percentile,$total_crawler_percentile,
		$product_crawler_percentile,$search_crawler_percentile,$browse_crawler_percentile,$home_crawler_percentile) = (@_);

	@percentile_data=split(/:/,$total_percentile);
	@percentile_product=split(/:/,$product_percentile);
	@percentile_search=split(/:/,$search_percentile);
	@percentile_browser=split(/:/,$browse_percentile);
	@percentile_home=split(/:/,$home_percentile);

	@percentile_crawler_data=split(/:/,$total_crawler_percentile);
	@percentile_crawler_product=split(/:/,$product_crawler_percentile);
	@percentile_crawler_search=split(/:/,$search_crawler_percentile);
	@percentile_crawler_browser=split(/:/,$browse_crawler_percentile);
	@percentile_crawler_home=split(/:/,$home_crawler_percentile);
	
	@resultType=('Overall','ProductPage','Search','BrowsePage','HomePage');
	@crawlerArray=(\@percentile_crawler_data,\@percentile_crawler_product,\@percentile_crawler_search,\@percentile_crawler_browser,\@percentile_crawler_home);
	@nonCrawlerArray=(\@percentile_data,\@percentile_product,\@percentile_search,\@percentile_browser,\@percentile_home);
	
	use DBI;
	my $dbhost=`echo -en "getConfig group=Global key=Main_DB_Host\n"| nc localhost 25002|tail -n1`;
	use Data::Dumper;
	
	
	my $dbh = DBI->connect("DBI:mysql:database=analytics:".$dbhost,"root");
	
	for ($count = 0; $count <= 4; $count++){ 
		my $query1 = "insert into PerformanceMetrics values('$date','$resultType[$count]','Yes','$crawlerArray[$count][1]','$crawlerArray[$count][2]','$crawlerArray[$count][3]','$crawlerArray[$count][4]','$crawlerArray[$count][5]','$crawlerArray[$count][6]','$crawlerArray[$count][7]','$crawlerArray[$count][8]')";
		$dbh->do($query1);
		my $query2 = "insert into PerformanceMetrics values('$date','$resultType[$count]','No','$nonCrawlerArray[$count][1]','$nonCrawlerArray[$count][2]','$nonCrawlerArray[$count][3]','$nonCrawlerArray[$count][4]','$nonCrawlerArray[$count][5]','$nonCrawlerArray[$count][6]','$nonCrawlerArray[$count][7]','$nonCrawlerArray[$count][8]')";
		$dbh->do($query2);
	}
	$dbh->disconnect;
}
