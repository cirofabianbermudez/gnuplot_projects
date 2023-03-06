#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double func(double x, double y);

int main(void){

    FILE *file = fopen("09_slope.txt", "w");

    if (file == NULL) {
        printf("Error while opeing file.\n");
        return 1;
    }

    printf("See output file 09_slope.txt\n");

    double x_left, x_right, y_down, y_up = 0.0;
    x_left = 0.0; x_right = 10.0;
    y_down = 0.0; y_up = 2.0;

    double nx = 17.0;
    double hx = (x_right - x_left)/(nx - 1.0);

    double ny = 15.0;
    double hy = (y_up - y_down)/(ny - 1.0);

    double slope = 0.0;
    double angle = 0.0;
    double factor = 1.0;

    double x, y = 0.0;

    x = x_left;   y = y_down;
    for (int i = 0; i < nx; i++, x+=hx) {
        y = y_down;
        for (int j = 0; j < ny; j++, y+=hy) {
            slope = func(x,y);
            angle = atan(slope)*(180.0/M_PI);
            /* angle = atan(slope); */
            /* delta_x = global_factor*factor_x*cos(angle); */
            /* delta_y = global_factor*factor_y*sin(angle); */
            /* fprintf(file,"%10.7lf\t%10.7lf\t%10.7lf\t%10.7lf\n", x, y, delta_x, delta_y); */
            fprintf(file,"%10.7lf\t%10.7lf\t%10.7lf\t%10.7lf\t%10.7lf\n", x, y, factor, angle, slope);

        }
    }

    return 0;
} 

double func(double x, double y){
    double f = 0.0;
    f = y*(1.0 - y);
    return f;
}

