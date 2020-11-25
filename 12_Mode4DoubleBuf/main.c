// Mode4DoubleBuf
// 11/21/2020

#include <stdlib.h>
#include <string.h>

#define REG_DISPCNT *(unsigned long*)0x04000000
#define MODE_3      0x3
#define MODE_4      0x4
#define BG_ENABLE   0x400

#define RGB(r,g,b) (unsigned short)((r) | ((g) << 5) | ((b) << 10))

// optional palette to load, if NULL sets random vals
// assumes palette size of 256 u16s
static inline void InitMode4(const unsigned short* palette)
{
    int i;
    unsigned short* paletteMem = (unsigned short*)0x05000000;

    // switch to video mode 4 (240x160 8-bit palletized)
    // 0x4 = 240x160,8bit, 0x400 = background 2
    REG_DISPCNT = (MODE_4 | BG_ENABLE);

    if (palette == NULL)
    {
        paletteMem[0] = 0x00;
        for (i = 1; i < 256; i++)
        {
            paletteMem[i] = RGB(rand() % 31, rand() % 31, rand() % 31);
        }
    }
    else
    {
        for (i = 0; i < 256; i++)
        {
            paletteMem[i] = palette[i];
        }
    }
}

// switches between the front and back buffer for drawing 
// and make the opposite displayed
#define BACKBUFFER 0x10
unsigned short* videoMem = (unsigned short*)0x06000000;
static inline void SwapBufMode4()
{
    if (REG_DISPCNT & BACKBUFFER)
    {
        REG_DISPCNT &= ~BACKBUFFER; // switch backbuffer flag off
        videoMem = (unsigned short*)0x0600A000; // draw to the backbuffer
    }
    else
    {
        REG_DISPCNT |= BACKBUFFER; // switch backbuffer flag on
        videoMem = (unsigned short*)0x06000000; // draw to the front buffer
    }
}

volatile unsigned short* scanlineCounter =
    (volatile unsigned short*)0x04000006;
static inline void WaitVBlank()
{
    while(*scanlineCounter < 160);
}

// mode 4 draw pixel
static inline void DrawPixel4(int x, int y, unsigned char color)
{
    unsigned short newVal;
    unsigned int index = (y * 240 + x) >> 1;
    unsigned short curVal = videoMem[index];

    if (x & 1)
    {
        newVal = (color << 8) | (curVal & 0x00FF);
    }
    else
    {
        newVal = (curVal & 0xFF00) | color;
    }

    videoMem[index] = newVal;
}

// mode 4 fill rectangle
static inline void FillRect4(int x, int y, int w, int h, unsigned char color)
{
    int endX = x + w;
    int endY = y + h;
    int curY;
    for (; x < endX; x++)
    {
        for (curY = y; curY < endY; curY++)
        {
            DrawPixel4(x, curY, color);
        }
    }
}

int main(void)
{
    int n;
    unsigned short palette[256];
    memset(palette, 0, 256);

    palette[1] = RGB(0, 31, 0);
    palette[2] = RGB(31, 0, 0);
    InitMode4(palette);

    SwapBufMode4();
    FillRect4(20, 20, 50, 50, 1);
    
    SwapBufMode4();
    FillRect4(70, 20, 50, 50, 2);

    while (1)
    {
        WaitVBlank();
        SwapBufMode4();
        n = 500000;
        while (n > 0) n--;
    }

    return 0;
}


/* END OF FILE */


