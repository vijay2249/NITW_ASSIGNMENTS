%{
  #include<stdio.h>
  int s=0;
%}

%%

zero      s+=0;
one       s+=1;
two       s+=2;
three     s+=3;
four      s+=4;
five      s+=5;
six       s+=6;
seven     s+=7;
eight     s+=8;
nine      s+=9;
ten       s+=10;
eleven    s+=11;
twelve    s+=12;
thirteen  s+=13;
fourteen  s+=14;
fifteen   s+=15;
sixteen   s+=16;
seventeen s+=17;
eighteen  s+=18;
nineteen  s+=19;
twenty    s+=20;
thirty    s+=30;
forty     s+=40;
fifty     s+=50;
sixty     s+=60;
seventy   s+=70;
eighty    s+=80;
ninety    s+=90;
hundred   s*=100;

[\n] {printf("%d\n", s);s=0;} 
. ;

%%
int main(){
  printf("Enter number in words: ")
  yylex();
  return 0;
}
