/*
 * Drawing semi-transparent sprites
 * 12/07/2020
 */

#include <stdio.h>
#include <stdlib.h>

// converted via the grit application (via 64-bit binary in windows 10)
// https://www.cornac.com/projects/grit
#include "basketball.h"

//macro to change the video mode
#define SetMode(mode) REG_DISPCNT = (mode)

#define REG_DISPCNT *(volatile unsigned short*)0x4000000
#define BGPaletteMem ((unsigned short*)0x5000000)
#define REG_VCOUNT *(volatile unsigned short*)0x4000006
#define REG_DISPSTAT *(volatile unsigned short *)0x4000004
#define REG_BLDMOD *(unsigned short*)0x4000050
#define REG_COLEV *(unsigned short*)0x4000052

// Background enables
#define BG2_ENABLE 0x400

// VRam memory
#define videoBuffer ((unsigned short*)0x6000000)

//define object attribute memory state address
#define SpriteMem ((unsigned short*)0x7000000)

//define object attribute memory image address
#define SpriteData ((unsigned short*)0x6010000)

//define object attribute memory palette address
#define SpritePal ((unsigned short*)0x5000200)

// video modes 3-5, OAMData starts at 0x6010000 + 8192
#define SpriteData3 ((unsigned short*)(SpriteData + 8192))

// counter for VBlanks
#define ScanlineCounter ((volatile unsigned short*)0x04000006)

//misc sprite constants
#define OBJ_MAP_2D 0x0
#define OBJ_MAP_1D 0x40
#define OBJ_ENABLE 0x1000

//attribute0 stuff
#define ROTATION_FLAG 0x100
#define SIZE_DOUBLE 0x200
#define MODE_NORMAL 0x0
#define MODE_TRANSPARENT 0x400
#define MODE_WINDOWED 0x800
#define MOSAIC 0x1000
#define COLOR_16 0x0000
#define COLOR_256 0x2000
#define SQUARE 0x0
#define TALL 0x4000
#define WIDE 0x8000

//attribute1 stuff
#define ROTDATA(n) ((n) << 9)
#define HORIZONTAL_FLIP 0x1000
#define VERTICAL_FLIP 0x2000
#define SIZE_8 0x0
#define SIZE_16 0x4000
#define SIZE_32 0x8000
#define SIZE_64 0xC000

//attribute2 stuff
#define PRIORITY(n) ((n) << 10)
#define PALETTE(n) ((n) << 12)

typedef struct TagSprite
{
    unsigned short attrib0;
    unsigned short attrib1;
    unsigned short attrib2;
    unsigned short attrib3;
} Sprite;

Sprite* spritePtr;
Sprite sprites[128];

typedef struct SpriteHandlerTag
{
    int alive;
    int x;
    int y;
    int dirX;
    int dirY;
    int size;
    int colorMode;
    int trans;
} SpriteHandler;

SpriteHandler mySprites[128];

static inline void VSync()
{
    while(*ScanlineCounter < 160);
}

static inline void UpdateSpriteMemory()
{
    int n;
    unsigned short* temp;
    temp = (unsigned short*)sprites;

    for (n = 0; n < 128*4; n++)
    {
        SpriteMem[n] = temp[n];
    }
}

#define NUM_BALLS 5

static inline void HideSprites()
{
    int n;
    for (n = 0; n < 128; n++)
    {
        sprites[n].attrib0 = 160;
        sprites[n].attrib1 = 240;
    }
}

static inline void MoveSprite(int num)
{
    // clear old X value
    sprites[num].attrib1 = sprites[num].attrib1 & 0xFE00;
    sprites[num].attrib1 = sprites[num].attrib1 | mySprites[num].x;

    // clear the old Y value
    sprites[num].attrib0 = sprites[num].attrib0 & 0xFF00;
    sprites[num].attrib0 = sprites[num].attrib0 | mySprites[num].y;
}

// trans = MODE_NORMAL or MODE_TRANSPARENT
static inline void SetTransparency(int num, int trans)
{
    mySprites[num].trans = trans;
    sprites[num].attrib0 = mySprites[num].colorMode |
                            mySprites[num].trans |
                            mySprites[num].y;
}

