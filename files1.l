/* This program will read multiple files and print their contents, one word per line. */

%option noyywrap yylineno

%{
#include "stdio.h"
%}

%%

\n
[a-zA-Z0-9]+  { printf("Line:%d, word:%s\n", yylineno, yytext); }
.

%%

int main(int argc, char **argv) {
    int index = 0;
    FILE *file_ptr;
    if (argc < 2) {
        yylex();
        return (0);
    }

    for (index = 1; index < argc; ++index) {
        file_ptr = fopen(argv[index], "r");
        if (!file_ptr) {
            printf("The file:%s is invalid.\n", argv[index]);
            continue;
        }

        yyrestart(file_ptr);
        yylineno = 1;
        yylex();
        fclose(file_ptr);
    }

    return (0);
}
