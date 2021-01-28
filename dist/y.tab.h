/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     eof = 258,
     lparen = 259,
     rparen = 260,
     lbracket = 261,
     rbracket = 262,
     vline = 263,
     comma = 264,
     semicolon = 265,
     horn = 266,
     end_stmt = 267,
     wildcard = 268,
     math_evaluator = 269,
     unifier = 270,
     negation = 271,
     exponent = 272,
     add = 273,
     subtract = 274,
     multiply = 275,
     divide = 276,
     smaller = 277,
     smaller_eq = 278,
     greater = 279,
     greater_eq = 280,
     cut = 281,
     variable = 282,
     atom = 283,
     t_string = 284,
     t_integer = 285,
     t_floating = 286
   };
#endif
/* Tokens.  */
#define eof 258
#define lparen 259
#define rparen 260
#define lbracket 261
#define rbracket 262
#define vline 263
#define comma 264
#define semicolon 265
#define horn 266
#define end_stmt 267
#define wildcard 268
#define math_evaluator 269
#define unifier 270
#define negation 271
#define exponent 272
#define add 273
#define subtract 274
#define multiply 275
#define divide 276
#define smaller 277
#define smaller_eq 278
#define greater 279
#define greater_eq 280
#define cut 281
#define variable 282
#define atom 283
#define t_string 284
#define t_integer 285
#define t_floating 286




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 9 "parse.y"
{
	int integer;
	float decimal;
	const char* string;
}
/* Line 1529 of yacc.c.  */
#line 117 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

