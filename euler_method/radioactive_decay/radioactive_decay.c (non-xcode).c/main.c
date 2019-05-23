/*
 * radioactive_decay.c
 * Simulation of radioactive decay
 */

#include <math.h>
#include <stdio.h>
#define MAX 100

double n_uranium[MAX];  // number of uranium atoms/nuclei
double t[MAX];          // time values stored here
double dt;              // time step
double tau;             // decay time constant
double t_max;           // time to end simulation
double initialize(double *nuclei,double *t,double *tc,double *dt);
double calculate(double nuclei[],double t[],double tc,double dt);
double store(double nuclei[],double t[]);

int main()
{
    initialize(n_uranium,t,&tau,&dt);
    calculate(n_uranium,t,tau,dt);
    store(n_uranium,t);
}

// initialize variables
double initialize(double *nuclei,double *t,double *tc,double *dt)
//double *nuclei, *t, *tc, *dt;
{
    printf("initial number of nuclei -> ");
    scanf("%lf", &(nuclei[0]));     // begin using arrays @ index 0
    printf("time constant -> ");
    scanf("%lf", tc);
    printf("time step -> ");
    scanf("%lf", dt);
    t[0] = 0.0;
    return 0;
}

// calculate the results and storethem in the arrays t() and n_u()
double calculate(double nuclei[], double t[], double tc, double dt)
{
    int i;
    for(i = 0; i < MAX-1; i++)
    {
        nuclei[i+1] = nuclei[i] - (nuclei[i] / tc) * dt;
        t[i+1] = t[i] + dt;
    }
    return 0;
}

// save results to a file
double store(double nuclei[],double t[])
{
    FILE *fp_out;
    int i;
    fp_out = fopen("decay.txt", "w");

    for(i = 0; i < MAX ; i++)
    {
        fprintf(fp_out,"%g\t%g\n",t[i],nuclei[i]);
    }
    fclose(fp_out);
    return 0;
}
