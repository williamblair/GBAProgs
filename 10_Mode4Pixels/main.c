// Mode4Pixels
// 11/21/2020

#include <stdlib.h>

#define REG_DISPCNT *(unsigned long*)0x04000000
#define MODE_3      0x3
#define MODE_4      0x4
#define BG_ENABLE   0x400

#define RGB(r,g,b) (unsigned short)((r) | ((g) << 5) | ((b) << 10))

// optional palette to load, if NULL sets random vals
// assumes palette size of 256 u16s
static inline void InitMode4(unsigned short* palette)
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

// mode 4 draw pixel
static inline void DrawPixel4(int x, int y, unsigned char color)
{
    unsigned short newVal;
    unsigned int index = (y * 240 + x) >> 1;
    unsigned short curVal = ((unsigned short*)0x06000000)[index];
    
    if (x & 1)
    {
        newVal = (curVal & 0xFF00) | color;
    }
    else
    {
        newVal = (color << 8) | (curVal & 0x00FF);
    }
    
    ((unsigned short*)0x06000000)[index] = newVal;
}

int main(void)
{
    int x, y;
    unsigned char color;

    InitMode4(NULL);

    while (1)
    {
        x = rand() % 240;
        y = rand() % 160;
        color = rand() % 256;
        DrawPixel4(x, y, color);
    }

    return 0;
}


/* END OF FILE */


