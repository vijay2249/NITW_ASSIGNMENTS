%{
  #include<stdio.h>
  #include<stdlib.h>
  extern FILE *yyin;
%}

%token STRUCT OSB CSB OCB CCB OB CB P NUM INT FLOAT DOUBLE SHORT LONG CHAR SC VAR 

%%

  S : E {printf("The Syntax of the Structure is correct \n");}
  E : D V SC ;
  D : STRUCT VAR L |INT VAR P | FLOAT VAR P | DOUBLE VAR P |CHAR VAR P | LONG VAR P | SHORT VAR P |
  V : VAR OSB NUM CSB | VAR; 
  L : OB L | D V SC L |CB;

%%

int main(){
  yyin =fopen("input.txt","r");
  yyparse();
}

void yyerror(){
  printf("The Syntax of the Structure is correct \n");
}
