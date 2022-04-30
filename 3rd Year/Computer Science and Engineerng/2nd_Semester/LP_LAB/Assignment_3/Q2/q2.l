%{
  #include<stdio.h>
%}

%%

[+|-][0-9]+   { printf("%s it is a signed integer\n",yytext);}
[0-9]+        { printf("%s it is not a signed integer\n",yytext);}
[ \t]+ ;

%%

int main(){
  printf("Enter the integers\n");
  yylex();
  return 0;
}
