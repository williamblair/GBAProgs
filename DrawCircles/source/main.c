#include <stdio.h>
#include <stdlib.h>

#include "../../bjgba.h"

// Bresenham circle drawing algorithm
static void drawCircle(int cx, int cy, int radius, unsigned short color)
{
    int x = 0, y = radius;
    int p = 3 - 2*radius;
    while(x <= y)
    {
        drawPixel(cx+x, cy+y, color);
        drawPixel(cx-x, cy+y, color);
        drawPixel(cx+x, cy-y, color);
        drawPixel(cx-x, cy-y, color);
        drawPixel(cx+y, cy+x, color);
        drawPixel(cx-y, cy+x, color);
        drawPixel(cx+y, cy-x, color);
        drawPixel(cx-y, cy-x, color);
        
        
        if(p < 0)
            p += 4 * x++ + 6;
        else
            p += 4 * (x++ - y--) + 10;
    }
}

int main(void)
{
    
    // Init the GBA vid system
    setVidMode(MODE_3 | BG2_ENABLE);
    
    drawCircle(120, 80, 30, RGB(31,0,0));
    
    // infinite loop
    for(;;)
    {
    }
    
    return 0;
}
