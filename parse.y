%{
	#include <stdio.h>
	#include <stdlib.h>
	extern void yyerror(const char*);
	extern int yylex(), yylineno;
	extern char* yytext;
%}

%union {
	int integer;
	float decimal;
	const char* string;
}

%start expr_seq

%token eof
%token lparen
%token rparen
%token lbracket
%token rbracket
%token vline
%token comma
%token semicolon
%token horn
%token end_stmt
%token wildcard
%token math_evaluator
%token unifier
%token negation
%token exponent
%token add
%token subtract
%token multiply
%token divide
%token smaller
%token smaller_eq
%token greater
%token greater_eq
%token cut
%token <string> variable
%token <string> atom
%token <string> t_string
%token <integer> t_integer
%token <decimal> t_floating

%left lparen rparen
%left add subtract
%left multiply divide
%left exponent

%right smaller smaller_eq greater greater_eq

%%
expr: decl_fact | atom end_stmt | decl_rule | atom horn rule_exprs;
expr_seq: expr | expr expr_seq | eof {return 0;}

list: lbracket list_seq rbracket;
list_seq: value | value vline value | value comma list_seq;

value:
	| atom
	| t_string
	| wildcard
	| structure
	| list
	| math_expr_low;

unification: value unifier value;
structure: atom lparen args rparen;
args: value | value comma args;

expr_in_functor:
	| unification
	| structure
	| negation expr_in_functor
	| cut
	| atom
	| eval_math
	| math_expr_low;

decl_fact: structure end_stmt;
decl_rule: structure horn rule_exprs;
expr_delim: comma | semicolon;
rule_exprs: expr_in_functor end_stmt | expr_in_functor expr_delim rule_exprs;

eval_math: math_expr_low math_evaluator math_expr_low;

prec_1: smaller | smaller_eq | greater | greater_eq;
prec_2: add | subtract;
prec_3: multiply | divide;

math_expr_low: math_expr_high | math_expr_low prec_1 math_expr_high; // value comparisons
math_expr_high: math_term_low | math_expr_high prec_2 math_term_low; // add/sub: pemdAS
math_term_low: math_term_high | math_term_low prec_3 math_term_high; // mul/div: peMDas
math_term_high: math_factor | math_term_high exponent math_factor; // exp: pEmdas
math_factor: operand | lparen math_expr_low rparen; // parens: Pemdas
operand: t_integer | t_floating | variable; // numbers
%%

extern void yyerror(const char* msg) {
	fprintf(stderr, "Line %d, %s.\n", yylineno, msg);
	// exit(1);
}