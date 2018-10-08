package php.scanner;
import java_cup.runtime.Symbol;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.text.BadLocationException;

%%
%{
    public LinkedList<TError> TablaEL = new LinkedList<TError>(); 
%}

%public
%class Lexer
%type Token
%line
%implements java_cup.runtime.Scanner
%function next_token
%type java_cup.runtime.Symbol
%char
%column
%full
%line
%unicode
// Alphabet
decimal	= [0-9][0-9]*|0
hexadecimal = 0[xX][0-9a-fA-F]+
label = [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*

// Operators
ar_op = "+"|"-"|"*"|"/"|"%"
cmp_op = "<"|">"|"<="|">="|"=="|"!="
log_op = "&&"|"||"
neg_op = "!"
ass_op = "="|"+="|"-="|"*="|"/="|"%="
inc_dec_op = "++"|"--"
prnthss = "()"
prnthss_A = "("
prnthss_C = ")"
curly = "{}"
bracket_A = "["
bracket_C = "]"
brackets = "[]"
semicolon = ";"
comma = ","|"."
curly_A = "{"
curly_C = "}"
extends = extends
// Data Types
bool_type = true|false
int_type = ({decimal}|{hexadecimal})
double_type = [0-9]+\.?[0-9]+([eE]{int_type}.?[0-9]*)?
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
class = class
implements = implements
interface = interface
//valid={identifier}|{string_type}|{control_struct}|\.|[\n]|{ass_op}|{inc_dec_op}|{ar_op}|{cmp_op}|{log_op}|{prnthss}|{curly}|{bracket}|{semicolon}|{bool_type}|{int_type}|{double_type}|[ \t\r]|{rsrvd_words}|{comma}
if = if
blank = [\n]|[\n\r]|[ ]
Print = Print
this = this
malloc = Malloc
readInteger = ReadInteger
readLine = ReadLine
null = null
newArr = NewArray
getByte = GetByte
setByte = SetByte
new = new
// ERR

%{
public String lexeme;
public int lineNumber = 0;
public int chars = 0;
%}
%%

"-"     {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.minus, yycolumn, yyline, yytext());}
{semicolon}     {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.pyc, yycolumn, yyline, yytext());}
{new}            {chars += yytext().length(); lexeme=yytext(); lineNumber=yyline; return new Symbol(sym.t_new, yycolumn, yyline, yytext());} 
{class}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.clase, yycolumn, yyline, yytext());}
{implements}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_implements, yycolumn, yyline, yytext());}
{interface}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_interface, yycolumn, yyline, yytext());}
{if}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_if, yycolumn, yyline, yytext());}
{else}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_else, yycolumn, yyline, yytext());}
{for}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_for, yycolumn, yyline, yytext());}
{while}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_while, yycolumn, yyline, yytext());}
{return}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_return, yycolumn, yyline, yytext());}
{break}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_break, yycolumn, yyline, yytext());}
{Print}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.print, yycolumn, yyline, yytext());}
{this}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_this, yycolumn, yyline, yytext());}
{malloc}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.malloc, yycolumn, yyline, yytext());}
{readInteger}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.readInteger, yycolumn, yyline, yytext());}
{readLine}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.ReadLine, yycolumn, yyline, yytext());}
{null}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_null, yycolumn, yyline, yytext());}
{newArr}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_newArr, yycolumn, yyline, yytext());}
{getByte}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.getByte, yycolumn, yyline, yytext());}
{setByte}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.setByte, yycolumn, yyline, yytext());}
{extends}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.extend, yycolumn, yyline, yytext());}
int       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_int, yycolumn, yyline, yytext());}
double       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_double, yycolumn, yyline, yytext());}
bool     {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_bool, yycolumn, yyline, yytext());}
string       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.t_string, yycolumn, yyline, yytext());}


void            {chars += yytext().length(); lexeme=yytext(); lineNumber=yyline; return new Symbol(sym.t_void, yycolumn, yyline, yytext());} 
{comment}       {chars += yytext().length(); if(yytext().contains("\n")){chars=0; lineNumber=yyline;} lexeme=yytext();}
{bool_type}     {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.bolCnst, yycolumn, yyline, yytext());}
{identifier}    {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.ident, yycolumn, yyline, yytext());}
{string_type}   {chars += yytext().length(); lexeme=yytext(); lineNumber=yyline; return new Symbol(sym.strConst, yycolumn, yyline, yytext());}
{control_struct} {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; }
\.              {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.dot, yycolumn, yyline, yytext());}
[\n]|[\r\n]|[\n\r]            {chars = 0; lineNumber=yyline; lexeme="\n"; lineNumber = yyline;}
{blank}{blank}+  {chars = 0; lineNumber=yyline; lexeme="\n"; lineNumber = yyline;}
{ass_op}        {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.equals, yycolumn, yyline, yytext());}
{ar_op} 	    {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.arop, yycolumn, yyline, yytext());}
{cmp_op}	    {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.cmpop, yycolumn, yyline, yytext());}
{log_op}        {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.logop, yycolumn, yyline, yytext());}
{prnthss_A}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.prnthss_A, yycolumn, yyline, yytext());}
{prnthss_C}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.prnthss_C, yycolumn, yyline, yytext());}

{curly}         {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; }
{bracket_A}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.brackets_A, yycolumn, yyline, yytext());}
{bracket_C}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.brackets_C, yycolumn, yyline, yytext());}
{brackets}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.brackets, yycolumn, yyline, yytext());}
{neg_op}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.neg, yycolumn, yyline, yytext());}
{curly_A}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.curly_A, yycolumn, yyline, yytext());}
{curly_C}       {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.curly_C, yycolumn, yyline, yytext());}





{int_type}      {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.intCnst, yycolumn, yyline, yytext());}
{double_type}   {chars += yytext().length(); lexeme=yytext(); lineNumber=yyline;return new Symbol(sym.dblConst, yycolumn, yyline, yytext());}
[ \t\r]+        {chars += yytext().length(); lexeme=yytext();lineNumber=yyline;  }
{comma}         {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; return new Symbol(sym.comma, yycolumn, yyline, yytext());}
{multiline_error}  {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; System.out.println("Error Lexico"+yytext()+" Linea "+yyline+" Columna "+yycolumn);
                          TError datos = new TError(yytext(),yyline,yycolumn,"Error Lexico","Simbolo no existe en el lenguaje");
                          TablaEL.add(datos);}
.|"=!=" {chars += yytext().length(); lexeme=yytext();lineNumber=yyline; System.out.println("Error Léxico"+yytext()+" Linea "+yyline+" Columna "+yycolumn);
                          try {
                            Interfaz.getInterfaz().AddTextToJTextArea("Error Léxico. Lexema: "+lexeme+"\tFila: " + yyline + "\tColumna: "+ yycolumn+"\n");
                          } catch (BadLocationException ex) {
                              System.out.println("Error escribiendo");
                              Logger.getLogger(parser.class.getName()).log(Level.SEVERE, null, ex);
                          }}

