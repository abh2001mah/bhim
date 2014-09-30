Change "nick" to "fred" on current line				:s/nick/fred/
Capitalise every word in the entire file			:% s/\<./\u&/g
Insert ">" at the start of every line					:% s/^/>/
Insert "// nick" at the end of every line			:% s;$;// nick;
Go forwards a word														w
Go backwards a word														b
Go to start of line														0
Go to end of line															$
Go backwards/forwards a sentence							(	)
Insert at beginning of line										I
Insert at end of line (append)								A
Open (start) new line below cursor						o
Open (start) new line above cursor						O


Find lines containing "fruit" and change "apple" to "orange" on them								:g/fruit/s/apple/orange/g	
Delete all blank lines																															:g/^$/d
Find lines NOT containing "nick", append "oops" to them															:g! /nick/normal A oops

Word completion – forward											CTRL-x CTRL-n
Word completion – backward										CTRL-x CTRL-p
Line Completion																CTRL-x CTRL-l
File Name Completion													CTRL-x CTRL-f	


