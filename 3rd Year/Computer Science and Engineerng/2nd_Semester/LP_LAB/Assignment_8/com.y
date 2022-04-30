%{
  #include <stdio.h>
  #include <string.h>   
  #include <stdlib.h>
  void yyerror(char *);
%}
  
%token HEADER DEFINE INT VOID ID RETURN IF ELSE DIGIT FOR WHILE
%token OPERATOR UNOP STD COUT CIN OUT IN SENTINEL STRUCT DOUBLE FLOAT CHAR

%%

S               : headers std define struct function {printf("Correct Syntax\n");}

headers         :
                | HEADER headers

struct          :
                | STRUCT identifier '{' declaration_s nested_struct '}' ';' struct
                | STRUCT identifier '{' declaration_s nested_struct '}' ID ';' struct

nested_struct   : 
                | STRUCT ID '{' declaration_s nested_struct '}' ';' nested_struct
	            | call_struct

call_struct     : STRUCT ID ID ';'  

declaration_s   :
                | var_decl declaration_s
                | arr_decl declaration_s

var_decl        : rettype identifier ';'

arr_decl        : rettype identifier '[' dig ']' ';'

std             : STD

define          : 
                | DEFINE define
function        : 
                | rettype identifier arguments '{' statements return dig ';' '}' function

return          : RETURN
arguments       : '('indi')'

indi            : 
                | indi1

indi1           : rettype identifier ',' indi1
                | rettype identifier

rettype         : INT
                | VOID
                | FLOAT
                | CHAR //{printf("CHAR\n");}
                | DOUBLE

statements      : 
                | conditional statements 
                | declaration statements
                | forloop statements 
                | whileloop statements 
                | assignment statements 
                | expr statements 
                | output statements
                | input statements
                | call_struct statements

input           : CIN input_stat //{printf("input taken\n");}

output          : COUT OUT SENTINEL ';'
                | COUT OUT identifier ';'

input_stat      :
                | IN identifier input_stat ';'

declaration     : rettype identifier ';'

conditional     : IF '(' expr ')' '{' statements '}' ELSE conditional
                | IF '(' expr ')' '{' statements '}' ELSE '{' statements '}'
        
forloop         : FOR '(' assignment_for ';' expr ';' assignment_for ')' '{' statements '}'
                | FOR '(' assignment_for ';' expr ';' expr ')' '{' statements '}'

whileloop       : WHILE '(' expr ')' '{' statements '}'

assignment_for  : 
                | rettype identifier '=' identifier
                | rettype identifier '=' dig
                | identifier '=' identifier
                | identifier '=' dig 
                | identifier '=' expr
                | expr 

assignment      : rettype identifier '=' identifier ';'
                | rettype identifier '=' dig ';'
                | identifier '=' identifier ';'
                | identifier '=' dig ';'
                | identifier '=' expr ';'
                | expr ';'

expr            : identifier operat identifier
                | identifier operat dig
                | identifier unoperat
                | identifier 

operat          : OPERATOR

unoperat        : UNOP

dig             : DIGIT

identifier      : ID

%%

void yyerror(char *s) {
  printf("Incorrect Syntax\n");        
}

int main(){
  printf("Taking input from Compiler.cpp\n");
  extern FILE *yyin;
  yyin = fopen("code.cpp","r");
  yyparse();
  return 0;
}