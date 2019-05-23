#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>
#include "windows.h"
using namespace std;

int start_Array[24][79];
int update_Array[24][79];
void manifest(int p[23][79]);
void mult_cycles(int p[23][79]);
void calculate_Array(int[23][79], int[23][79]);


const int num_cycles = 120;
int counter = 0;
//const float barrier = 60;


int main(int argc, const char * argv[])
{
	//   srand( static_cast<unsigned int>(time(NULL)));

	for (int a = 1; a < 23; a++)
	{
		for (int b = 1; b < 78; b++)
		{
			start_Array[a][b] = 0;
			/*
			if (rand()%100<(barrier))
			start_Array[a][b] = 1;
			else  start_Array[a][b] = 0;  */
		}
	}

	ifstream ifile;
	ifile.open("gg.txt");
	int a;
	int b;

	if (!ifile.is_open())
	{
		cout << "File is not open" << endl;
	}


	while (!(ifile.eof()))

	{
		ifile >> b >> a;
		start_Array[a][b] = 1;
	}


	//manifest(start_Array);
	mult_cycles(start_Array);
	cout << "Author: Alexander Schill" << endl;
	system("PAUSE");
	return 0;
}



// create array
void manifest(int p[23][79])

{
	double x = 0;
	double y = 0;
	double fill_percent;


	for (int a = 0; a < 23; a++)
	{
		for (int b = 0; b < 79; b++)
		{
			if (p[a][b] == 0)
			{
				cout << " ";
				x++;
			}

			if (p[a][b] == 1)
			{
				cout << "*";
				y++;
			}
		}
		cout << "\n";


	}
	cout << endl;
	fill_percent = x / y*1.0;
	cout << fill_percent << endl;
	counter++;
	cout << "Cycle #" << counter << endl;

}

void calculate_Array(int p[23][79], int q[23][79])
{
	int population;

	for (int i = 1; i<23; i++)
	{
		for (int j = 1; j<79; j++)
		{
			population = 0;
			population = p[i - 1][j - 1] + p[i - 1][j] + p[i - 1][j + 1] + p[i][j - 1] + p[i][j + 1] + p[i + 1][j - 1] + p[i + 1][j] + p[i + 1][j + 1];
			if (p[i][j] == 0 && population == 3)
			{
				q[i][j] = 1;
			}
			if (p[i][j] == 0 && population != 3)
			{
				q[i][j] = 0;
			}
			if (p[i][j] == 1 && (population == 2 || population == 3)) {
				q[i][j] = 1;
			}
			if (p[i][j] == 1 && population < 2) {
				q[i][j] = 0;
			}
			if (p[i][j] == 1 && population > 3) {
				q[i][j] = 0;
			}

		}
	}
	for (int i = 1; i<23; i++)
	{
		for (int j = 1; j<79; j++)
		{
			p[i][j] = q[i][j];
		}
	}
}




// run multiple cycles
void mult_cycles(int p[23][79])
{
	for (int f = 0; f<num_cycles; f++)
	{
		calculate_Array(start_Array, update_Array);
		manifest(p);
		Sleep(1000);
	}
}
