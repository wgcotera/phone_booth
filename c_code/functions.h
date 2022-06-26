#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

int valid_coin(float array[], int length, float value);

float get_money();

int string_length(char *string);

int is_digit(char *number);

int validate_number(char *number);

void get_number(char *number);

float rand_cost();

int call_simulator(float total, float cost);

void call_simulator1(float total, float cost);