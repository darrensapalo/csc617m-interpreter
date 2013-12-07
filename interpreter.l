%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
digit	[0-9]
letter	[A-Za-z]
%%
[0-9]+	{
	yylval = atoi(yytext);
	return INTEGER;
}

[-+*/\n]	return *yytext;

[ \t]	; /* skip whitespace */
[()]	;
%%

int yywrap(void){
    return 1;
}
