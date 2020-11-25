// DrawPixel
// 11/19/2020

int main(void)
{
    int x;
    int y;
    
    // create a pointer to the video buffer
    unsigned short* videoBuffer = (unsigned short*)0x06000000;

    // switch to video mode 3 (240x160 16-bit)
    // 0x3 = 240x160,16bit, 0x400 = background 2
    *(unsigned long*)0x04000000 = (0x3 | 0x400);

    // draw a white 16bit pixel directly to video memory
    x = 120;
    y = 80;
    videoBuffer[y * 240 + x] = 0xFFFF;

    while(1)
    {
    }

    return 0;
}


/* END OF FILE */
