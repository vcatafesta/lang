#include <stdio.h>
#include <dos.h>

#define MEM 0x12


void main()
{
    struct WORDREGS {
        unsigned int ax;
        unsigned int bx;
        unsigned int cx;
        unsigned int dx;
        unsigned int si;
        unsigned int di;
        unsigned int flags;
    };

    struct BYTEREGS {
        unsigned char al, ah;
        unsigned char bl, bh;
        unsigned char cl, ch;
        unsigned char dl, dh;
    };

    union REGS {
        struct WORDREGS x;
        struct BYTEREGS h;
    };
    union REGS regs;
    unsigned int tam;
    int86(MEM, &regs, &regs);
    tam = regs.x.ax;
    printf("Tamanho da memoria: %d Kb", tam);
      
            
}

