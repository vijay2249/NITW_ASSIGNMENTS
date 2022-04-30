%{
  #include<stdio.h>
  int l=0, c=0, w=0;
%}

%%

\n {l++;}
[^\n] {c++;}
[0-9a-zA-Z]* {w++;c+=yyleng;}

%%

int main(){
  printf("Enter data.\n");
  yylex();
  printf("Total lines: %d\n", l);
  printf("Total chars: %d\n", c);
  printf("Total words: %d\n", w);
  return 0;
}