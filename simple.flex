%{                                                                                          
#include "simple.tab.h"                                                                     
extern int line_number;                                                                     
%}                                                                                          


%option noyywrap                                                                            
 
%%

"igual_que" { return T_IGUAL; }

"mayor_que" { return T_MAYOR_QUE; }

"menor_que" { return T_MENOR_QUE; }

"diferente_de" { return T_DIFERENTE_DE; }

"ciclo_for" { return T_CICLO_FOR; }

"fin_ciclo_for" { return T_FIN_CICLO_FOR; }

"ciclo_while" { return T_CICLO_WHILE; }

"fin_ciclo_while" { return T_FIN_CICLO_WHILE; }

"condicional_if" { return T_CONDICIONAL_IF; }

"fin_condicional_if" { return T_FIN_CONDICIONAL_IF; }

"inicio_programa" { return T_INICIO; }

"fin_programa" { return T_FIN; }

"flotante"	{ return T_FLOTANTE;	}      

"entero"	{ return T_ENTERO;	} 

"cadena" { return T_CADENA; }

";" {  return T_PUNTO_COMA; }




\'[a-zA-Z0-9][a-zA-Z0-9]*\' { return T_CADENAS; }

[_a-zA-Z][_a-zA-Z0-9]*	{ printf("FROM FLEX IDENTIFIER: %s\n", yytext);
						  yylval.sval = malloc(strlen(yytext));
						  strncpy(yylval.sval, yytext, strlen(yytext));
						  return T_IDENTIFICADOR; }

[ \t\r]+          /* eat up whitespace */   

[\n] { line_number++; }   

%%