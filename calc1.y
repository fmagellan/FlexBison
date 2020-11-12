/* Simple version of a calculator */

%{
#include "stdio.h"

extern int yylex();
extern int yyparse();
extern FILE* yin;

void yyerror(char *s);

%}

/* Declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

calclist: /* empty */
    | calclist exp EOL { printf("Result:%d\n", $1);  }
    ;

exp: factor
    | exp ADD factor {
        $$ = $1 + $3;
        printf("$1:%d ADD $3:%d, Result:%d\n", $1, $3, $$);
    }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor: term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { $$ = $1 / $3; }
    ;

term: NUMBER
    | ABS term { $$ = $2 > 0? $2 : -$2; }
    ;

%%

int main(int argc, char **argv) {
    yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s.\n", s);
}
