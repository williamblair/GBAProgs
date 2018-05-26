#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../../bjgba.h"

// declare the function prototype
void swapBuffs(void);

unsigned short *vidBufs[] = {
    (unsigned short*)REG_VIDBUF,
    (unsigned short*)(REG_VIDBUF + 0x00A000)
};
int curBuf = 0;

// vblank macro
#define waitVBlank() \
    while(*(volatile unsigned short *)REG_SCANLINE < 160)

/////////////////////////////////////////////////////////////
// Function: main()
// Entry point for the program
/////////////////////////////////////////////////////////////
int main(void)
{
    int n;
    
    // pointer to palette memory
    unsigned short* paletteMem = (unsigned short*)REG_PALETTE;
    
    //set video mode and start page flipping
    setVidMode(MODE_4 | BG2_ENABLE);
    swapBuffs();
    
    //set the first two palette entries
    paletteMem[1] = RGB(0, 31, 0);
    paletteMem[2] = RGB(31, 0, 0);
    
    // draw the first pixel
    drawPixel4_buf(100, 100, 1, vidBufs[curBuf]);
    
    //flip the page to the back buffer
    swapBuffs();
    
    //draw the second random box
    drawPixel4_buf(200, 100, 2, vidBufs[curBuf]);
    
    // Infinite loop
    for(;;)
    {
        //wait for vertical blank
        waitVBlank();
        
        //flip the page
        swapBuffs();
        
        //slow it down--modify as needed
        n = 500000;
        while(n--);
    }
    return 0;
}

// switch between front and back buffers
void swapBuffs(void)
{
    unsigned long *regDispcnt = (unsigned long *)REG_DISPCNT;
    
    if(*regDispcnt & 0x10)
    {
        *regDispcnt &= ~0x10;
    }
    else
    {
        *regDispcnt |= 0x10;
    }
    
    curBuf = !curBuf;
}
