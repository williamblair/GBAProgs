// Mode3Circles
// 11/21/2020

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

// Mode 3 draw circle
static inline void DrawCircle3(int x, int y, int radius, unsigned short color)
{
    int curX = 0;
    int curY = radius;
    int p = 3 - 2 * radius;
    while (curX <= curY)
    {
        DrawPixel3(x + curX, y + curY, color);
        DrawPixel3(x - curX, y + curY, color);
        DrawPixel3(x + curX, y - curY, color);
        DrawPixel3(x - curX, y - curY, color);
        DrawPixel3(x + curY, y + curX, color);
        DrawPixel3(x - curY, y + curX, color);
        DrawPixel3(x + curY, y - curX, color);
        DrawPixel3(x - curY, y - curX, color);
        
        if (p < 0)
        {
            p += 4 * curX++ + 6;
        }
        else
        {
            p += 4 * (curX++ - curY--) + 10;
        }
    }
    
}

int main(void)
{
    int x, y;
    int radius;
    unsigned short color;

    InitMode3();

    while (1)
    {
        x = rand() % 240;
        y = rand() % 160;
        radius = rand() % 50;
        color = RGB(rand()%31, rand()%31, rand()%31);
        DrawCircle3(x, y, radius, color);
    }

    return 0;
}


/* END OF FILE */

