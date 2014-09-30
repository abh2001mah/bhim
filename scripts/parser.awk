#!/usr/bin/awk -f
#usage parser th=? profilerfilename
BEGIN{print "\nLogger data filer" }{if ( $1 == "TotalTime" && $3 >= th ){print "----------------\n";print x;print y;print $0;}x=y;y=$0;}END{print "\n\nOk thats it!!"}
