// Mode3Bitmap
// 11/21/2020

#include <stdlib.h>

// defined in peppers.raw.c
extern const unsigned short peppers_Bitmap[38400];

#define REG_DISPCNT *(unsigned long*)0x04000000
#define MODE_3      0x3
#define BG_ENABLE   0x400

#define RGB(r,g,b) (unsigned short)(r | ((g) << 5) | ((b) << 10))

static inline void InitMode3()
{
    // switch to video mode 3 (240x160 16-bit)
    // 0x3 = 240x160,16bit, 0x400 = background 2
    REG_DISPCNT = (MODE_3 | BG_ENABLE);
}

// mode 3 draw pixel
static inline void DrawPixel3(int x, int y, unsigned short color)
{
    ((unsigned short*)0x06000000)[y * 240 + x] = color;
}

int main(void)
{
    int x, y;
    
    InitMode3();

    for (x = 0; x < 240; x++)
    {
        for (y = 0; y < 160; y++)
        {
            DrawPixel3(x, y, peppers_Bitmap[y*240 + x]);
        }
    }

    while (1)
    {
    }

    return 0;
}


/* END OF FILE */

