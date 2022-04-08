#include <stdio.h>

int zadanie(unsigned char *massiv1, unsigned char *massiv2)
{
   int sum=0;
   __asm__
   (
      "movl $5, %%ecx\n\t"
      "lp:\n\t"
      "movb (%%rsi), %%al\n\t"
      "movb (%%rdi), %%bl\n\t"
      "mulb %%bl\n\t"
      "addw %%ax, %%dx\n\t"
      "inc %%rsi\n\t"
      "inc %%rdi\n\t" 
      "xorw %%ax, %%ax\n\t"
      "xorw %%bx, %%bx\n\t"
      "loop lp\n\t"
      :"=d"(sum)
      :"S"(massiv1), "D"(massiv2), "d"(sum)
      :"memory"
   );
   return sum;
}



int main()
{
   unsigned char massiv1[5]={1,2,3,4,5};
   unsigned char massiv2[5]={5,4,3,2,1};
   int summa=zadanie(massiv1,massiv2);
   printf("%d\n", summa);
   return 0;
}
