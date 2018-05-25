#include <stdio.h>
#include <stdlib.h>

#include "../../bjgba.h"

int main(void)
{
    int i;
    
    // pointer to the GBA color palette
    unsigned short *paletteMem = (unsigned short *)REG_PALETTE;
    
    // Init the GBA vid system,
    // this time in mode 4
    setVidMode(MODE_4 | BG2_ENABLE);
    
    // set random colors in the palette
    // don't set the very first entry as we always want it black
    for(i=1; i<256; i++) 
    {
        paletteMem[i] = RGB(rand() % 31, rand() % 31, rand() % 31);
    }
    
    // infinite loop
    for(;;)
    {
        // Set a pixel color in memory
        // instead of our specified color, we're specifying the location
        // in the palette to get the color from
        drawPixel4(rand() % 240, rand() % 160, rand() % 256);
    }
    
    return 0;
}
