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

int string_length(char *string) 
{
    int length = 0;
    while(string[length] != '\0') length++;
    return length;
}

int is_digit(char *number) 
{
    int length = 0;

    while(number[length] != '\0') 
    {
        if(number[length] < 48 || number[length] > 57 ) 
        {
            return 0;
        }
        length++;
    }
    return 1;   
}

int validate_number(char *number)
{
    int length = string_length(number);

    if(length != 10) {
        return 0;        
    } 

    else if (number[0] != '0' || number[1] != '9') {
        return 0;
    }
    
    else if (is_digit(number) == 0) {
        return 0;      
    }    

    return 1;
}

void get_number(char *number)
{
    while (validate_number(number) == 0)
    {
        printf("Ingrese el numero a llamar: ");
        scanf("%s", number);
    }
}