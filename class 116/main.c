// Quiz #2 calling a compare function in C
// Paul Barrionuevo


#include <stdio.h>

// extern int compare_values(int a, int b);
extern int even_function(int a);

int main() {
    int a = 10;
    //int b = 20;
    
    // int result = compare_values(a, b);
    int result = even_function(a);

    printf("Is variable a Even or Odd %d: %d\n", a, result);
    
    // // Test cases
    printf("5 is Even or Odd?: %d\n", even_function(5));    // Should print 0
    printf("9 is Even or Odd?: %d\n", even_function(9));    // Should print 0
    printf("22 is Even or Odd?: %d\n", even_function(22));    // Should print 0

    
    return 0;
}


    // printf("Comparing %d and %d: %d\n", a, b, result);
    
    // // Test cases
    // printf("5 vs 5: %d\n", compare_values(5, 5));    // Should print 0
    // printf("7 vs 3: %d\n", compare_values(7, 3));    // Should print 1
    // printf("2 vs 9: %d\n", compare_values(2, 9));    // Should print -1
