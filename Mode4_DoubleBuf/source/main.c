#include <stdio.h>
#include <stdlib.h>

#include "../../bjgba.h"

// pointer to the GBA color palette
unsigned short *paletteMem = (unsigned short *)REG_PALETTE;

// pointers to the front and back video buffer (for mode 4)
unsigned short *vidBufs[2] = {
    (unsigned short *)REG_VIDBUF,
    (unsigned short *)(REG_VIDBUF + 0xA000)
};
int curBuf=0;

static void flipBuffer(void)
{
    unsigned long *regDispcnt = (unsigned long *)REG_DISPCNT;
    if(*regDispcnt & 0x10) // 16 in hex
    {
        *regDispcnt &= ~0x10;
    }
    else
    {
        *regDispcnt |= 0x10;
    }
    
    curBuf = !curBuf;
}

// VBlank macro
#define waitVBlank() \
    while((*(int *)REG_SCANLINE) < 160)

int main(void)
{
    int i;
    
    // Init the GBA vid system,
    // this time in mode 4
    setVidMode(MODE_4 | BG2_ENABLE);
    
    
    // flip to the back buffer
    flipBuffer();
    
    // we only need to use two colors so just set the first ones
    // in the palette
    *paletteMem = RGB(0, 31, 0);
    *paletteMem = RGB(31, 0, 0);
    
    // draw a pixel in the back buffer
    drawPixel4_buf(100, 100, 1, vidBufs[curBuf]);
    
    // flip to the front buffer
    flipBuffer();
    
    // draw a pixel in the front buffer
    drawPixel4_buf(200, 100, 2, vidBufs[curBuf]);
    
    // infinite loop
    for(;;)
    {
        // Wait for the scanline to scan each horizontal row (160)
        waitVBlank();
        
        // switch buffers
        flipBuffer();
        
        // slow down the flip
        i = 500000;
        while(i--);
    }
    
    return 0;
}
