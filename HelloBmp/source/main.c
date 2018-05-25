#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../../bjgba.h"

// The array version of the image to draw
#include "../Untitled.raw.c"

// copy a given array into the video buffer
#define drawArray(arr) \
    (memcpy((void*)REG_VIDBUF, (void*)arr, sizeof(arr)))

int main(void)
{
    // Init the GBA vid system
    setVidMode(MODE_3 | BG2_ENABLE);

    // test...    
    drawArray(Untitled_Bitmap);
    
    printf("Test HELLO WORLD!\n");
    
    // infinite loop
    for(;;){}
    
    return 0;
}
