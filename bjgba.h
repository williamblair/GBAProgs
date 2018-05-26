/* Defines and such */

// Registers
#define REG_DISPCNT  0x4000000
#define REG_SCANLINE 0x4000006
#define REG_PALETTE  0x5000000
#define REG_VIDBUF   0x6000000

// Video modes
#define MODE_3 0x3
#define MODE_4 0x4

// Backgrounds
#define BG2_ENABLE 0x400

// Macros
#define setVidMode(mode) \
    ((*(unsigned long *)REG_DISPCNT) = mode)

#define drawPixel(x, y, color) \
    (((unsigned short *)REG_VIDBUF)[y*240+x] = (unsigned short)color)

// Packs 0-31 RGB color into 16bit
#define RGB(r,g,b) \
    ((r) + ((g)<<5) + ((b)<<10))
    
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
    