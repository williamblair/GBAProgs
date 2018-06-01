/* Defines and such */

/********************************************************/
/**                 REGISTERS                          **/
/********************************************************/
#define REG_DISPCNT  0x4000000
#define REG_DISPSTAT 0x4000004
#define REG_SCANLINE 0x4000006
#define REG_PALETTE  0x5000000
#define REG_VIDBUF   0x6000000

#define DMA_ENABLE   0x8000000
#define DMA_IMMED    0x0000000

#define DMA_16       0x0000000
#define DMA_32       0x0400000

#define REG_BG0HOFS  0x4000010
#define REG_BG0VOFS  0x4000012

#define REG_BG0CNT   0x4000008
#define REG_BG1CNT   0x400000A
#define REG_BG2CNT   0x400000C
#define REG_BG3CNT   0x400000E

#define REG_DMA3SAD  0x40000D4
#define REG_DMA3DAD  0x40000D8
#define REG_DMA3CNT  0x40000DC

#define DMA_32NOW (DMA_ENABLE | DMA_IMMED | DMA_32)
#define DMA_16NOW (DMA_ENABLE | DMA_IMMED | DMA_16)

#define REG_BUTTONS  0x4000130

/********************************************************/
/**                   VIDEO MODES                      **/
/********************************************************/
#define MODE_0 0x0
#define MODE_3 0x3
#define MODE_4 0x4
#define MODE_5 0x5



/********************************************************/
/**                    BACKGROUNDS                     **/
/********************************************************/
#define BG0_ENABLE 0x100
#define BG1_ENABLE 0x200
#define BG2_ENABLE 0x400
#define BG3_ENABLE 0x800

#define BG_COLOR256 0x80

#define TEXTBG_SIZE_256x256 0x0000
#define TEXTBG_SIZE_256x512 0x8000
#define TEXTBG_SIZE_512x256 0x4000
#define TEXTBG_SIZE_512x512 0xC000


/********************************************************/
/**                   MODE 0 MACROS                    **/
/********************************************************/
static inline void dmaFastCopy(void *src, void *dest, 
                    unsigned int count, unsigned int mode)
{
    if(mode == DMA_16NOW || mode == DMA_32NOW)
    {
        *(volatile unsigned int *)REG_DMA3SAD = (unsigned int)src;
        *(volatile unsigned int *)REG_DMA3DAD = (unsigned int)dest;
    }   *(volatile unsigned int *)REG_DMA3CNT = count | mode;
}

// background memory offsets
#define CharBaseBlock(n) \
    (((n)*0x4000)+0x6000000)
#define ScreenBaseBlock(n) \
    (((n)*0x800)+0x6000000)

/********************************************************/
/**                   MODE 3 MACROS                    **/
/********************************************************/

// Mode 3 pixel plot (This is default for the moment)
#define drawPixel3(x, y, color) \
    (((unsigned short *)REG_VIDBUF)[(y)*240+(x)] = (unsigned short)(color))

// default drawpixel
#define drawPixel drawPixel3



/********************************************************/
/**                   MODE 4 MACROS                    **/
/********************************************************/
// draw a pixel in mode 4 to a specified buffer (for double buff)
static inline void drawPixel4_buf(int x, int y, int color, void *buf)
{
    // pointer to our buffer to draw to
    unsigned short *vidBuf = (unsigned short *)buf;
    
    // read the existing value, accessing divided by two
    // since two pixels are stuffed into a single unsigned short
    unsigned short offset = (y*240+x) >> 1;
    unsigned short pixel = vidBuf[offset];
    
    // determine if the pixel is odd or even
    if(x & 1)
    {
        // if odd, copy the color to the upper portion of the num
        vidBuf[offset] = (pixel & 0xFF00) + color;
    }
    else
    {
        // if even, copy the color to the lower portion of the num
        vidBuf[offset] = (pixel & 0x00FF) + (color << 8);
    }
    
    return;
}

// standard (no double buf) mode 4 pixel, just draw reguarly to vid buf
#define drawPixel4(x, y, color) \
    (drawPixel4_buf(x, y, color, (void*)REG_VIDBUF))




/********************************************************/
/**                   MODE 5 MACROS                    **/
/********************************************************/

// Mode 5 pixel plot
#define drawPixel5_buf(x, y, color, buf) \
    ((buf)[y*160+x] = (unsigned short)color)

// Default draw pixel for mode 5
#define drawPixel5(x, y, color) \
    drawPixel5_buf(x, y, color, (unsigned short *)REG_VIDBUF)




/********************************************************/
/**                    OTHER MACROS                    **/
/********************************************************/

// Init the Init GBA graphics
#define setVidMode(mode) \
    ((*(unsigned long *)REG_DISPCNT) = mode)

// Packs 0-31 RGB color into 16bit
#define RGB(r,g,b) \
    ((r) + ((g)<<5) + ((b)<<10))

// while the scanline runs across each horizontal line of the screen
#define waitVBlank() \
    while(*(volatile unsigned short *)REG_SCANLINE < 160)
    
    