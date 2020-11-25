// Mode3Lines
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

// mode 3 draw line
// based on bresenham algorithm
static inline void DrawLine3(int x1, int y1, int x2, int y2, unsigned short color)
{
    int i;
    int dX, dY;
    int numPixels;
    int d, dInc1, dInc2;
    int x, xInc1, xInc2;
    int y, yInc1, yInc2;
    
    dX = abs(x2 - x1);
    dY = abs(y2 - y1);
    
    if (dX >= dY)
    {
        numPixels = dX + 1;
        d = 2*dY - dX;
        dInc1 = dY << 1;
        dInc2 = (dY - dX) << 1;
        xInc1 = 1;
        xInc2 = 1;
        yInc1 = 0;
        yInc2 = 1;
    }
    else
    {
        numPixels = dY + 1;
        d = 2*dX - dY;
        dInc1 = dX << 1;
        dInc2 = (dX - dY) << 1;
        xInc1 = 0;
        xInc2 = 1;
        yInc1 = 1;
        yInc2 = 1;
    }
    
    if (x1 > x2)
    {
        xInc1 = -xInc1;
        xInc2 = -xInc2;
    }
    
    if (y1 > y2)
    {
        yInc1 = -yInc1;
        yInc2 = -yInc2;
    }
    
    x = x1;
    y = y1;
    for (i = 1; i < numPixels; i++)
    {
        DrawPixel3(x, y, color);
        
        if (d < 0)
        {
            d = d + dInc1;
            x = x + xInc1;
            y = y + yInc1;
        }
        else
        {
            d = d + dInc2;
            x = x + xInc2;
            y = y + yInc2;
        }
    }
}

int main(void)
{
    int x[2];
    int y[2];
    unsigned short color;

    InitMode3();

    while (1)
    {
        x[0] = rand() % 240;
        y[0] = rand() % 160;
        x[1] = rand() % 240;
        y[1] = rand() % 160;
        color = RGB(rand()%31, rand()%31, rand()%31);
        DrawLine3(x[0], y[0], x[1], y[1], color);
    }

    return 0;
}


/* END OF FILE */
