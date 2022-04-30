%{
	#include<stdio.h>
	#include<string>
	#include<stdlib.h>
	#include<iterator>
	#include<map>
	using namespace std;
	int yylex();
	int yyerror(char *s);
	map<string, bool> idt;
	void insertToMap(string str);
	bool ifPresent(string str);
	bool ifKeyword(string str);
%}

%union { char* str; }

%start S
%token TYPE SC NL
%token <str> ID

%%

S : stmts {}
stmts : stmt stmts | ;
stmt : TYPE f SC NL;
f : ID {
			string str($1); 
			if(ifKeyword(str)){
				printf("err: used keyword as var"); 
				exit(1);
			} 
			if(ifPresent(str)){
				printf("\n%s already declared."; str.c_str());
			}
			else insertToMap(str);
		};
 
%%

int yyerror(char* s) {
	printf("The declarations are not valid.\n %s", s);
	return 1;
}

int main(){
	extern FILE *yyin;
	yyin = fopen("code.cpp", "r");
	yyparse();
	return 0;
}

void insertToMap(string str){
	idt[str]=true;
}

bool ifPresent(string str){
	return idt[str];
}

bool ifKeyword(string str){
	string kw[5];
	kw[0]="main";
	kw[1]="int";
	kw[2]="double";
	kw[3]="bool";
	kw[4]="return";

	for (int i=0;i<5;i++){
		if (str==kw[i]) return true;
	}
	return false;
}