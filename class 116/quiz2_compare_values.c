// Quiz #2 calling a compare function in C


#include <stdio.h>

extern int compare_values(int a, int b);

int main() {
    int a = 10;
    int b = 20;
    
    int result = compare_values(a, b);
    
    printf("Comparing %d and %d: %d\n", a, b, result);
    
    // Test different cases
    printf("5 vs 5: %d\n", compare_values(5, 5));    // Should print 0
    printf("7 vs 3: %d\n", compare_values(7, 3));    // Should print 1
    printf("2 vs 9: %d\n", compare_values(2, 9));    // Should print -1
    
    return 0;
}

