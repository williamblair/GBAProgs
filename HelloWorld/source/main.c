#include <stdio.h>

#include "bjgba.h"

int main(void)
{
    
    // Init the GBA vid system
    setVidMode(MODE_3 | BG2_ENABLE);
    
    // Set a pixel color in memory
    drawPixel(120, 80, RGB(31,31,31));
    
    // infinite loop
    for(;;){}
    
    return 0;
}
