%{
  int count=0;
%}

%%

[%\t]+ {}
auto | double | if | static | break | else | int | struct | case | enum | 
long | switch | char | extern | near |typedef | const | float | register |
union | unsigned | void | while | default {printf("keyword(%d): %s is a keyword\n",count++,yytext);}
[a-zA-Z]+ {printf("\"%s\" is not a keyword\n", yytext);}

%%

int main(){
  printf("Enter the keywords:\n");
  yylex();
}
