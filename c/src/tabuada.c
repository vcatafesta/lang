#include <stdio.h>

#define LIN 10
#define COL 10

int main()
{
  int x;                          /* numero da coluna */
  int y;                          /* numero da linha  */
  int tabela[LIN] [COL];          /* tabela de taboada  */
  
  /* preenche a tabela */
  
  for(y=0; y < LIN; y+=1)
    for(x=0; x < COL; x+=1)
      tabela[y][x] = y*x;
  
  printf("\n         Tabela de Multiplicacao\n");
  
  /* Imprime o numero das colunas */
  
  printf("%6d", 0);
  for (x=1; x < COL; x+=1)
    printf("%3d", x);
  printf("\n");
  
  /* Imprime uma linha horizontal */
  printf("   ");
  for (x=0; x < 3*COL; x+=1)
    printf("-");
  printf("\n");
  
  /* Imprime as linhas da tablea.
     Cada linha a precedida pelo indice de linha e uma barra vertical */
  
  for (y=0; y < LIN; y+=1) {
    printf("%2d|", y);
    for(x=0; x < COL; x+=1)
      printf("%3d", tabela[y][x]);
    printf("\n");
  }
  return 0;
}
