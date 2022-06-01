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

"for" { return T_CICLO_FOR; }

"fin_for" { return T_FIN_CICLO_FOR; }

"while" { return T_CICLO_WHILE; }

"fin_while" { return T_FIN_CICLO_WHILE; }

"if" { return T_CONDICIONAL_IF; }

"fin_if" { return T_FIN_CONDICIONAL_IF; }

"inicio_programa" { return T_INICIO; }

"fin_programa" { return T_FIN; }

"flotante"	{ return T_FLOTANTE;	}      

"entero"	{ return T_ENTERO;	} 

"cadena" { return T_CADENA; }

";" {  return T_PUNTO_COMA; }

"(" {  return T_ABRE_P; }

")" {  return T_CIERRA_P; }

"{" {  return T_ABRE_L; }

"}" {  return T_CIERRA_L; }

"=" {  return T_ASIGNA; }




\'[a-zA-Z0-9][a-zA-Z0-9]*\' { return T_CADENAS; }

[_a-zA-Z][_a-zA-Z0-9]*	{ printf("FROM FLEX IDENTIFIER: %s\n", yytext);
						  yylval.sval = malloc(strlen(yytext));
						  strncpy(yylval.sval, yytext, strlen(yytext));
						  return T_IDENTIFICADOR; }

[ \t\r]+          /* eat up whitespace */   

[\n] { line_number++; }   

%%