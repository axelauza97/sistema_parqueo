/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_CAR 10
#define MAX_STR 6

int main()
{
	char park[MAX_CAR][MAX_STR];
	char placa[MAX_STR];
	int opcion;
	void initialize(char **autos);
	void ver_autos(char **autos);
	void ingresar_auto(char *placa,char **autos);
	initialize(park);
	do{
    	
    	printf("1.- Observar parqueos ocupados\n");
    	printf("2.- Ingresar auto a parqueo\n");
    	printf("3.- Retirar auto de parqueo\n");
    	printf("4.- Salir\n");
    	
    	printf("Ingrese Opcion: ");
    	scanf("%d",&opcion);
    	switch(opcion){
    	    case 1:
    	        printf("Opcion 1");
    	        ver_autos(park);
    	        break;
	        case 2:
	            printf("Opcion 2");
	            printf("Ingrese Placa: ");
    	        scanf("%s",placa);
    	        ingresar_auto(placa,park);
	            break;
            case 3:
	            printf("Opcion 3");
	            printf("Ingrese Placa: ");
    	        scanf("%s",placa);
	            break;
	            
    	    
    	}
    	
    }while(opcion!=4);
	
}

void initialize(char **autos){
	printf("\nVerificando autos\n");
	char **p_anterior = autos;
	char **p;
	for(int i=0;i<MAX_CAR;i++)
	{   
	    char *space; 
	    space = (char*)malloc(MAX_STR * sizeof(char));
        autos[i]=space;
	}

}


void ver_autos(char **autos){
	printf("\nVerificando autos\n");
	for(int i=0;i<MAX_CAR;i++)
	{
	    printf("AUTO %d %s\n",i,autos[i]);
	}

}
void ingresar_auto(char *placa,char **autos){
	printf("\nIngresando auto\n");
	for(int i=0;i<MAX_CAR;i++)
	{
        if(autos[i]!=NULL){
            printf("Ingresado en %p",autos[i]);
            autos[i]=placa;
            printf("Placa es: %s\n", autos[i]);
    		printf("La dirección de p es: %p\n", autos[i]);
    		
            break;
        }
		
	}

}
