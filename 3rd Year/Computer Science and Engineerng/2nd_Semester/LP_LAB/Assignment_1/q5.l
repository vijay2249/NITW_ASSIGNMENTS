%{
  #include<stdio.h>
  int flag=0;
%}

%%

[^a-zA-Z\n''] {flag=1;}

. {}

%%

int main(){
  printf("Enter data.\n");
  yylex();
  if(flag==0){printf("Alphabets");}
  if(flag){printf("non alphabets");}
  return 0;
}