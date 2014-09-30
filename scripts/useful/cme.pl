#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV;

#my $unsigned= hex('119c67');
#my $signed= $unsigned;
#print "$signed\n";
#if ($signed & 0x8000) {
#	$signed -= 0x10000
#}
#print "$signed\n";

my $psv = Text::CSV->new({ sep_char => '|' });
my $csv = Text::CSV->new({ sep_char => ',' });
my $key = lc($ARGV[0]) or die "key not provided\n";
my $columns = $ARGV[1] or die "columns number not provided\n";
my $files = $ARGV[2] or die "files not provided\n";
my $count = 0;
my @mycol = ();

sub exitIfNeeded {
#	if($count > 500) { die "count reached $count"; }
	if($count > 10) { die "count reached $count"; }
}

sub printLACFields {
	exitIfNeeded();
	my @dataArr = @{$_[0]};
	my @indexes = @{$_[1]};
	my $index = -1;
	my $lac = "";
	my $ci = "";
	foreach $index (@indexes) {
		$lac = hex(substr($dataArr[$index], 6, 4));
#		$ci  = hex(substr($dataArr[$index], 10, 4));
		print "$lac\t";
#		print "$ci";
#		print "$dataArr[$index]\t";
	}
#	print "\n";
	$count++;
}

sub printDateTimeFields {
	my @dataArr = @{$_[0]};
	my @indexes = @{$_[1]};
	my $index = -1;
	my $yy = "";
	my $dd = "";
	my $mm = "";
	foreach $index (@indexes) {
		$yy = hex(substr($dataArr[$index], 0, 2));
		$dd = hex(substr($dataArr[$index], 2, 2));
		$mm = hex(substr($dataArr[$index], 4, 2));
		print "$yy-$dd-$mm\t";
#		print "$ci";
#		print "$dataArr[$index]\t";
	}
	$count++;
}

sub printDifferentFields {
	exitIfNeeded();
	my @dataArr = @{$_[0]};
	my @indexes = @{$_[1]};
	my $field1 = $dataArr[$indexes[0]];
	my $field2 = $dataArr[$indexes[1]];
	if ($field1 !~ $field2) {
#		print "$count\t@dataArr\n";
		print "@dataArr\n";
	}
	$count++;
}

sub printFields {
	exitIfNeeded();
	my @dataArr = @{$_[0]};
	my @indexes = @{$_[1]};
	my $index = -1;
	foreach $index (@indexes) {
		print "$dataArr[$index]\t";
	}
#	print "\n";
	$count++;
}

sub parse {
	my @fields = ();
	my $parser = $_[0];
	my $data = $_[1];
	if($parser->parse($data)) {
		@fields = $parser->fields();
	}
	if(scalar @fields == 0) {
		die "parser failed, $data not provided";
	}
	return @fields;
}
my @cols = parse($csv, $columns);
#print "@cols\n";

sub processFile {
	my $file = $_[0];
	open(my $data, '<', $file) or die "Could not open '$file' $!\n";
	while (my $line = <$data>) {
		chomp $line;
		if (length($line) > 0) {
			if ($psv->parse($line)) {
				my @fields = $psv->fields();
				my $firstWord = lc($fields[0]);
				if ($firstWord =~ /$key$/) {
#					print "@cols\n";
#					print "@cols\t$fields[$cols[0]]\t$fields[$cols[1]]\n";
#					printFields (\@fields, \@cols);
					printDifferentFields (\@fields, \@cols);
#					@mycol = (5);
#					printFields (\@fields, \@mycol);
#					@mycol = (10,11);
#					printDateTimeFields (\@fields, \@mycol);
#					print "\t";
#					@mycol = (28);					
#					printLACFields (\@fields, \@mycol);
#					print "\n";
				}
			}
		}
	}
}

#for my $i (2 .. $#ARGV)
#{
	#print "$ARGV[$i]\n";
	#processFile($ARGV[$i]);
#}

sub processDir {
	my $dir = $_[0];
	print "processing $dir\n";
	opendir(DIR, $dir) or die "Could not open $dir $!\n";
	while (my $file = readdir(DIR)) {
		next unless (-d "$dir/$file");
		print "$file\n";
  }
  closedir(DIR);
}

my $mydir = $ARGV[0];
if(defined($mydir)) {
} else {
	$mydir = `pwd`;
}
#print "processing $mydir\n";
#processDir($mydir);

=begin comment
open(my $data, '<', $file) or die "Could not open '$file' $!\n";
while (my $line = <$data>) {
	chomp $line;
#	print $line;
	if (length($line) > 0) {
		if ($csv->parse($line)) {
      my @fields = $csv->fields();
#     print "$fields[0]";
			my $firstWord = lc($fields[0]);
#			print "$fields[0]\t";
			if ($firstWord =~ /$key$/) {
				my $latlon = substr($fields[$column], $offset);
				my $firstc = $fields[$column];
				my $lastc = $fields[$column+1];
#				if($firstc !~ /$lastc/) {
#				if($firstc =~ /$lastc/) {
#					print "$firstc\t$lastc\n";
#				}
#				print "$fields[0]\t$fields[$column]\n";
				print "$fields[$column]\n";
#				my $lat = substr($latlon, 0, $lllen);
#				my $lon = substr($latlon, $lllen);
#				my $var = $lat;
#				my $var = $lon;
#				my $var = $latlon;
#				my $var = $fields[$column];
#				print "$lat\n";
#				print "$lon\n";
#				print "$fields[$column]\t$var\n";
#				print "$fields[$column]\t$var\t$lat\t$lon\n";
#				my $decimal = hex($var)/30000.0;
#				my $degree = int($decimal/60);
#				my $min = $decimal % 60;
#				print "$fields[$column]\t$var\t$decimal\t$degree\t$min\n";
#				print "$decimal\n";
#				print "$degree\n";
#				print "$min\n";
#				my $char=substr($var,13,2); my $degree = hex($char); print "$char\n";
#				my $char=substr($var,0,1); my $min = hex($char); print "$char\t$min\n";
#				my $char=substr($var,0,1); my $sec = hex($char); print "$char\t$sec\n"
#				print "$lon\t$lat\n";
#				print "$lon\n";
#				print "$lat\n";
				$count++;
				if($count > 500) { last; }
#				if($count > 10) { last; }
#				sleep(1);
			}
			#last;
		} else {
      warn "Line could not be parsed: $line\n";
		}
	}
}
=end comment

