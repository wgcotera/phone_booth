#include "functions.h"

float get_money() 
{
    float moneda = 0, total = 0;

    while( moneda > -1) {
        
        printf("Ingrese Monedas: ");
        total += moneda;

        scanf("%f", &moneda);
    }
    return total;
}