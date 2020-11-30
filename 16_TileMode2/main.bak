// Mode2 Tiling with rotation
// 11/27/2020

#include <math.h>

#define REG_DMA3SAD *(volatile unsigned int*)0x040000D4 // source address
#define REG_DMA3DAD *(volatile unsigned int*)0x040000D8 // dest address
#define REG_DMA3CNT *(volatile unsigned int*)0x040000DC // control?
#define DMA_ENABLE 0x80000000
#define DMA_TIMING_IMMEDIATE 0x00000000
#define DMA_16 0x00000000
#define DMA_32 0x04000000
#define DMA_32NOW (DMA_ENABLE | DMA_TIMING_IMMEDIATE | DMA_32)
#define DMA_16NOW (DMA_ENABLE | DMA_TIMING_IMMEDIATE | DMA_16)

// scrolling registers for background 0
#define REG_BG0HOFS *(volatile unsigned short*)0x04000010 // horizontal offset
#define REG_BG0VOFS *(volatile unsigned short*)0x04000012 // vertical offset

// Registers for background 2
#define REG_BG2X  *(volatile unsigned int*)0x04000028
#define REG_BG2Y  *(volatile unsigned int*)0x0400002C
#define REG_BG2PA *(volatile unsigned short*)0x04000020
#define REG_BG2PB *(volatile unsigned short*)0x04000022
#define REG_BG2PC *(volatile unsigned short*)0x04000024
#define REG_BG2PD *(volatile unsigned short*)0x04000026

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

// To rotate the background
#define ROTBG_SIZE_128x128   0x0
#define ROTBG_SIZE_256x256   0x4000
#define ROTBG_SIZE_512x512   0x8000
#define ROTBG_SIZE_1024x1024 0xC000

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
#define BUTTON_A 1
#define BUTTON_B 2
#define BUTTON_L 512
#define BUTTON_R 256
#define BUTTONS (*(volatile unsigned int*)0x04000130)


#include "tiles.pal.c"
#include "tiles.raw.c"
#include "tiles.map.c"

// globals used to rotate the background
int x_scroll=0,y_scroll=0;
int DX=0,DY=0;
int PA,PB,PC,PD;
int zoom = 2;
int angle = 0;
int center_y,center_x;

// sin and cosine precalculates
float SIN[360];
float COS[360];

static inline float deg2rad(const float deg)
{
    return deg * (3.1415926535f / 180.0f);
}

void initSinAndCos()
{
    int i;
    for (i = 0; i < 360; i++)
    {
        //SIN[i] = (int)(sin(deg2rad((float)i))*(1<<8));
        SIN[i] = sin(deg2rad((float)i));
        //COS[i] = (int)(cos(deg2rad((float)i))*(1<<8));
        COS[i] = cos(deg2rad((float)i));
    }
}

static void RotateBackground(int ang, int cx, int cy, int zoom)
{
    center_y = (cy * zoom) >> 8;
    center_x = (cx * zoom) >> 8;
    
    DX = x_scroll - center_y * SIN[ang] - center_x * COS[ang];
    DY = y_scroll - center_y * COS[ang] + center_x * SIN[ang];
    
    PA = ((int)(COS[ang] * zoom)) >> 8;
    PB = ((int)(SIN[ang] * zoom)) >> 8;
    PC = ((int)(-SIN[ang] * zoom)) >> 8;
    PD = ((int)(COS[ang] * zoom)) >> 8;
}

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
    int n;
    int charbase = 0;
    int screenbase = 31;

    initSinAndCos();
    
    unsigned short* bg2map = (unsigned short*)ScreenBaseBlock(screenbase);
    
    REG_BG2CNT = BG_COLOR256 | ROTBG_SIZE_128x128 |
        (charbase << CHAR_SHIFT) | (screenbase << SCREEN_SHIFT);

    SetMode(2 | BG2_ENABLE);
    
    // Copy the palette to memory
    DMAFastCopy((void*)tiles_Palette, (void*)BGPaletteMem, 256, DMA_16NOW);

    // Copy the Tile images to memory
    DMAFastCopy((void*)tiles_Tiles, (void*)CharBaseBlock(0), 256/4, DMA_32NOW);
    
    // Copy the tile map into background 2
    DMAFastCopy((void*)tiles_Map, (void*)bg2map, 256 / 4, DMA_32NOW);

    while (1)
    {
        WaitVBlank();
        
        // buttons to hardware scroll
        if (!(BUTTONS & BUTTON_LEFT)) x_scroll--;
        if (!(BUTTONS & BUTTON_RIGHT)) x_scroll++;
        if (!(BUTTONS & BUTTON_UP)) y_scroll--;
        if (!(BUTTONS & BUTTON_DOWN)) y_scroll++;
        if (!(BUTTONS & BUTTON_A)) zoom--;
        if (!(BUTTONS & BUTTON_B)) zoom++;
        if (!(BUTTONS & BUTTON_L)) angle--;
        if (!(BUTTONS & BUTTON_R)) angle++;
        
        if (angle >= 360) angle -= 360;
        if (angle < 0) angle += 360;
        
        RotateBackground(angle, 64, 64, zoom);
        
        WaitVBlank();
        
        REG_BG2X = 64;
        REG_BG2Y = 64;
        REG_BG2PA = 0;
        REG_BG2PB = 0;
        REG_BG2PC = 0;
        REG_BG2PD = 0;
//        REG_BG2X = DX;
//        REG_BG2Y = DY;
//        REG_BG2PA = PA;
//        REG_BG2PB = PB;
//        REG_BG2PC = PC;
//        REG_BG2PD = PD;
        
        WaitVBlank();
        for (n = 0; n < 100000; n++);
    }

    return 0;
}



