// Mode3Pixels
// 11/20/2020

#include <stdlib.h>

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
    int x;
    int y;
    unsigned short color;
    
    InitMode3();
    
    while (1)
    {
        x = rand() % 240;
        y = rand() % 160;
        color = RGB(rand()%31, rand()%31, rand()%31);
        DrawPixel3(x,y,color);
    }
    
    return 0;
}


/* END OF FILE */
