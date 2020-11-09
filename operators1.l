%%
"+"     { printf("PLUS "); }
"-"     { printf("MINUS "); }
"*"     { printf("MULT "); }
"/"     { printf("DIV "); }
[0-9]+  { printf("%s ", yytext); }
.       { }
%%
