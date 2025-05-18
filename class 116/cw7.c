// Description: Classwork #7 ADDING MATRICES
// Author: Paul Barrionuevo

#include <stdio.h>

extern void _adding_matrices(int A[3][3], int B[3][3], int C[3][3]);

int main() {
    int A[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    int B[3][3] = {{9, 8, 7}, {6, 5, 4}, {3, 2, 1}};
    int C[3][3] = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};

    _adding_matrices(A, B, C);

    printf("Resulting matrix C:\n");
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            printf("%d ", C[i][j]);
        }
        printf("\n");
    }

    return 0;
}