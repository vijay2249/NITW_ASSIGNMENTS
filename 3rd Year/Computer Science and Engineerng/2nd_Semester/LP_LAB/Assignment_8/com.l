%{
  #include <stdio.h>
  #include <stdlib.h>
  #include "y.tab.h"
  int cnt = 0;
%}

%%

#include[ ](<.*>)         {return HEADER;}
#define                   {return DEFINE;}
"using namespace std;"    {return STD;}
struct                    {return STRUCT;}
int                       {return INT;}
double                    {return DOUBLE;}
char                      {return CHAR;}
float                     {return FLOAT;}
void                      {return VOID;}
return                    {return RETURN;}
cout                      {return COUT;}
cin                       {return CIN;}
"<<"                      {return OUT;}
">>"                      {return IN;}
if                        {return IF;}
else                      {return ELSE;}
for                       {return FOR;}
while                     {return WHILE;}
printf                    {;}
\(                        {return yytext[0];}
\)                        {return yytext[0];}
\{                        {return yytext[0];}
\}                        {return yytext[0];}
\[                        {return yytext[0];}
\]                        {return yytext[0];}
\".*\"                    {return SENTINEL;}
[0-9]+                    {return DIGIT;}
"+"|"-"|"*"|"/"|"<"|">"|"<="|">="|"&"|"|"|"&&"|"||"|"^" {return OPERATOR;}
"="                       {return yytext[0];}
"++"|"--"                 {return UNOP;}
[a-zA-Z_][a-zA-Z0-9_]*    {return ID;}
[\n]                      {cnt++;}
;                         {return yytext[0];}
.                         {;}

%%
