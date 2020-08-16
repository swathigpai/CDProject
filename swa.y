%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
extern int k,o,i;
extern int yylex();
extern int *yyin;
extern int yylineno;
%}

%token MAIN BR1 BR2 BR3 BR4 NUM INT FLOAT CHAR SC EQ GT IF NL K_BEGIN DO FOR_LOOP TO K_END 
K_RETURN ID OP K_ENDIF K_ENDFOR

%%
stmt:type MAIN BR1 BR2 NL K_BEGIN NL statements K_END NL{
    printf("\n\n.......Syntax analysed successfully.......\nCount:\n");
    printf("The number of keywords : %d\n",k);
    printf("The number of identifiers : %d\n",i);
    printf("The number of operators : %d\n",o);
    exit(0);}

    ;
type:INT|FLOAT|CHAR;
statements:statement NL statements|;
statement:declaration_statement SC|assignment_statement SC|return_statement|for_statement;

declaration_statement:type arr;
assignment_statement:type ID EQ arr|ID EQ arr;
for_statement:FOR_LOOP ID EQ opr TO ID OP opr DO NL stmt1 NL K_ENDFOR;
return_statement:K_RETURN BR1 ID BR2;

stmt1:IF arr EQ arr NL stmt1 K_ENDIF|IF arr GT arr NL stmt1 K_ENDIF|assignment_statement SC NL
     stmt1|
     ;
arr:opr|ID BR3 opr BR4;
opr:ID|NUM;
%%

int yyerror(char *s)
{
  fprintf(stderr,"\nline %d: %s\n",yylineno,s);
  exit(0);
}

int main(int argc,char *argv[])
{
if(argc!=2)
{
printf("\nInvalid input\n");
return 1;
}
yyin=fopen(argv[1],"r");
yyparse();
return 0;
}
