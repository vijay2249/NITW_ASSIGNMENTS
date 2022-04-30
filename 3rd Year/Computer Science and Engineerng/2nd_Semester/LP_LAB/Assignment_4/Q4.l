%{
	#include <stdio.h>
	#include "y.tab.h"
%}

%%

[a-zA-Z]+ {yylval.f = yytext; return s;}
[-+()*/] {return yytext[0];}
\n	 ;

%%

int yywrap(){
	return -1;
}
