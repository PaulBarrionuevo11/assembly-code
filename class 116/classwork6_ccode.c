// compile .asm code: yasm -g dwarf2 -f elf64 classwork6.asm
// call .asm and .c code: gcc -ocall classwork6_ccode.c classwork6.o
#include <stdio.h>

extern int bit_count(int a);

int main()
{
    int a = 255;

        
    int result = bit_count(a);
    
    // printf("Comparing %d: %d\n", a, result);
    
    // Test different cases
    printf( "%d\n", bit_count(a)); 
    // printf(bit_count(7));    
    // printf(bit_count(2));    
    
    return 0;

}