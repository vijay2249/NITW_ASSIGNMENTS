%{
  #include <stdio.h>
  #include <stdlib.h>
	extern int yylex();
  void yyerror(char *msg){
    fprintf(stderr, "%s\n", msg);
    exit(1);
  }
%}

%token ID
%left '+' '-'
%left '*' '/'
%left UMINUS

%%

S : E 
E :   E'+' {A1();}T{A2();}
    | E'-' {A1();}T{A2();}
    | T ;

T :   T'*' {A1();}F{A2();}
    | T'/' {A1();}F{A2();}
    | F ;

F :   '('E {A2();}')'
    | '-'  {A1();}F{A2();}
    | ID   {A3();} ;

%%

#include "lex.yy.c"
char st[100];
int top=0;

int main(){
	printf("Infix expression: ");
	yyparse();
	printf("\n");
	return 0;
}

A1(){ st[top++]=yytext[0];}
A2(){ printf("%c", st[--top]);}
A3(){ printf("%c", yytext[0]);}