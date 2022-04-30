%{
  #include "y.tab.h"
  extern int yylval;  
%}

%%
[a-zA-Z0-9]*        {return ID;}
"#include "         {return INC;}
".h"                {return INCEND;}
"int main()"        {return MAINB;}
[<]                 {return OAB;}
[>]                 {return CAB;}
(if|while)" "\(.*\) {return COND;}
[{]((.|\n)*)[}]     {return BLK;}
[\n+] ;

%%

int yywrap(){
  return 1;
}