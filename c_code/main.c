#include "functions.h"

int main(void)
{
    // // GET THE COINS AND RETURN THE TOTAL
    float total = get_money();
    printf("Total: $ %.2f.\n", total);

    // // GET AND VALIDATE THE NUMBER 
    char phone[15]; 
    get_number((char *) &phone);
    printf("El numero ingresado es %s.\n", phone);    

    // COSTO DE LLAMADA ALEATORIO ENTRE 0.10 Y 0.40
    float cost = rand_cost();
    printf("Costo de la llamada: $%.2f.\n", cost);    











// PRUEBAS
    // char c3[15];
    // printf("give: ");
    // scanf("%s",c3);
    // printf("El puto es: %s \n", c3);

    // int length = string_length(c3);
    // printf("La long es: %d \n", length);

    // int digit = is_digit(c3);
    // printf("Is digit: %d \n", digit);

    // int validate = validate_number(c3);
    // printf("Is a valid number: %d \n", validate);

    return 0;
}