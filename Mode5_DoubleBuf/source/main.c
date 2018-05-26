#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../../bjgba.h"

// function prototypes
static void swapBufs(void);

unsigned short *vidBufs[] = {
    (unsigned short *)REG_VIDBUF,
    (unsigned short *)(REG_VIDBUF + 0xA000)
};
int curBuf = 0;

int main(void)
{
    int n;
    
    // initialize gba video (in mode 5)
    setVidMode(MODE_5 | BG2_ENABLE);
    
    // flip the buffer
    swapBufs();
    
    // draw a pixel
    drawPixel5_buf(50, 100, RGB(0, 31, 0), vidBufs[curBuf]);
    
    // flip again
    swapBufs();
    
    // draw the pixel in the other buffer
    drawPixel5_buf(100, 100, RGB(31, 0, 0), vidBufs[curBuf]);
    
    // Infinite loop
    for(;;)
    {
        // wait for vsync
        waitVBlank();
        
        // swap buffers
        swapBufs();
        
        // wait a moment
        n = 50000;
        while(n--);
    }
    
    return 0;
}

// function implementation
static void swapBufs(void)
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
