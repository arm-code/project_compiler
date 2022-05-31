%{                                                                                          
#include "simple.tab.h"                                                                     
extern int line_number;                                                                     
%}                                                                                          


%option noyywrap                                                                            
 
%%    
"inicio_programa" { return T_INICIO; }

"fin_programa" {return T_FIN; }

"flotante"	{ 	printf("FROM FLEX FLOAT %s\n", yytext);
				return T_FLOTANTE;
			}      

"entero"	{ 	printf("FROM FLEX INT %s\n", yytext);
				return T_ENTERO;
			} 

"cadena" { return T_CADENA; }

";" {  return T_PUNTO_COMA; }

[a-zA-Z0-9][a-zA-Z0-9]* { return T_CADENAS; }

[_a-zA-Z][_a-zA-Z0-9]*	{ printf("FROM FLEX IDENTIFIER: %s\n", yytext);
						  yylval.sval = malloc(strlen(yytext));
						  strncpy(yylval.sval, yytext, strlen(yytext));
						  return T_IDENTIFICADOR; }

[ \t\r]+          /* eat up whitespace */   

[\n] { line_number++; }   

%%