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
                                                            
%token FLOAT                                                                         
%token INT                                                                           
%token <sval> IDENTIFIER                                                                    
 
%% /* Grammar rules and actions follow */                                            
declaration:                                                                         
      type_specifier identifier_dum ';'                                              
        { printf("%3d: FROM BISON declaration\n", line_number); }                   
;                                                                                    
type_specifier:                                                                      
      FLOAT                                                                          
         { printf("%3d: FROM BISON FLOAT\n", line_number); }                         
   |  INT                                                                            
         { printf("%3d: FROM BISON INT\n", line_number); }                           
;                                                                                    
identifier_dum:                                                                      
      IDENTIFIER                                                                     
         { 
            printf("%3d: IDENTIFIER: %s\n", line_number, $1); } 
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
