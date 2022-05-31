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
                                                                      
%token <sval> T_IDENTIFICADOR 

%token T_INICIO
%token T_FIN 
 
%% /* Grammar rules and actions follow */                                            

seccion_programa : T_INICIO declaraciones T_FIN { printf("SECCION DE UN PROGRAMA \n"); }
;

declaraciones : 
    declaracion {  printf("%3d: UNA DECLARACION \n", line_number); }
  | declaracion declaraciones {  printf("%3d: VARIAS DECLARACIONES \n", line_number); }
;

declaracion:                                                                         
    tipo_de_dato identificador T_PUNTO_COMA { printf("%3d: DECLARACION \n", line_number); }                   
;             


tipo_de_dato:                                                                      
    T_FLOTANTE { printf("%3d: TIPO DE DATO FLOTANTE \n", line_number); }                         
  | T_ENTERO { printf("%3d: TIPO DE DATO ENTERO \n", line_number); } 
  | T_CADENA  { printf("%3d: TIPO DE DATO CADENA \n", line_number); } 
;


identificador:                                                                      
      T_IDENTIFICADOR { printf("%3d: UN IDENTIFICADOR VALIDO: %s\n", line_number, $1); }
    | T_CADENAS
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
