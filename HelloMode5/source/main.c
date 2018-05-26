#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../../bjgba.h"

int main(void)
{
    int x, y;
    unsigned short color;
    
    // initialize gba video (in mode 5)
    setVidMode(MODE_5 | BG2_ENABLE);
    
    // Infinite loop
    for(;;)
    {
        // resolution is l60x128
        x = rand() % 160;
        y = rand() % 128;
        color = RGB(rand() % 31, rand() % 31, rand() % 31);
        
        drawPixel5(x, y, color);
    }
    
    return 0;
}
