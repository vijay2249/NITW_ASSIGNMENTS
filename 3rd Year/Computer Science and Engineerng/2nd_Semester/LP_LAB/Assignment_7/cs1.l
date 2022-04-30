%{
  #inlcude "y.tab.h"
%}

%%

"struct" {return STRUCT;}
\[     {return OSB;}
\]     {return CSB;}
"("    {return OCB;}
")"    {return CCB;}
"{"    {return OB;}
"}"    {return CB;}
"*"    {return P;}
[0-9]+ {return NUM;}
"int"    {return INT;}
"float"  {return FLOAT;}
"char"   {return CHAR;}
"double" {return DOUBLE;}
"short"  {return SHORT;}
"long"   {return LONG;}
";"      {return SC;}
[a-zA-Z][a-zA-Z0-9]* {return VAR;}
[\t\n" "] {;}

%%

int yywrap(){
  return 1;
}
