%{
int chars = 0;
int words = 0;
int lines = 0;
%}
%%
[a-zA-Z]+   { words++; chars += strlen(yytext); }
\n          { lines++; }
.           { chars++; }
%%
int main(int argc, char **argv) {
    yylex();
    printf("Chars:%d, Words:%d, Lines:%d.\n", chars, words, lines);
}
