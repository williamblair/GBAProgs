#include <mygba.h>

MULTIBOOT

int main(void)
{
   ham_Init();

    ham_InitText(0);

   while(TRUE)
   {
       ham_DrawText(0, 0, "Greetings");
       ham_DrawText(0, 2, "Welcome to the World of");
       ham_DrawText(0, 4, "Gameboy Advance Programming");
   }

   return 0;
}


/* END OF FILE */
