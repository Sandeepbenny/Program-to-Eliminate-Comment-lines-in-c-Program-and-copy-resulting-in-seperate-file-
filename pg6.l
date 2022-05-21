%{
#include<stdio.h>
int comment1=0,comment2=0,i=0;
%}
%%
[/][/].* {if(i==0)comment1++;}
[/][*] {if(i==0)i++;}
[*][/] {if(i==1)i--;comment2++;}
. {if(i==0)ECHO;}
%%
void main()
{
yyin=fopen("program6.c","r");
yyout=fopen("output.txt","w");
yylex();
printf("Single line comments %d \n ",comment1);
printf("Multi LIne Comments %d \n",comment2);
printf("Total number of comments %d",comment1+comment2);
}
int yywrap()
{
return 1;
}


