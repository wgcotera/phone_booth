#include "functions.h"

int main(void)
{
    printf("***** BIENVENIDO A LA CABINA TELEFONICA *****\n\n");

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
    // int boole;
    // call_simulator(total, cost);

    // COSTO Y DURACION DE LA LLAMADA
    // int duration = total/cost;
    // float fcost = cost*duration;
    int duration = call_simulator(total, cost);
    float fcost = cost*duration;
    printf("\n\nDuracion de la llamada: %d minutos.\n\n", duration);  
    printf("Costo de la llamada: $%.2f.\n\n", fcost);  

    // CAMBIO
    float dif = total - fcost;
    int mul = (dif/0.05);
    float change = mul * 0.05;
    printf("Cambio: $%.2f.\n\n", change);  

    return 0;
}