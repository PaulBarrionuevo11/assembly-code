#include <string.h>
#include <stdbool.h>
 
extern bool is_palindrome(const char* s, int len);

  

int main() {

    char str1[] = "civic";

    char str2[] = "kayak1";

    bool a1 = is_palindrome(str1, strlen(str1)); //true

    bool a2 = is_palindrome(str2, strlen(str2)); //false

}