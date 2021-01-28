%{
	#include "y.tab.h"
	#define str_token(id) yylval.string = yytext; return id;
	int valid_multi_line_comment(const char*);
	extern void yyerror(const char*);
	extern int yyparse();
%}

%option noyywrap yylineno

%%
<<EOF>> return eof;
\( return lparen;
\) return rparen;
\[ return lbracket;
\] return rbracket;
\| return vline;
, return comma;
; return semicolon;
:- return horn;
\. return end_stmt;
\_ return wildcard;
is return math_evaluator;
= return unifier;
\\\+ return negation;
\^ return exponent;
\+ return add;
- return subtract;
\* return multiply;
\/ return divide;
\< return smaller;
\<= return smaller_eq;
> return greater;
>= return greater_eq;
! return cut;

[\n\t ' '] {} // newline, tab, whitespace

\%(.*?) {} // single-line comment

\*\/ yyerror("no matching open comment slash");

\/\*[^*]*\*+(?:[^/*][^*]*\*+)*\/ { // multi line comment
	if (!valid_multi_line_comment(yytext))
		yyerror("invalid multi-line comment");
}

[A-Z_][a-zA-Z0-9_]* str_token(variable)
[a-z_][a-zA-Z0-9_]* str_token(atom)
'[^'\n]*' str_token(atom)
\"[^\"\n]*\" str_token(t_string)
-?[0-9]+ {yylval.integer = atoi(yytext); return t_integer;}
-?[0-9]+\.([0-9]+) {yylval.decimal = atof(yytext); return t_floating;}

. {yyerror("unrecognized token");};
%%

int valid_multi_line_comment(const char* comment) {
	int left = 0, right = 0;
	for (int i = 0; i < strlen(comment) - 1; i++) {
		char c = comment[i], n = comment[i + 1];
		if (c == '/' && n == '*') left++;
		else if (c == '*' && n == '/') right++;
	}
	return left == right;
}

int main(int argc, char** argv) {
	if (argc != 2) {
		fprintf(stderr, "Wrong number of arguments to the tokenizer\n");
		return 1;
	}
	const char* input_file = argv[1];
	yyin = fopen(input_file, "r");
	if (yyin == NULL) {
		fprintf(stderr, "Unable to open the tokenizer's input file: %s\n", input_file);
		return 1;
	}
	yyparse();
	fclose(yyin);
}