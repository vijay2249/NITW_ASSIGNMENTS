%{
  #include<stdio.h>
  int s=0,c=0,sp=0;
%}

%%

[a-z] {s++;}
[A-Z] {c++;}
[^a-zA-Z0-9] {sp++;}
. {}

%%

int main(){
  printf("Enter data.\n");
  yylex();
  printf("small letters: %d\n", s);
  printf("capital letters: %d\n", c);
  printf("special letters: %d\n", sp-1);
  //the last input is \n which comes from enter tab
  //used to break input, hence this is not counted
  return 0;
}
