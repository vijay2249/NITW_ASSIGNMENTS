%{
  #include<stdio.h>
  #include<stdlib.h>
  extern FILE *yyin;
%}

%token STRUCT OSB CSB OCB CCB OB CB P NUM INT FLOAT DOUBLE SHORT LONG CHAR SC VAR 

%%

  S : E {printf("The Syntax of the Structure is correct \n");}
  E : D V SC ;
  D : STRUCT VAR L INT VAR SC | FLOAT VAR SC | DOUBLE VAR SC |CHAR VAR SC | LONG VAR SC | SHORT VAR SC |
  V : VAR OSB NUM CSB | VAR OCB NUM CCB |VAR; 
  L : OB L | D V SC L |CB;

%%
int main(){
  yyin =fopen("input.txt","r");
  yyparse();
}

void yyerror(){
  printf("The Syntax of the Structure is incorrect \n");
}
