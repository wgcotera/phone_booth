#include "functions.h"

int main(void)
{

    // // GET THE COINS AND RETURN THE TOTAL
    float total = get_money();
    printf("\nTotal: $ %.2f.\n\n", total);

    // // GET AND VALIDATE THE NUMBER 
    char phone[15]; 
    get_number((char *) &phone);

    // COSTO DE LLAMADA ALEATORIO ENTRE 0.10 Y 0.40
    float cost = rand_cost();
    printf("\nCosto por minuto: $%.2f.\n\n", cost);    

    // SIMULAR LLAMADA
    call_simulator(total, cost);

    // COSTO Y DURACION DE LA LLAMADA
    int duration = total/cost;
    float fcost = cost*duration;
    printf("\nDuracion de la llamada: %d minutos.\n\n", duration);  
    printf("\nCosto de la llamada: $%.2f.\n\n", fcost);  

    // CAMBIO
    float dif = total - fcost;
    int mul = (dif/0.05);
    float change = mul * 0.05;
    printf("\nCambio: $%.2f.\n\n", change);  

// PRUEBAS
    // char c3[15];
    // printf("give: ");
    // scanf("%s",c3);
    // printf("El numero es: %s \n", c3);

    // int length = string_length(c3);
    // printf("La long es: %d \n", length);

    // int digit = is_digit(c3);
    // printf("Is digit: %d \n", digit);

    // int validate = validate_number(c3);
    // printf("Is a valid number: %d \n", validate);

    return 0;
}