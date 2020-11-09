%{
enum yytokentype {
    NUMBER = 300,
    ADD = 301,
    SUB = 302,
    MUL = 303,
    DIV = 304
};

int yylval = 0;
%}

%%

"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
.       { }

%%

int main(int argc, char **argv) {
    int tok;
    while (tok = yylex()) {
        printf("Token: %d", tok);
        if (tok == NUMBER) {
            printf(", value: %d.", yylval);
        }
        printf("\n");
    }
}
