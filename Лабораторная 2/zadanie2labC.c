#include "stdint.h"
#include <stdio.h>
uint16_t function(uint16_t x)
{
  uint16_t l=0x00ff&x;
  uint16_t h=0xff00&x;
  h=~h;
  h=0xff00&h;
  h+=l;
  return h;
}

int main()
{
  uint16_t massiv[10]={0x45, 0x4000, 0xF, 0x1, 0x2, 0x9, 0x1, 0x7, 0x123, 0xA};
  uint32_t summ=0;
  for(int i=0;i<10;i++)
  {
     massiv[i]=function(massiv[i]);
     if((massiv[i]%2)==0)
     {
        printf("%x\n", massiv[i]);
        summ +=massiv[i];
     }
  }
  printf("\n%x\n", summ);
  return 0;
}

