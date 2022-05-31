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
%token <sval> T_IDENTIFICADOR 

%token T_INICIO
%token T_FIN 
 
%% /* Grammar rules and actions follow */                                            



declaracion:                                                                         
    tipo_de_dato identificador ';' { printf("%3d: DECLARACION \n", line_number); }                   
;             

tipo_de_dato:                                                                      
    T_FLOTANTE { printf("%3d: TIPO DE DATO FLOTANTE \n", line_number); }                         
  | T_ENTERO { printf("%3d: TIPO DE DATO ENTERO \n", line_number); }                           
;

identificador:                                                                      
      T_IDENTIFICADOR { printf("%3d: UN IDENTIFICADOR VALIDO: %s\n", line_number, $1); } 
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
