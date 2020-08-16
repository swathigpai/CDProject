%{
#include<stdio.h>
#include "y.tab.h"
int k=0,i=0,o=0;
%}
%option yylineno

%%

"(" {return BR1;}
")" {return BR2;}
"[" {return BR3;}
"]" {return BR4;}

"main" {printf("\n%s is a keyword",yytext);k++;return MAIN;}
"begin" {printf("\n%s is a keyword",yytext);k++;return K_BEGIN;}

"do" {printf("\n%s is a keyword",yytext);k++;return DO;}
"for" {printf("\n%s is a keyword",yytext);k++;return FOR_LOOP;}
"to" {printf("\n%s is a keyword",yytext);k++;return TO;}
"if" {printf("\n%s is a keyword",yytext);k++;return IF;}
"end" {printf("\n%s is a keyword",yytext);k++;return K_END;}
"endif" {printf("\n%s is a keyword",yytext);k++;return K_ENDIF;}
"endfor" {printf("\n%s is a keyword",yytext);k++;return K_ENDFOR;}
"return" {printf("\n%s is a keyword",yytext);k++;return K_RETURN;}
"int" {printf("\n%s is a keyword",yytext);k++;return INT;}
"float" {printf("\n%s is a keyword",yytext);k++;return FLOAT;}
"char" {printf("\n%s is a keyword",yytext);k++; return CHAR;}

[0-9][0-9]* {return NUM;}
[a-zA-Z][a-zA-Z0-9_]* {printf("\n%s is an identifier",yytext);i++;return ID;}
"+"|"-"|"*"|"/" {printf("\n%s is an operator",yytext);o++;return OP;}
";" {return SC;}
"=" {printf("\n%s is an operator",yytext);o++;return EQ;}
">" {printf("\n%s is an operator",yytext);o++;return GT;}
"" {}
\n {return NL;}
. {;}
%%

int yywrap()
{
return 1;
}
