#include <iostream>
#include <cmath>
using namespace std;

void UpdatePosition(double pos[], double vel[], const double timeInc);
void UpdateVelocity(double vel[], const double acc[], const double timeInc);
void OutputPosition(double pos[]);


int main()
{
	const double acc[3] = { 0, .5, -9.81 }; // units m/s2 
	const double timeInc = .001; // unit s
	const double initialVelocity = 110; // units m/s
	const double target[3] = { 1000, 0, 0 }; // units m 
	double azimuth, elevation, time;
	double pos[3], vel[3];

	cout << "Elevation in degrees: "; 
	cin >> elevation;
	cout << "Azimuth in degrees: ";
	cin >> azimuth;

	time = 0; // initialize time 

	// initialize position and velocity variables to { 0, 0, 0 }
	pos[0] = pos[1] = pos[2] = 0.0;
	
	// initialize velocity components vel = { x, y, z }
	vel[0] = (initialVelocity*cos((elevation*3.1415926) / 180)); // velocity along x
	vel[1] = vel[0];
	vel[0] = vel[0] * cos((azimuth*3.1415926) / 180);
	vel[1] = vel[1] * sin((azimuth*3.1415926) / 180);
	vel[2] = (initialVelocity*sin((elevation*3.1415926) / 180));
	
	OutputPosition(pos);
	
	do
	{		 		
		UpdatePosition(pos, vel, timeInc);
		UpdateVelocity(vel, acc, timeInc);
		cout << "Time:    " << time << "s ";
		OutputPosition(pos);
		time += timeInc;
	} 
	
	while (pos[2] >= 0);

//Sqrt( (x1-x2)^2 + (y-y)^2 + (z-z)^2 ) distance formula
	cout << "missed by: " << sqrt( pow( (pos[0] - target[0]) , 2.0 ) + pow((pos[1] - target[1]), 2.0) ) << endl;
	cout << "Author: Alexander Schill" << endl;
	cout << "Azimuth = " << azimuth << " Elevation angle = " << elevation << endl;
	
	system("PAUSE");
	return 0;
}


void UpdatePosition(double pos[], double vel[], const double timeInc)
{
	pos[0] += vel[0] * timeInc; // x (east)
	pos[1] += vel[1] * timeInc; // y (north)
	pos[2] += vel[2] * timeInc; // z (up)
}

void UpdateVelocity(double vel[], const double acc[], const double timeInc)
{
	vel[0] +=  acc[0] * timeInc; // x (east)
	vel[1] +=  acc[1] * timeInc; // y (north)
	vel[2] +=  acc[2] * timeInc; // z (up)
}

void OutputPosition(double pos[])
{
	cout << " X-Pos:   " << pos[0] << "m" << " Y-Pos: " << pos[1] << "m" << " Height: " << pos[2] << endl;
}
