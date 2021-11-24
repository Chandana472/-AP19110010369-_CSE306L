%{
#include<stdio.h>
#include<string.h>
%}

%token NUMBER
%token DECIMAL
%token STRING
%token IDENTIFIER
%token OP
%token DEF
%token PRINT
%token RETURN

%%

S: F { printf("correct");}
;

F: DEF N V { $$ = strcat(strcat($1,$2),$3); }
;

N: IDENTIFIER '(' P ')' { $$ = strcat(strcat($1,'('),strcat($3,')')); }
;

P :  {}
| STRING','P  { $$ = $1,$3; }
| NUMBER','P { $$ = $1,$3; }
| DECIMAL','P { $$ = $1,$3; }
| IDENTIFIER','P { $$ = $1,$3; }
| STRING { $$ = $1; }
| NUMBER { $$ = $1; }
| DECIMAL { $$ = $1; }
| IDENTIFIER { $$ = $1; }
;

V : PRINT '(' E ')' { $$ = strcat(strcat($1,'('),strcat($3,')')); }
| RETURN E { $$ = strcat($1,$2); }
;

E : IDENTIFIER { $$ = $1; }
| IDENTIFIER OP IDENTIFIER { $$ = strcat(strcat($1,$2),$3); }
;

%%

int main(){
yyparse();
}
int yywrap(){
return 1;
}
void yyerror(char *s){
printf("Error %s",s);
}