static inline void InitSprite(int num,
                                int x, int y,
                                int size,
                                int tileIndex)
{
    unsigned int spriteSize = 0;

    mySprites[num].alive = 1;
    mySprites[num].size = size;
    mySprites[num].x = x;
    mySprites[num].y = y;
    mySprites[num].colorMode = COLOR_256;
    mySprites[num].trans = MODE_TRANSPARENT;

    // in modes 3-5, tiles start at 512, modes 0-2 start at 0
    sprites[num].attrib2 = tileIndex;

    sprites[num].attrib0 = COLOR_256 | MODE_TRANSPARENT | y;

    switch (size)
    {
        case 8: spriteSize = SIZE_8; break;
        case 16: spriteSize = SIZE_16; break;
        case 32: spriteSize = SIZE_32; break;
        case 64: spriteSize = SIZE_64; break;
        default:
            printf("ERROR - unhandled sprite size %d\n", size);
            return;
    }

    sprites[num].attrib1 = spriteSize | x;
}

int main(void)
{
    int counter = 0;
    int change = 0;
    unsigned short val = 0xF000;
    int n;
    int ballWidth = 32;
    int ballHeight = 32;

    // mode 3 with sprites, 1D contiguous sprite layout
    SetMode(3 | OBJ_ENABLE | OBJ_MAP_1D | BG2_ENABLE);

    // fill the BG with random color
    for (n = 0; n < (240*160); n++)
    {
        if (n % 240 == 0)
        {
            val += 0xF;
        }
        videoBuffer[n] = val;
    }

    // move all sprites off screen to hide them
    HideSprites();

    // set sprite palette
    for (n = 0; n < 256; n++)
    {
        SpritePal[n] = basketballPal[n];
    }

    // set sprite memory
    unsigned short* bmpPtr = (unsigned short*)basketballTiles;
    for (n = 0; n < basketballTilesLen; n++)
    {
        SpriteData3[n] = bmpPtr[n];
    }

    for (n = 0; n < NUM_BALLS; n++)
    {
        // 512 because in Mode3 there is a 512 tile offset
        InitSprite(n, rand() % 200, rand() % 120, ballWidth, 512);
        while (mySprites[n].dirX == 0) mySprites[n].dirX = rand() % 6 - 3;
        while (mySprites[n].dirY == 0) mySprites[n].dirY = rand() % 6 - 3;
    }
    
    // set transparency level
    REG_BLDMOD = (1 << 4) | (1 << 10);
    REG_COLEV = (8) + (8 << 8);

    while (1)
    {
        VSync();
        
        // toggle transparency
        if (counter++ > 1000)
        {
            counter = 0;
            if (change)
            {
                change = 0;
                for (n = 0; n < NUM_BALLS; n++)
                {
                    SetTransparency(n, MODE_NORMAL);
                }
            }
            else
            {
                change = 1;
                for (n = 0; n < NUM_BALLS; n++)
                {
                    SetTransparency(n, MODE_TRANSPARENT);
                }
            }
        }

        for (n = 0; n < NUM_BALLS; n++)
        {
            mySprites[n].x += mySprites[n].dirX;
            if (mySprites[n].x >  239 - mySprites[n].size)
            {
                mySprites[n].x = 239 - mySprites[n].size;
                mySprites[n].dirX *= -1;
            }
            if (mySprites[n].x < 1)
            {
                mySprites[n].x = 1;
                mySprites[n].dirX *= -1;
            }

            mySprites[n].y += mySprites[n].dirY;
            if (mySprites[n].y > 159 - mySprites[n].size)
            {
                mySprites[n].y = 159 - mySprites[n].size;
                mySprites[n].dirY *= -1;
            }
            if (mySprites[n].y < 1)
            {
                mySprites[n].y = 1;
                mySprites[n].dirY *= -1;
            }

            MoveSprite(n);
        }

        UpdateSpriteMemory();
    }

    return 0;
}



