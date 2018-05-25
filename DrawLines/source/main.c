#include <stdio.h>
#include <stdlib.h>

#include "../../bjgba.h"

// Bresenham line drawing algorithm
static void drawLine(int x1, int y1, int x2, int y2, unsigned short color)
{
    int x=0, y=0;
    
    // Get the change in x/y
    int deltax = x2 - x1;
    int deltay = y2 - y1;
    
    // If we aren't dealing with a straight line
    if(deltax != 0 && deltay != 0)
    {
    
        // Get whether we're moving up or down
        // (plus or minus 1)
        int slopeSign = deltay / abs(deltay);
        
        // assumes deltax != 0 and deltay != 0 (not a flat 
        // or vertical line)
        float deltaerror = abs(deltay / deltax);
        
        // no error to start
        float error = 0.0;
        
        for(x = x1; x <= x2; x++)
        {
            drawPixel(x, y, color);
            
            error += deltaerror;
            
            for( ; error >= 0.5; error -= 1.0)
            {
                y += slopeSign; // either plus or minus 1
            }
        }
    }
    // We're dealing with a straight line
    // assumes x1<=x2, y1<=y2
    else
    {
        // vertical line
        if(deltax == 0)
        {
            for(x=x1, y=y1; y<=y2; y++)
            {
                drawPixel(x,y,color);
            }
        }
        // horizontal line
        else
        {
            for(x=x1, y=y1; x<=x2; x++)
            {
                drawPixel(x,y,color);
            }
        }
    }
    return;
}

int main(void)
{
    
    // Init the GBA vid system
    setVidMode(MODE_3 | BG2_ENABLE);
    
    // Set a pixel color in memory
    //drawPixel(120, 80, RGB(31,31,31));
    
    drawLine(10, 10, 100, 10, 0xFFFF);
    
    // infinite loop
    for(;;){}
    
    return 0;
}
