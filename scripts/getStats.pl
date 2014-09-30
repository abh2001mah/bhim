#!/usr/bin/perl -w
# expects numbers (1 per line in input)
# Prints the following stats:
# Count, Average, Median, 90th percentile, 95th percentile, Min, Max
#

use strict;

my @array;
my $sum;
my $count=0;

while(<STDIN>) {
  chomp;
  #print "Input is $_ \n";
  push(@array, $_);
  $sum += $_;
  $count++;
}

if($count > 0) {
  print "Statistics \n";
  @array = sort {$a <=> $b} @array;
  print "Count : $count \n";
  printf ("Min : %d \n", $array[0]); 
  printf ("Median : %0.1d \n", $array[int($count/2)]); 
  printf ("Average : %0.1d \n", $sum/$count);
  printf ("90th percentile : %d  \n", $array[int($count*0.9)] , int($count*0.9)); 
  printf ("95th percentile : %d  \n", $array[int($count*0.95)], int($count*0.95)); 
  printf ("99th percentile : %d  \n", $array[int($count*0.99)], int($count*0.99)); 
  printf ("Max : %d \n", $array[$count-1]); 
} else {
  print "No data\n";
}

