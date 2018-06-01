#include <stdio.h>

#include "../../bjgba.h"

#include "../finaltiled.pal.c"
#include "../finaltiled.raw.c"
#include "../finaltiled.map.c"

#define CHAR_SHIFT 2
#define SCREEN_SHIFT 8
#define WRAPAROUND 0x1

// useful typedefs
#define uint     unsigned int
#define ushort   unsigned short
#define vuint    volatile unsigned int
#define vushort  volatile unsigned short

// Register pointers
vuint *dma3sad = (vuint *)REG_DMA3SAD;
vuint *dma3dad = (vuint *)REG_DMA3DAD;
vuint *dma3cnt = (vuint *)REG_DMA3CNT;

ushort *bg0map = (ushort *)ScreenBaseBlock(31);

vushort *bg0hofs = (vushort *)REG_BG0HOFS;
vushort *bg0vofs = (vushort *)REG_BG0VOFS;

vushort *bg0cnt = (vushort *)REG_BG0CNT;
vushort *bg1cnt = (vushort *)REG_BG1CNT;
vushort *bg2cnt = (vushort *)REG_BG2CNT;
vushort *bg3cnt = (vushort *)REG_BG3CNT;

uint   *dispcnt      = (uint *)REG_DISPCNT;
ushort *bgPaletteMem = (ushort *)REG_PALETTE;

vushort *dispstat = (vushort *)REG_DISPSTAT;

// buttons defines
#define BUTTON_RIGHT 16
#define BUTTON_LEFT  32
#define BUTTON_UP    64
#define BUTTON_DOWN  128
vuint *buttons = (vuint *)REG_BUTTONS;

int main(void)
{
    int x=0, y=0;
    int n;
    
    // Set up background 0
    *bg0cnt = BG_COLOR256 | TEXTBG_SIZE_256x256 |
                (31 << SCREEN_SHIFT) | WRAPAROUND;
    
    // Init the GBA vid system
    setVidMode(MODE_0 | BG0_ENABLE);
    
    // copy the palette into the bg palette mem
    dmaFastCopy((void*)finaltiled_Palette, (void*)bgPaletteMem,
                    256, DMA_16NOW);
                    
    // copy the tile images into tile memory
    dmaFastCopy((void*)finaltiled_Tiles, (void*)CharBaseBlock(0),
                    57984/4, DMA_32NOW);
    
    // copy the tile map into bg 0
    dmaFastCopy((void*)finaltiled_Map, (void*)bg0map, 
                    512, DMA_32NOW);
    
    // infinite loop
    for(;;)
    {
        // might need to change this...
        waitVBlank();
        
        // use hardware background scrolling
        *bg0vofs = y;
        *bg0hofs = x;
        
        // might need to change this...
        waitVBlank();
        
        // delay a bit
        for(n=0; n<4000; n++);
    }
    
    return 0;
}
