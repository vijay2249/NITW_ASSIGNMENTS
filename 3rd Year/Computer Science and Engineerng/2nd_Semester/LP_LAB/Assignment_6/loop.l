%{
	#include<stdio.h>
	#include "y.tab.h"
%}

digit [0-9]
alpha [a-zA-z]

%%

[ \t\n]			{;}
"for"				{return FOR;}
"break"			{return BREAK;}
"continue"	{return CONT;}
"if"				{return IF;}
"else"			{return ELSE;}
"||"				{return OR;}
"&&"				{return AND;}
">="				{return GE;}
"<="				{return LE;}
"!="				{return NE;}
"=="				{return EQ;}
"++"				{return INC;}
"--"				{return DEC;}
{digit}+		{return NUM;}
{alpha}({alpha}|{digit})*	{return ID;}
.						{return yytext[0];}

%%