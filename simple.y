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

%token T_PARAMETROS

%token T_NUM_ENTERO
%token T_NUM_FLOTANTE
%token T_CADENAS

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

%token T_SUMA
%token T_RESTA
%token T_PRODUCTO
%token T_DIVISION
%token T_MODULO
                                                                      
%token <sval> T_IDENTIFICADOR 

%token T_INICIO
%token T_FIN 

%token T_CICLO_FOR
%token T_CICLO_WHILE
%token T_CONDICIONAL_IF
%token T_ELSE

%token T_FUNCION


 
%% /* Grammar rules and actions follow */                                            
programas
  : seccion_programa { printf("SECCION DE UN PROGRAMA \n"); }
  | seccion_programa programas 
  ;

seccion_programa 
  : T_INICIO T_ABRE_L  declaraciones T_CIERRA_L T_FIN 
  | T_INICIO T_ABRE_L funciones T_CIERRA_L T_FIN    
  | T_INICIO T_ABRE_L declaraciones funciones T_CIERRA_L T_FIN    
  ;

declaraciones 
  : declaracion 
  | declaracion declaraciones
  ;

declaracion
  : tipo_de_dato identificador T_PUNTO_COMA { printf("DECLARACION SENCILLA \n"); }
  | tipo_de_dato T_CADENAS T_PUNTO_COMA     { printf("DECLARACION CADENA DE CARACTERES SENCILLA \n"); }
  | identificador T_ASIGNA identificador T_PUNTO_COMA   { printf("ASIGNACION DE IDENTIFICADORES \n"); }
  | tipo_de_dato identificador T_ASIGNA T_NUM_ENTERO T_PUNTO_COMA   { printf("DECLRACION DE DATOS ENTEROS \n"); }
  | tipo_de_dato identificador T_ASIGNA T_NUM_FLOTANTE T_PUNTO_COMA   { printf("DECLARACION DE DATOS FLOTANTES \n"); }
  | tipo_de_dato identificador T_ASIGNA T_CADENAS T_PUNTO_COMA    { printf("DECLARACION DE CADENAS SIN ESPACIOS \n"); }
  | ciclo_for   { printf("DECLARACION DE CICLO FOR \n"); }
  | ciclo_while   { printf("DECLARACION DE CICLO WHILE \n"); }
  | condicional_if    { printf("DECLARACION DE CONDICIONAL IF \n"); }
  | identificador T_ASIGNA operaciones T_PUNTO_COMA  { printf("DECLARACION DE OPERACIONES SENCILLAS \n"); }    
  | funciones
  ;             

funciones
  : funcion 
  | funcion funciones
  ;

funcion
  : T_FUNCION identificador T_ABRE_P parametros T_CIERRA_P T_ABRE_L declaraciones T_CIERRA_L
  | T_FUNCION identificador T_ABRE_P T_CIERRA_P T_ABRE_L declaraciones T_CIERRA_L
  ;

parametros
  : parametro
  | parametro T_COMA parametros
  ;

parametro
  : tipo_de_dato identificador
  ;

ciclo_for 
  : T_CICLO_FOR T_ABRE_P identificador T_PUNTO_COMA identificador T_PUNTO_COMA identificador T_PUNTO_COMA T_CIERRA_P T_ABRE_L declaraciones T_CIERRA_L 
  ;

ciclo_while
  : T_CICLO_WHILE T_ABRE_P identificador operadores_logicos identificador T_CIERRA_P T_ABRE_L declaraciones T_CIERRA_L 
  ;

condicional_if
  : T_CONDICIONAL_IF T_ABRE_P identificador operadores_logicos identificador T_CIERRA_P T_ABRE_L declaraciones T_CIERRA_L
  | T_CONDICIONAL_IF T_ABRE_P identificador operadores_logicos identificador T_CIERRA_P T_ABRE_L declaraciones T_CIERRA_L T_ELSE T_ABRE_L declaraciones T_CIERRA_L
  ;

operaciones
  : operacion_aritmetica
  | operacion_aritmetica operadores_aritmeticos operaciones
  ;

operacion_aritmetica
  : identificador operadores_aritmeticos identificador
  ;

operadores_aritmeticos
  : T_SUMA
  | T_RESTA
  | T_PRODUCTO
  | T_DIVISION
  | T_MODULO
  ;

operadores_logicos 
  : T_IGUAL
  | T_MAYOR_QUE
  | T_MENOR_QUE
  | T_DIFERENTE_DE
  ;

tipo_de_dato
  : T_FLOTANTE                          
  | T_ENTERO  
  | T_CADENA  
  ;


identificador
  : T_IDENTIFICADOR 
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
