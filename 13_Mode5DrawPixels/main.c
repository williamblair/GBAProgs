// Mode5DrawPixels
// 11/21/2020

#include <stdlib.h>

#define REG_DISPCNT *(unsigned long*)0x04000000
#define MODE_5      0x5
#define BG_ENABLE   0x400

#define RGB(r,g,b) (unsigned short)(r | ((g) << 5) | ((b) << 10))

static inline void InitMode5()
{
    // switch to video mode 5 (160x128 16-bit)
    // 0x5 = 160x128,16bit, 0x400 = background 2
    REG_DISPCNT = (MODE_5 | BG_ENABLE);
}

// mode 5 draw pixel
static inline void DrawPixel5(int x, int y, unsigned short color)
{
    ((unsigned short*)0x06000000)[y * 160 + x] = color;
}

int main(void)
{
    int x;
    int y;
    unsigned short color;

    InitMode5();

    while (1)
    {
        x = rand() % 160;
        y = rand() % 128;
        color = RGB(rand()%31, rand()%31, rand()%31);
        DrawPixel5(x,y,color);
    }

    return 0;
}


/* END OF FILE */

