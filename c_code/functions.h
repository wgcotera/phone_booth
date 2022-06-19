#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

float get_money();

int string_length(char *string);

int is_digit(char *number);

int validate_number(char *number);

void get_number(char *number);

float rand_cost();

void call_simulator(float total, float cost);