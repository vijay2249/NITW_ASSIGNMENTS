%{
  #include<stdio.h>
  int v=0,c=0;
%}

%%

[AEIOUaeiou] {v++;}
[a-zA-Z] {c++;}

%%

int main(int argc, char** argv){
  printf("Enter string: ");
  yylex();
  printf("vowels: %d\n", v);
  printf("consonents: %d\n", c);
  return 0;
}
