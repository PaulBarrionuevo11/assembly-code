#include <iostream>
#include "C:\Users\pable\OneDrive\Escritorio\CImg-master\CImg-master\CImg.h"
using namespace cimg_library;
using namespace std;

// ptr color image
// gtr grey image

__declspec(naked) void my_asm_function(unsigned char* ptr, unsigned char* gtr, int h, int w) {
    __asm {
        push ebp;
        mov ebp, esp;

        // Load parameters
        mov edi, [ebp + 8]; //color ptr
        mov esi, [ebp + 12]; //grey ptr
        mov eax, [ebp + 16]; //height
        mov ebx, [ebp + 20]; //width

        mov ecx, eax   // Counter value1 is height
        imul ecx, ebx  // Value storing h*w
        test ecx, ecx
        jz done        // If h * w == 0, exit

        mov r8d, ecx  // Move value from h*w
        add r8d, ecx  // Multiplication by 2 of the same number (h*w)


    pixel_loop :
        // Load R, G, B values
        movzx eax, byte ptr[edi]         // R (from ptr)
        movzx ebx, byte ptr[edi + edx]   // G (from ptr + w * h)
        movzx ecx, byte ptr[edi + r8d]   // B (from ptr + 2 * w * h)

        // Compute average: (R + G + B) / 3
        add eax, ebx
        add eax, ecx         // eax = R + G + B
        mov ebx, 3
        xor edx, edx         // Clear edx for division
        div ebx              // eax = (R + G + B) / 3, edx = remainder

        // Apply threshold
        cmp eax, 150
        jbe set_black
        mov eax, 255         // p = 255 if average > 150
        jmp store_pixel
    set_black :
        xor eax, eax         // p = 0 if average <= 150

    store_pixel :
        // Store grayscale value
        mov[esi], al        // Store p in gtr
            inc edi              // Move to next R pixel
            inc esi              // Move to next grayscale pixel
            dec r9d              // Decrement pixel counter
            jnz pixel_loop       // Continue if pixels remain
    done:
        // Restore registers and stack
        pop edi
        pop esi
        pop ebx
        mov esp, ebp
        pop ebp
        ret

    };
}

void grey_image(unsigned char* ptr, unsigned char* gtr, int h, int w)
{
    for (int r = 0; r < h; r++) {
        for (int i = 0; i < w; i++) {
            unsigned char p = ((*ptr) + (*(ptr + w * h)) + (*(ptr + 2 * (w * h)))) / 3;
            if (p > 150) {
                p = 255;
            }
            else {
                p = 0;
            }
            *gtr = p;
            ptr++;
            gtr++;
        }
    }
}

int main()
{
    //https://cimg.eu/CImg_slides.pdf
    //CImg<unsigned char> img(300, 200, 1, 3);
    //img.fill(32);
    //img.noise(90);
    //img.blur(2.0, 0, false);

    //const unsigned char white[] { 255,255,255 };

    //img.draw_text(80, 80, "Hello World", white, 0, 32);
    CImg<unsigned char> img("C:\\Users\\pable\\Documents\\Ohlone\\Assembly Lenguage\\sample1.bmp");
    int w = img.width();
    int h = img.height();
    CImg<unsigned char> imgg(w, h);
    cout << " Width:" << w << "   Hight:" << h << endl;
    //CImg<unsigned char>  f = img.channel(1);
    //f.display();

    unsigned char* ptr = img.data();
    unsigned char* gtr = imgg.data();
    grey_image(ptr, gtr, h, w);
    my_asm_function((unsigned char*)ptr, (unsigned char*)gtr, h, w);
    ////this part into assembly
    //__asm {
    //    mov eax, 10;
    //};

    imgg.display();
}