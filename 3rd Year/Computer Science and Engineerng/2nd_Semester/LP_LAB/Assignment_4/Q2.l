%{
  #include<stdio.h>
  int key = 0, op = 0, id = 0;    
%}

%%

double|if|else|int|char|float|void|while|main|while|for|printf|return|begin|break|#include|stdio.h   {key++;}

[a-zA-Z][a-zA-Z0-9]*    { id++;}

"++"|"--"|"+"|"-"|"*"|"/"|"%"|"<"|">"|"<="|">="|"=="|"="    {op++;}

.   ;

%%

int main(){
  yylex();
  printf("Operators : %d\n",op);
  printf("Keywords : %d\n",key);
  printf("Identifires : %d\n",id);;
  return 0;
}