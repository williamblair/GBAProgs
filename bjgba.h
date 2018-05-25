/* Defines and such */

// Registers
#define REG_VIDBUF  0x6000000
#define REG_DISPCNT 0x4000000

// Video modes
#define MODE_3 0x3

// Backgrounds
#define BG2_ENABLE 0x400

// Macros
#define setVidMode(mode) \
    ((*(unsigned long *)REG_DISPCNT) = mode)

#define drawPixel(x, y, color) \
    (((unsigned short *)REG_VIDBUF)[y*240+x] = (unsigned short)color)

// Packs 0-31 RGB color into 16bit
#define RGB(r,g,b) \
    (r + (g<<5) + (b<<10))
    