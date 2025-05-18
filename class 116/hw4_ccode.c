// Paul Barrionuevo
// Homework 4 C Code - Assembly Lenguage

#include <stdio.h>

extern int bit_multiplication(int a, int b);

int main()
{

    int a = 2;
    int b = 6;
    int result = 0;
        
    result = bit_multiplication(a, b);
    
    // printf("Comparing %d: %d\n", a, result);
    
    // Test different cases
    printf( "%d\n", result); 
    // printf(bit_count(7));    
    // printf(bit_count(2));  
    return 0;
}