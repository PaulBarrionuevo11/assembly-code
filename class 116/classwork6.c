#include <stdio.h>

extern int bit_count(int a);

int main()
{
    int a = 10;

        
    int result = compare_values(a);
    
    printf("Comparing %d and %d: %d\n", a, result);
    
    // Test different cases
    printf("5 vs 5: %d\n", compare_values(5)); 
    printf("7 vs 3: %d\n", compare_values(7));    
    printf("2 vs 9: %d\n", compare_values(2));    
    
    return 0;

}