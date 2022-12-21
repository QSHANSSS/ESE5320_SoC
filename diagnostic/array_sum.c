
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
void prefix(int *in, int *out, int len) {
	int sum = 0;
	for (int i = 0; i < len; i++) {
		sum += in[i];
		out[i] = sum;
	}
}
void read_ins(int *in, int len, FILE *fp) {
    char * line = NULL;
    ssize_t read;
    size_t line_len =0;
    int i=0;

    if (fp == NULL)   return;

    while (((read = getline(&line, &line_len, fp)) != -1) &&(i<len)) {
        //in[i]=atoi(line);
        //printf("lehgth:%zu ",read);
        in[i]=atoi(line);
        i++;
    }

    fclose(fp);
    if (line) free(line);
}

void write_outs(int *out, int len) {
	for (int i = 0; i < len; i++)
		printf("%d\n", out[i]);
}

int main(int argc, char **argv) {
	if (argc < 3) {
		fprintf(stderr, "Usage: arraysum len filename\n");
		exit(1);
	}
	// YOUR CODE HERE
	int len=5;
	printf(": %d\n",len);
	int *input=(int*)malloc(sizeof(int));
	int *output=(int*)malloc(sizeof(int));
	FILE *fp;
	fp = fopen("./test.txt", "r");
	read_ins(input,len,fp);
	prefix(input, output, len);
	write_outs(output, len);


	return(0);
}
