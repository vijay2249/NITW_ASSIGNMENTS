%{
	#include<stdio.h>
	#include<stdlib.h>
	void yyerror(char*);
%}

%token FOR ID NUM BREAK CONT OR AND LE GE EQ NE INC DEC IF ELSE
%start S
%right '='
%left OR AND
%left LE GE EQ '>' '<'
%left '!'

%%

S : E		{printf("Given For loop syntax is correct\n");}

E : FOR '(' VAR ';' COND ';' VAR ')' BODY

BODY	: ';'
				| '{' STMNT '}'
				| VAR ';'
				| E
				| BREAK ';'
				| CONT ';'
				| IF '(' COND ')' BODY  
				| IF '(' COND ')' BODY ELSE BODY

STMNT	:
				| VAR ';'
				| BREAK ';'
				| CONT ';'
				| E	
				| IF '(' COND ')' BODY  
				| IF '(' COND ')' BODY ELSE BODY
				| STMNT STMNT

COND	: 
				| VAR OR VAR
				| VAR AND VAR
				| VAR '>' VAR
				| VAR '<' VAR
				| VAR LE VAR
				| VAR GE VAR
				| VAR EQ VAR
				| VAR NE VAR

VAR	:
			| VAR INC
			| VAR DEC
			| VAR '+' VAR
			| VAR '-' VAR
			| VAR '*' VAR
			| VAR '/' VAR
			| VAR OR VAR
			| VAR AND VAR
			| VAR '>' VAR
			| VAR '<' VAR
			| VAR LE VAR
			| VAR GE VAR
			| VAR EQ VAR
			| VAR NE VAR
			| ID '=' VAR
			| ID
			| NUM

%%

void yyerror(char *s){
	printf(stderr, "Invalid Syntax!\n");
}

int main(void){
	extern FILE *yyin;
	yyin = fopen("input.txt","r");
	yyparse();
	return 0;
}
