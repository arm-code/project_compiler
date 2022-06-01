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

%token T_PUNTO_COMA


%token T_IGUAL
%token T_MENOR_QUE
%token T_MAYOR_QUE
%token T_DIFERENTE_DE
                                                                      
%token <sval> T_IDENTIFICADOR 

%token T_INICIO
%token T_FIN 

%token T_CICLO_FOR
%token T_FIN_CICLO_FOR
%token T_CICLO_WHILE
%token T_FIN_CICLO_WHILE
%token T_CONDICIONAL_IF
%token T_FIN_CONDICIONAL_IF

 
%% /* Grammar rules and actions follow */                                            

seccion_programa 
  : T_INICIO declaraciones T_FIN { printf("SECCION DE UN PROGRAMA \n"); }
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
  ;             

ciclo_for 
  : T_CICLO_FOR identificador T_PUNTO_COMA identificador T_PUNTO_COMA identificador T_PUNTO_COMA T_FIN_CICLO_FOR { printf(" CICLO FOR \n"); }
  ;

ciclo_while
  : T_CICLO_WHILE identificador operadores_logicos identificador T_FIN_CICLO_WHILE { printf(" CICLO WHILE \n"); }
  ;

condicional_if
  : T_CONDICIONAL_IF identificador operadores_logicos identificador T_FIN_CONDICIONAL_IF { printf(" CONDICIONAL IF \n "); }
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
