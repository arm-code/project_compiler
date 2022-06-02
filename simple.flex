%{                                                                                          
#include "simple.tab.h"                                                                     
extern int line_number;                                                                     
%}                                                                                          


%option noyywrap                                                                            
 
%%

"==" { return T_IGUAL; }
">" { return T_MAYOR_QUE; }
"<" { return T_MENOR_QUE; }
"!=" { return T_DIFERENTE_DE; }





"while" { return T_CICLO_WHILE; }
"for" { return T_CICLO_FOR; }
"if" { return T_CONDICIONAL_IF; }
"else" { return T_ELSE; }

"inicio_programa" { return T_INICIO; }
"fin_programa" { return T_FIN; }

"flotante"	{ return T_FLOTANTE;	}      
"entero"	{ return T_ENTERO;	} 
"cadena" { return T_CADENA; }

";" {  return T_PUNTO_COMA; }
"," {  return T_COMA; }
"(" {  return T_ABRE_P; }
")" {  return T_CIERRA_P; }
"{" {  return T_ABRE_L; }
"}" {  return T_CIERRA_L; }
"=" {  return T_ASIGNA; }

"+" { return T_SUMA; }
"-" { return T_RESTA; }
"*" { return T_PRODUCTO; }
"/" { return T_DIVISION; }
"%" { return T_MODULO; }

"funcion" {  return T_FUNCION; }

\-?[0-9]+ {  return T_NUM_ENTERO; }
\-?[0-9]+\.[0-9]+ {  return T_NUM_FLOTANTE; }

\,? {  return T_PARAMETROS; }

\'[a-zA-Z0-9]*[a-zA-Z0-9]*\' { return T_CADENAS; }

[_a-zA-Z][_a-zA-Z0-9]*	{ printf("FROM FLEX IDENTIFIER: %s\n", yytext);
						  yylval.sval = malloc(strlen(yytext));
						  strncpy(yylval.sval, yytext, strlen(yytext));
						  return T_IDENTIFICADOR; }

[ \t\r]+          /* eat up whitespace */   

[\n] { line_number++; }   

%%