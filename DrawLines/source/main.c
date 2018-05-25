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
    // since the line function assumes x1<=x2, y1<=y2
    // we'll just use a random length for x and y and always
    // add it to x1/y1
    int x1, deltax;
    int y1, deltay;
    
    // random color
    int r,g,b;
    
    // Init the GBA vid system
    setVidMode(MODE_3 | BG2_ENABLE);
    
    // infinite loop
    for(;;)
    {
        // starting point
        x1 = rand() % 240;
        y1 = rand() % 160;
        
        // how far to go x and y
        deltax = rand() % 240;
        deltay = rand() % 160;
        
        // make sure we don't go off the screen
        if(x1+deltax >= 240) deltax -= 240 - (x1+deltax);
        if(y1+deltay >= 160) deltay -= 160 - (y1+deltay);
        
        // colors
        r = rand() % 31;
        g = rand() % 31;
        b = rand() % 31;
        
        // draw the line
        drawLine(x1,y1, x1+deltax, y1+deltay, RGB(r,g,b));
    }
    
    return 0;
}
