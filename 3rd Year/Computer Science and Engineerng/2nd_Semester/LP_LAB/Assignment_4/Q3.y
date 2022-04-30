%{
  #include <stdio.h>
  #include <stdlib.h>
  void yyerror(const char *c);
%}

%token ZERO ONE

%%

S   : E {printf("Accepted\n");} ;
E   : F | ZERO a | ONE b ;
a   : F a | ZERO ;
b   : F b | ONE ;
F   : ZERO | ONE ;

%%

int main(){
  printf("Enter Statement: ");
  yyparse();
  return 0;
}

void yyerror(const char *c) {
  printf("\nRejected\n");
}