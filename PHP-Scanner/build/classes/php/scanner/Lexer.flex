package php.scanner;

import static php.scanner.Token.*;
%%
%class Lexer
%type Token
%line
// Alphabet

escaped = \\n|\\r|\\t|\\v|\\e|\\f|\\\\|\\"$"|\\[0-7]{1,3}|\\xu0-9A-Fa-f]+|\\.
decimal	= [0-9][0-9]*|0
hexadecimal = 0[xX][0-9a-fA-F]+
label = [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*

// Operators
ar_op = "+"|"-"|"*"|"/"|"%"
cmp_op = "<"|">"|"<="|">="|"=="|"!="
log_op = "!"|"&&"|"||"
ass_op = "="|"+="|"-="|"*="|"/="|"%="
inc_dec_op = "++"|"--"
prnthss = "("|")"|"()"|"()"
curly = "{"|"}"|"{}"|"{}"
bracket = "["|"]"|"[]"
semicolon = ";"
comma = ","|"."

// Data Types
bool_type = true|false
int_type = [+-]?({decimal}|{hexadecimal})
double_type = [-+]?[0-9]+\.?[0-9]+([eE]{int_type}.?[0-9]*)?
string_type = (\"([^\"\\\n]|\\.)*\")

// C#
rsrvd_words = int|double|bool|string|class|interface|null|this|extends|implements|for|while|if|else|return|break|NewArray|New|Array|new|array

// Identifiers
identifier={label}

// Comments
single_line_comment = ("//")(.)*
multiline_comment = (("/*")~("*/"))
comment = {single_line_comment}|{multiline_comment}
multiline_error = ("/*")


// Control Structures
if = if
else = else
elseif = elseif
endif =	endif
while =	while
do = do
for = for
break =	break
switch = switch
case = case
include = include
continue = continue
return = return
control_struct = ({if}|{else}|{elseif}|{endif}|{while}|{do}|{for}|{break}|{switch}|{case}|{continue}|{return}|{include})

//valid={identifier}|{string_type}|{control_struct}|\.|[\n]|{ass_op}|{inc_dec_op}|{ar_op}|{cmp_op}|{log_op}|{prnthss}|{curly}|{bracket}|{semicolon}|{bool_type}|{int_type}|{double_type}|[ \t\r]|{rsrvd_words}|{comma}

blank = [\n]|[\n\r]|[ ]


// ERR

%{
public String lexeme;
public int lineNumber = 0;
public int chars = 0;
%}
%%

void            {chars += yytext().length(); lexeme=yytext(); lineNumber=yyline; return T_VOID;} 
{comment}       {chars += yytext().length(); if(yytext().contains("\n")){chars=0; lineNumber=yyline;} lexeme=yytext(); return COMMENT;}
{identifier}    {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_IDENTIFIER;}
{string_type}   {chars += yytext().length(); lexeme=yytext(); lineNumber=yyline; return T_STRINGCONSTANT;}
{control_struct} {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return CTRLSTRCT;}
\.              {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_PUNCTUATION;}
[\n]|[\r\n]|[\n\r]            {chars = 0; lineNumber=yyline; lexeme="\n"; lineNumber = yyline; return NEWLINE;}
{blank}{blank}+  {chars = 0; lineNumber=yyline; lexeme="\n"; lineNumber = yyline; return TWONEWLINE;}
{ass_op}        {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_BINOP;}
{inc_dec_op}    {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_UNOP;}
{ar_op} 	    {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_BINOP;}
{cmp_op}	    {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_BINOP;}
{log_op}        {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return LOGOP;}
{prnthss}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_PUNCTUATION;}
{curly}         {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_PUNCTUATION;}
{bracket}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_PUNCTUATION;}
{semicolon}     {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_PUNCTUATION;}
{bool_type}     {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_BOOLCONSTANT;}
{int_type}      {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_INTCONSTANT;}
{double_type}   {chars += yytext().length(); lexeme=yytext(); lineNumber=yyline;return T_DOUBLECONSTANT;}
[ \t\r]+        {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return BLANK;}
{rsrvd_words}   {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_RSRVWRDS;}
{comma}         {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return T_PUNCTUATION;}
{multiline_error}  {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return ERROR_COMMENT;}
.|"=!=" {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return ERROR;}
