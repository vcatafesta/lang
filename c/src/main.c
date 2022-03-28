#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int fopen2() {
   FILE * pFile;
   pFile = fopen("arquivo.txt" , "a" );

   if(pFile!=NULL) {
      fputs("fopen example" ,pFile);
      fclose(pFile);
   }
   return 0;
}

struct _tperson {
   char arquivo[100];
   char texto[100];
};
typedef struct _tperson TPERSON;

int main() {
   TPERSON fp;
   FILE *pFile;

   strcpy(fp.arquivo, "VILMAR.TXT");
   printf("fp.file         : %s\n", fp.arquivo);
   pFile = fopen(fp.arquivo, "a");
   printf("pFile->_charbuf : %d\n", pFile->_charbuf);
   printf("pFile->_file    : %d\n", pFile->_file);
   printf("pFile->_bufsiz  : %d\n", pFile->_bufsiz);


   if(pFile != NULL) {
      printf("Entre conteudo do arquivo : \n");
      scanf("%s", &fp.texto);
      fputs(fp.texto, pFile);
      fclose(pFile);
   }
   return 0;
}


