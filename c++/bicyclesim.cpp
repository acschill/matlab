
// bicycle.cpp
// Computational Physics
#include <iostream>
#include <iomanip>
#include <math.h>
#include <stdio.h>
#include "gnuplot-iostream.h" #include <fstream>
using namespace std;
//g++ -g hw1_bicycle.cpp -o hw1_bicycle -lm //gnuplot -e "filename='hw1data.txt'" t.gnuplot
//constants
double power = 400; double mass = 70.0; double delt = 0.1; double area = 0.33;

 double dragcoeff = 0.5; double airdens = 1.255;
//variables for calculations with drag double veloc[200];
double velocwithout[200];
double t[2000];
double veloci = 4;
//variables for calculations without drag double veloc2[200];
double velocwithout2[200];
double t2[2000];
double veloci2 = 4;
//function declarations std::fstream fs;
void withDrag();
void withoutDrag();
int main(int argc, const char* argv[])
{
//open files that data will be written to
fs.open ("withData.txt", std::fstream::in | std::fstream::out | std::fstream::app); withDrag(); //call first fuction for calculations
fs.close(); //close file stream
fs.open ("withoutData.txt", std::fstream::in | std::fstream::out | std::fstream::app); withoutDrag(); //call second fuction for calculations
fs.close(); //close file stream
return 0; }
void withDrag()
{
int i;
double ti = 0.0;
for(i = 0; i < 400; i++)
{
// calculation of velocity and time (with drag)
velocwithout[i] = veloci + ((power*delt)/(mass*veloci));
veloc[i] = veloci + ((power*delt)/(mass*veloci)) - ((dragcoeff*airdens*area*veloci*veloci*delt)/
(2*mass));
t[i] = ti + delt;
//write to file
fs << left << t[i] << "
veloci = veloc[i];
ti = t[i]; }
double tj = ti;
" << right << veloc[i] << endl;

 double velocj = veloci; //fill out remaining time for(int j = i; j < 2000; j++)
{
t[j] = tj + delt;
fs << left << t[j] << " tj = t[j];
} }
void withoutDrag()
{
int i;
double ti = 0.0;
for(i = 0; i < 2000; i++)
{
// calculation of velocity and time (without drag) velocwithout2[i] = veloci2 + ((power*delt)/(mass*vi2)); veloc2[i] = veloci2 + ((power*delt)/(mass*veloci2)); t2[i] = ti + delt;
// write to file
fs << left << t2[i] << "
veloci2 = veloc2[i];
ti = t2[i]; }
}
//hold
" << right << velocj << endl;
" << right << veloc2[i] << endl;
