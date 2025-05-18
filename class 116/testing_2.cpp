#include<stdio.h>

int main(void)
{
    char s[] = "hello world";
    *s = 'H';

    printf("%c", s);
}