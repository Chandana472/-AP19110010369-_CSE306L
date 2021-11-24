%{
#include "function.tab.h"
%}

%%

def {yylval=yytext;
return DEF;
}

print {yylval=yytext;
return PRINT;
}

"return" {yylval=yytext;
return RETURN;
}

[0-9]* {yylval=atoi(yytext);
return NUMBER;
}

[0-9]\.[0-9] {yylval=atof(yytext);
return DECIMAL;
}

\'[a-zA-Z]*\' {yylval=yytext;
return STRING;
}

[a-zA-Z][a-zA-Z0-9]* {yylval=yytext;
return IDENTIFIER;
}

[+ | - | * | % | // | < | > | ==] {yylval=yytext;
return OP;
}

\n return 0;

. return yytext[0];

%%