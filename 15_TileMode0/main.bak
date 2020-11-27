// Basic Mode0 tiling
// 11/26/2020

#define REG_DMA3SAD *(volatile unsigned int*)0x040000D4 // source address
#define REG_DMA3DAD *(volatile unsigned int*)0x040000D8 // dest address
#define REG_DMA3CNT *(volatile unsigned int*)0x040000DC // count and mode
#define DMA_ENABLE 0x80000000
#define DMA_TIMING_IMMEDIATE 0x00000000
#define DMA_16 0x00000000
#define DMA_32 0x04000000
#define DMA_32NOW (DMA_ENABLE | DMA_TIMING_IMMEDIATE | DMA_32)
#define DMA_16NOW (DMA_ENABLE | DMA_TIMING_IMMEDIATE | DMA_16)

// scrolling registers for background 0
#define REG_BG0HOFS *(volatile unsigned short*)0x04000010 // horizontal offset
#define REG_BG0VOFS *(volatile unsigned short*)0x04000012 // vertical offset

// background setup registers and data
#define REG_BG0CNT *(volatile unsigned short*)0x04000008
#define REG_BG1CNT *(volatile unsigned short*)0x0400000A
#define REG_BG2CNT *(volatile unsigned short*)0x0400000C
#define REG_BG3CNT *(volatile unsigned short*)0x0400000E
#define BG_COLOR256 0x80
#define CHAR_SHIFT 2
#define SCREEN_SHIFT 8
#define WRAPAROUND 0x1

// background tile bitmap sizes
#define TEXTBG_SIZE_256x256 0x0
#define TEXTBG_SIZE_256x512 0x8000
#define TEXTBG_SIZE_512x256 0x4000
#define TEXTBG_SIZE_512x512 0xC000

// background memory offset
#define CharBaseBlock(n) (((n)*0x4000)+0x06000000)
#define ScreenBaseBlock(n) (((n)*0x800)+0x06000000)

// background mode identifiers
#define BG0_ENABLE 0x100
#define BG1_ENABLE 0x200
#define BG2_ENABLE 0x400
#define BG3_ENABLE 0x800

// video identifiers
#define REG_DISPCNT *(unsigned int*)0x04000000
#define BGPaletteMem ((unsigned short*)0x05000000)
#define SetMode(mode) REG_DISPCNT = (mode)

// vertical refresh register
#define REG_DISPSTAT *(volatile unsigned short*)0x04000004

// button identifiers
#define BUTTON_RIGHT 16
#define BUTTON_LEFT 32
#define BUTTON_UP 64
#define BUTTON_DOWN 128
#define BUTTONS (*(volatile unsigned int*)0x04000130)


#include "test.pal.c"
#include "test.raw.c"
#include "test.map.c"


static void WaitVBlank(void)
{
    while ((REG_DISPSTAT) & 1);
}

static void DMAFastCopy(void* src, void* dst, unsigned int count, unsigned int mode)
{
    if (mode == DMA_16NOW || mode == DMA_32NOW)
    {
        REG_DMA3SAD = (unsigned int)src;
        REG_DMA3DAD = (unsigned int)dst;
        REG_DMA3CNT = count | mode;
    }
}

int main(void)
{
    int x = 0, y = 0;
    int n;

    unsigned short* bg0Map = (unsigned short*)ScreenBaseBlock(31);
    REG_BG0CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (31 << SCREEN_SHIFT) | WRAPAROUND;
    
    // video mode 0, background 0
    SetMode(0 | BG0_ENABLE);
    
    // copy the palette into the background palette memory
    DMAFastCopy((void*)test_Palette, (void*)BGPaletteMem, 256, DMA_16NOW);
    
    // copy the tile images into the tile memory
    DMAFastCopy((void*)test_Tiles, (void*)CharBaseBlock(0), 57984/4, DMA_32NOW);
    
    // copy the tile map into background 0
    DMAFastCopy((void*)test_Map, (void*)bg0Map, 512, DMA_32NOW);

    while (1)
    {
        WaitVBlank();
        
        if (!(BUTTONS & BUTTON_LEFT)) x--;
        if (!(BUTTONS & BUTTON_RIGHT)) x++;
        if (!(BUTTONS & BUTTON_UP)) y--;
        if (!(BUTTONS & BUTTON_DOWN)) y++;
        
        // use hardware background scrolling
        REG_BG0VOFS = y;
        REG_BG0HOFS = x;
        
        WaitVBlank();
        
        // delay
        for (n = 0; n < 4000; n++);
    }
    
    return 0;
}


