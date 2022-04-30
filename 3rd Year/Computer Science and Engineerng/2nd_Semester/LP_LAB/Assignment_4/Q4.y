%{
	#include <stdio.h>
	#include <string.h>
	extern int yylex();
	void yyerror(char *msg){
    fprintf(stderr, "%s\n", msg);
    exit(1);
  }
	int chk, i,size = 0;	
%}

%union { char* f;}
%token <f> s
%type <f> E

%%

S : E {
    chk = 0;
    size = strlen($1) - 1;
    if(size%2==0){
      for (i = 0; i <= size/2; i++)
        if ($1[i] != $1[size-i]) chk = 1;	
      if (chk == 1) printf("Not palindrome!\n");
      else printf("Palindrome!\n");
    }
    else{
      for (i = 0; i < size/2; i++)
        if ($1[i] != $1[size-i]) chk = 1;
      if (chk == 1) printf("Not palindrome\n");
      else printf("palindrome\n");
    }
};

E : s {$$ = $1;} ;

%%

int main(){
  printf("Enter String: ");
	yyparse();
	return 0;
}