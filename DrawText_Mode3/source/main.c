#include <stdio.h>

#include "../../bjgba.h"
#include "../../bjfont.h"

// function prototypes
static void drawChar(int, int, char, unsigned short);
static void drawText(int, int, char *, unsigned short);

int main(void)
{
    
    // Init the GBA vid system
    setVidMode(MODE_3 | BG2_ENABLE);
    
    char *str = "TESTING...1...2...3...";
    int pos = 0;
    
    // print some stuff to the screen
    drawText(1, 1, "DRAWTEXT PROGRAM", RGB(31,0,0));
    drawText(1, 20, "()*+,-.0123456789:;<=>?@", RGB(0,31,0));
    drawText(1, 30, "ABCDEFGHIJKLMNOPQRSTUVWXYZ[/]", RGB(0,0,31));
    drawText(1, 50, "BE SURE TO USE ALL CAPS FOR THIS FONT...", RGB(0,31,31));
    
    // draw each characters in a different color
    while(*str)
    {
        drawChar(1+pos, 80, *str++, 0xBB + pos * 16);
        pos += 8;
    }
    
    // infinite loop
    for(;;)
    {
        
    }
    
    return 0;
}

// draw a single character to the screen
static void drawChar(int left, int top, char letter, unsigned short color)
{
    int x, y;
    int draw;
    for(y=0; y<8; y++)
    {
        for(x=0; x<8; x++)
        {
            // grab a pixel from the font
            draw = font[(letter-32) * 64 + y * 8 + x];
            
            // if the pixel we grabbed is 1 (W=1 in font.h)
            if(draw) {
                drawPixel(left + x, top + y, color);
            }
        }
    }
}

// draw a string to the screen, uses drawChar()
static void drawText(int left, int top, char *str, unsigned short color)
{
    int pos = 0;
    while(*str)
    {
        drawChar(left + pos, top, *str++, color);
        pos += 8; // width of a single character
    }
}