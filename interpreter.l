%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
digit	[0-9]
letter	[A-Za-z]
%%
{letter}	{
		yylval = *yytext - 'a';
		return VARIABLE;
		}
{digit}+	{
		yylval = atoi(yytext);
		return INTEGER;
		}

[-+()=*/\n]	return *yytext;

[ \t]		; /* skip whitespace */
.		yyerror("Invalid character");
%%

int yywrap(void){
    return 1;
}
