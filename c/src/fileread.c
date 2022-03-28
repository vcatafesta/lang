#include "funcoes.c"

int ms_file(char *file)
{
	FILE *fp = fopen(file,"r");
	if(fp){
    fclose(fp);
	 return 1;
	}
	fp = fopen(file,"w");
	if(fp){
    fclose(fp);
	 return 1;
	}
	fprintf(stderr, "Erro de abertura de: %s\n", file);
	return 0;
}

void readfile(char *file){
	if(ms_file(file)){
		FILE *fp = fopen(file, "r");
		char line[255];
		fgets(line, 255, fp);
		fclose(fp);
		printf("%s", line);
	}
}

void writefile(char *file, char *psz){
	if(ms_file(file)){
		FILE *fp = fopen(file, "wa");
		fprintf(fp, psz);
		fclose(fp);
	}
}

int main(){
	char file[] = "vendedor.txt";
	char line[255];

	writefile(file, "VILMAR CATAFESTA, DevBoy\n");
	writefile(file, "EVILI FRANCIELE, Advocate\n");
	readfile(file);
	return 0;
}
