#include <stdio.h>

// Declare the external assembly function
extern void fib(int n, int *arr);

int main() {
    int n;
    int arr[10]; // Fixed-size array (max 10 elements)

    fib(n, arr);

    // Print the results
    printf("Fibonacci numbers:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}