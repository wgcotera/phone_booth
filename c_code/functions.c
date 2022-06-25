#include "functions.h"

// VALID COINS
float valid_coins[] = {0.05, 0.10, 0.25, 0.50, 1.0};
int length_valid_coins = 5;

int valid_coin(float array[], int length, float value)
{
    for(int i = 0; i < length; i++) 
    {
        if(array[i] == value) 
        {
            return 1;
        }
    }
    return 0;
}

float get_money() 
{
    float moneda = 0, total = 0;

    while( moneda > -1) {

        printf("Ingrese Monedas: ");
        scanf("%f", &moneda);
        if(valid_coin(valid_coins, length_valid_coins, moneda) == 1) {
            total += moneda;
        } else if (moneda == -1) {
            return total;
        } else {
            printf("  --- MONEDA INCORRECTA --- \n");
        }
    }
    
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
    printf("Ingrese el numero a llamar: ");
    scanf("%s", number);

    while (validate_number(number) == 0)
    {
        printf("\nNumero ingresado equivocado...\nIngrese el numero a llamar: ");
        scanf("%s", number);
    }
}

float rand_cost()
{
    srand(time(NULL));
    int r = rand() % 31;
    return (r+10.0)/100;
}

void call_simulator(float total, float cost) 
{
    float sub = total - cost;
    for(int i = 1; sub > 0 ; i++) {
        printf("%d. Llamada en curso... Presiona C para colgar\n", i);
        sub -= cost;
        fflush(stdout);
        sleep(1);
    }
}