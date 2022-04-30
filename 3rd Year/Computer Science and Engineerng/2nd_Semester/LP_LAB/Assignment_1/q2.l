%{
  #include<stdio.h>
  int l;
%}
%%
[^\n] {l++;}
%%

int main(){
  printf("Enter string: ");
  yylex();
  printf("length of string: %d\n", l);
  return 0;
}
