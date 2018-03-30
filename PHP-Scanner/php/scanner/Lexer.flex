package php.scanner;

import static php.scanner.Token.*;
%%
%class Lexer
%type Token

a = [aA]
b = [bB]
c = [cC]
d = [dD]
e = [eE]
f = [fF]
g = [gG]
h = [hH]
i = [iI]
j = [jJ]
k = [kK]
l = [lL]
m = [mM]
n = [nN]
o = [oO]
p = [pP]
q = [qQ]
r = [rR]
s = [sS]
t = [tT]
u = [uU]
v = [vV]
w = [wW]
x = [xX]
y = [yY]
z = [zZ]

decimal	= [1-9][0-9]*|0
hexadecimal = 0[xX][0-9a-fA-F]+
octal = 0[0-7]+
binary = 0[bB][01]+
label = [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*

mag_constant = (__)(LINE|FILE|DIR|FUNCTION|CLASS|TRAIT|METHOD|NAMESPACE)(__)
ar_op = "+"|"-"|"*"|"/"|"%"|"**"
cmp_op = "<"|">"|"<="|">="|"=="|"!="
log_op = "and"|"or"|"xor"|"!"|"&&"|"||"
ass_op = "="|"+="|"-="|"*="|"/="
inc_dec_op = "++"|"--"
prnthss = "("|")"
curly = "{"|"}"
bracket = "["|"]"
semicolon = ";"
comma = ","
bool_type = {t}{r}{u}{e}|{f}{a}{l}{s}{e}
int_type = [+-]?({decimal}|{hexadecimal}|{octal}|{binary})
double_type = [-+]?[0-9]*\.?[0-9]+([eE]{int_type}.?[0-9]*)?
string_type = ('([^(')(\n)]|\\')*')|(\"([^(\")(\n)]|\\\")*\")
var_id = "$"{label}
cnst_id = {label}
if = {i}{f}
else = {e}{l}{s}{e}
elseif = {e}{l}{s}{e}{i}{f}
endif =	{e}{n}{d}{i}{f}
while =	{w}{h}{i}{l}{e}
do = {d}{o}
for = {f}{o}{r}
foreach = {f}{o}{r}{e}{a}{c}{h}
break =	{b}{r}{e}{a}{k}
switch = {s}{w}{i}{t}{c}{h}
case = {c}{a}{s}{e}
include = {i}{n}{c}{l}{u}{d}{e}
continue = {c}{o}{n}{t}{i}{n}{u}{e}
return = {r}{e}{t}{u}{r}{n}
control_struct = ({if}|{else}|{elseif}|{endif}|{while}|{do}|{for}|{foreach}|{break}|{switch}|{case}|{continue}|{return}|{include})
superglobal = "$"(GLOBALS|_(SERVER|GET|POST|FILES|COOKIE|SESSION|REQUEST|ENV))
other_reserved_var = "$"(php_errormsg|HTTP_RAW_POST_DATA|http_response_header|argc|argv)
rsrvd_var = {superglobal}|{other_reserved_var}
single_line_comment = ("//"|"#")(.)*
multiline_comment = (("/*")([^(("*/"))])*("*/"))
comment = {single_line_comment}|{multiline_comment}
recordset = "$"{r}{e}{c}{o}{r}{d}{s}{e}{t}"["{string_type}"]"
function = function
rsrvd_words = __halt_compiler |break|clone|die|empty|endswitch|final|global|include_once|list|private|return|try|xor|abstract|callable|const|do|enddeclare|endwhile|finally|goto|instanceof|namespace|define|protected|static|unset|yield|and|case|continue|echo|endfor|eval|for|if|insteadof|new|public|switch|use|array|catch|declare|endforeach|exit|foreach|implements|interface|or|require|throw|var|as|class|default|elseif|endif|extends|function|include|isset|print|require_once|trait|while
php = "<?"{p}{h}{p}|"?>"

%{
public String lexeme;
public int lineNumber = 0;
public int chars = 0;
%}
%%
{control_struct} {chars += yytext().length(); lexeme=yytext(); return CTRLSTRCT;}
{comment}       {chars += yytext().length(); if(yytext().contains("\n")){chars=0; lineNumber++;} lexeme=yytext(); return COMMENT;}
\.              {chars += yytext().length(); lexeme=yytext(); return CONCAT;}
[\n]+           {chars = 0; lineNumber++; lexeme="\n"; return NEWLINE;}
{php}           {chars += yytext().length(); lexeme=yytext(); return PHP;}
{mag_constant}  {chars += yytext().length(); lexeme=yytext(); return MAGCONSTANT;}
{rsrvd_var}     {chars += yytext().length(); lexeme=yytext(); return RSRVDVAR;}
{ass_op}        {chars += yytext().length(); lexeme=yytext(); return ASSOP;}
{ar_op} 	{chars += yytext().length(); lexeme=yytext(); return AROP;}
{cmp_op}	{chars += yytext().length(); lexeme=yytext(); return CMPOP;}
{log_op}        {chars += yytext().length(); lexeme=yytext(); return LOGOP;}
{inc_dec_op}    {chars += yytext().length(); lexeme=yytext(); return INCDECOP;}
{prnthss}       {chars += yytext().length(); lexeme=yytext(); return PRNTHSS;}
{curly}         {chars += yytext().length(); lexeme=yytext(); return CURLY;}
{bracket}       {chars += yytext().length(); lexeme=yytext(); return BRACKET;}
{semicolon}     {chars += yytext().length(); lexeme=yytext(); return SEMICOLON;}
{comma}         {chars += yytext().length(); lexeme=yytext(); return COMMA;}
{bool_type}     {chars += yytext().length(); lexeme=yytext(); return BOOL;}
{int_type}      {chars += yytext().length(); lexeme=yytext(); return INT;}
{double_type}   {chars += yytext().length(); lexeme=yytext(); return DOUBLE;}
{string_type}   {chars += yytext().length(); lexeme=yytext(); return STRING;}
{var_id}        {chars += yytext().length(); lexeme=yytext(); return VARID;}
{recordset}     {chars += yytext().length(); lexeme=yytext(); return DB;}
{function}      {chars += yytext().length(); lexeme=yytext(); return FUNC;}
[ \t\r]+        {chars += yytext().length(); lexeme=yytext(); return BLANK;}
{rsrvd_words}   {chars += yytext().length(); lexeme=yytext(); return RSRVWRDS;}
{cnst_id}       {chars += yytext().length(); lexeme=yytext(); return CONSTANT;}
.               {chars += yytext().length(); lexeme = yytext();return ERROR;}