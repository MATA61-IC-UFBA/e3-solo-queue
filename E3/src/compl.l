%option noyywrap yylineno
%{

// noyywrap    - no need to deal with multiple input files
// yylineno    - variable to track line numbers
//               that copies otherwise unmatched input to yyout.

#include "token.h"

%}

%%

[\n\t\r ]               { }
"//".*                  { }

\".*\"                  { return STR; }

'[a-zA-Z ]'             { return CHAR; }
'\\[n0\']'              { return CHAR; }

array                   { return ARRAY; }
boolean                 { return BOOLEAN; }
char                    { return KEY_CHAR; }
else                    { return ELSE; }
false                   { return FALSE; }
for                     { return FOR; }
function                { return FUNCTION; }
if                      { return IF; }
integer                 { return INTEGER; }
print                   { return PRINT; }
return                  { return RETURN; }
string                  { return STRING; }
true                    { return TRUE; }
void                    { return VOID; }
while                   { return WHILE; }

"!="                    { return NEQ; }
"&&"                    { return AND; }
"<="                    { return LEQ; }
"=="                    { return EQ; }
">="                    { return GEQ; }
"||"                    { return OR; }
[0-9]+                  { return NUM; }

[+\-*/%!<>=:;,()\[\]{}] { return yytext[0]; }

[a-zA-Z][a-zA-Z0-9]*    { return ID; }

.                       { return ERROR; }

%%
