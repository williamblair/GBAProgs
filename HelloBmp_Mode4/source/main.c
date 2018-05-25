#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "../../bjgba.h"

// our image (now with a palette for mode 4)
#include "../Untitled.raw.c"
#include "../Untitled.pal.c"

#define drawArray(arr) \
    (memcpy((void*)REG_VIDBUF, (void*)arr, sizeof(arr)))

int main(void)
{
    int i;
    
    // pointer to the GBA color palette
    unsigned short *paletteMem = (unsigned short *)REG_PALETTE;
    
    // Init the GBA vid system,
    // this time in mode 4
    setVidMode(MODE_4 | BG2_ENABLE);
    
    // copy the image palette in the GBA palette
    memcpy((void*)paletteMem, (void*)Untitled_Palette, 256*sizeof(int));
    
    // copy the image into the video buffer (specifying
    // palette entries instead of actual colors)
    drawArray(Untitled_Bitmap);
    
    // infinite loop
    for(;;){}
    
    return 0;
}
