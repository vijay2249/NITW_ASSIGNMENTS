%{
  #include<stdio.h>
%}

%token NUMBER
%left '+' '-'

%%

E : T { printf("Result = %d\n", $1); return 0; }

T :   T '+' T { $$ = $1 + $3; }
    | T '-' T { $$ = $1 - $3; }
    | '(' T ')' { $$ = $2; }
    | NUMBER { $$ = $1; }

%%

int main() {
  printf("Enter the expression\n");
  yyparse();
}

int yyerror(char* s) {
  printf("\nExpression is invalid\n");
}