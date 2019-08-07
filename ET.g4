
grammar ET;

etFile : line+ EOF;
line : 
        cmdline 
        | natline ;
cmdline : WS? COMMAND TEXT  NEWLINE;
natline : WS? TEXT?  NEWLINE;


NEWLINE : '\r'?  '\n' ;
WS : [ \t]+ ;
TEXT   : ( ( '//' ~[_\n\r] ) | (~[ /\n\r] ) ) ~[\n\r]* ;
COMMAND : '//__ ' ;

