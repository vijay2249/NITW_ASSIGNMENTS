%{
  #include<stdio.h>
  int c=0;
  int snt = 0;
%}

%%

[//]    {c++;}
[/][*]  {snt=1;}
[*][/]  {snt=0;}
[\n+]   {if (snt==1)c++;}
. ;

%%

int yywrap(void){
  return 1;
}

int main(){
  extern FILE *yyin;
  yyin = fopen("code.cpp", "r");
  yylex();
  printf("Number of lines of comment %d", c);
}