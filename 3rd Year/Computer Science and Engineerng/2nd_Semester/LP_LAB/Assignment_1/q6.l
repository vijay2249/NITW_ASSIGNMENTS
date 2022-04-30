%{
  #include<stdio.h>
  int c=0,l;
%}

%%

[a-zA-Z]+ {l=strlen(yytext);if(l>=3 && l<=5)c++;}
. {}

%%

int main(){
  printf("Enter data.\n");
  yylex();
  printf("Strings with 3-5 alphabets are: %d\n", c);
  return 0;
}
