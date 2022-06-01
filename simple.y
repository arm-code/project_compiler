%{                                                                                   

   #include<stdio.h>
   #include <stdarg.h> 
   #include "simple_shared.h"                                                        


  void yyerror (char const *);
  int yylex();

  
   int yydebug=1;                                                                    
   int indent=0;                                                                     
                                                                    
%}     

%union
{
  char * sval;
  int ival;
};
                                                            
%token T_FLOTANTE                                                                         
%token T_ENTERO
%token T_CADENA
%token T_CADENAS
%token T_PARAMETROS

%token T_PUNTO_COMA
%token T_COMA
%token T_ABRE_P
%token T_CIERRA_P
%token T_ABRE_L
%token T_CIERRA_L
%token T_ASIGNA


%token T_IGUAL
%token T_MENOR_QUE
%token T_MAYOR_QUE
%token T_DIFERENTE_DE
                                                                      
%token <sval> T_IDENTIFICADOR 

%token T_INICIO
%token T_FIN 

%token T_CICLO_FOR

%token T_CICLO_WHILE

%token T_CONDICIONAL_IF

%token T_FUNCION


 
%% /* Grammar rules and actions follow */                                            

seccion_programa 
  : T_INICIO T_ABRE_L declaraciones T_CIERRA_L T_FIN { printf("SECCION DE UN PROGRAMA \n"); }
  ;

declaraciones 
  : declaracion 
  | declaracion declaraciones
  ;

declaracion
  : tipo_de_dato identificador T_PUNTO_COMA { printf("%3d: DECLARACION \n", line_number); }
  | tipo_de_dato cadenas T_PUNTO_COMA
  | ciclo_for
  | ciclo_while
  | condicional_if   
  | funcion                
  ;             

funcion
  : T_FUNCION identificador T_ABRE_P parametros T_CIERRA_P T_ABRE_L declaraciones T_CIERRA_L
  ;

parametros
  : parametro
  | parametro T_COMA parametros
  ;

parametro
  : tipo_de_dato identificador
  ;

ciclo_for 
  : T_CICLO_FOR T_ABRE_P identificador T_PUNTO_COMA identificador T_PUNTO_COMA identificador T_PUNTO_COMA T_CIERRA_P T_ABRE_L declaraciones T_CIERRA_L { printf(" CICLO FOR \n"); }
  ;

ciclo_while
  : T_CICLO_WHILE T_ABRE_P identificador operadores_logicos identificador T_CIERRA_P T_ABRE_L declaraciones T_CIERRA_L { printf(" CICLO WHILE \n"); }
  ;

condicional_if
  : T_CONDICIONAL_IF T_ABRE_P identificador operadores_logicos identificador T_CIERRA_P T_ABRE_L declaraciones T_CIERRA_L{ printf(" CONDICIONAL IF \n "); }
  ;

operadores_logicos 
  : T_IGUAL
  | T_MAYOR_QUE
  | T_MENOR_QUE
  | T_DIFERENTE_DE
  ;

tipo_de_dato
  : T_FLOTANTE { printf("%3d: TIPO DE DATO FLOTANTE \n", line_number); }                         
  | T_ENTERO { printf("%3d: TIPO DE DATO ENTERO \n", line_number); } 
  | T_CADENA { printf("%3d: TIPO DE DATO CADENA \n", line_number); } 
  ;

cadenas
  : T_CADENAS
  ;

identificador
  : T_IDENTIFICADOR { printf("%3d: UN IDENTIFICADOR VALIDO: %s\n", line_number, $1); }
  ;

%%                                                                                   
 

 #include <stdio.h>
 void yyerror(char const *s)
 {
  fprintf(stderr,"%s\n",s);
 }


int main ()                                                                              
{                                                                                    
  yyparse ();                                                                        
}
