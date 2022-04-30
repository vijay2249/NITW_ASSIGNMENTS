%{
  int pos=0, neg=0, posf=0, negf=0;
%}

%%

\+?[0-9]+ {pos++;printf("positive number");}
-[0-9]+ {neg++;printf("negatie number");}
\+?[0-9]*\.[0-9]+ {posf++;printf("positive fraction");}
-[0-9]*\.[0-9]+ {negf++;printf("negative fraction");}

%%

int main(){
  yylex();
  printf("total +ve num: %d\n", pos);
  printf("total -ve num: %d\n", neg);
  printf("total +ve fractions %d\n", posf);
  printf("total -ve fractions %d\n", negf);
  return 0;
}
