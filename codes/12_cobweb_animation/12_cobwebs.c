#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double map(double x, double r){
    float xn = 0.0;
    xn = r*(x-x*x);
    return xn;
}

int main(int argc, char *argv[]){

    /* Open file */
    char filename[] = "12_cobwebs.txt";
    FILE *file = fopen(filename, "w");

    /* Check for errors*/
    if (file == NULL) {
        printf("Error while opeing file.\n");
        return 1;
    }

    /* Default r */
    double r = 0.0;
    double ic = 0.50;
    int iter = 150;
    double xnew, xold = 0.0;
    // printf("See 10_cobwebs.txt\n");
    // printf("   r = %5.3lf\n", r);
    // printf("  ic = %5.3lf\n", ic);
    // printf("iter = %5d\n", iter);

    
    while (r <= 4.0) {
        /* fprintf(file,"#r = %5.3lf\n",r); */
        xold = ic;
        xnew = map(xold, r);
        fprintf(file,"%lf\t%lf\n", xold, 0.0);
        fprintf(file,"%lf\t%lf\n", xold, xnew);
        xold = xnew;
        for (int i = 0; i < iter; i++) {
            xnew = map(xold, r);
            fprintf(file,"%lf\t%lf\n", xold, xold);
            fprintf(file,"%lf\t%lf\n", xold, xnew);
            xold = xnew;
        }
        r += 0.01;
        fprintf(file,"\n\n");
    }

    fclose(file);

    return 0;
} 
