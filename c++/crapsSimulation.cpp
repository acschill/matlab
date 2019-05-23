#include <iostream>
#include <cstdlib>
#include <ctime>
#include <iomanip>

using namespace std;

int rollDice ();
bool craps();

int main(int argc, const char * argv[]) {
    
    srand( static_cast<unsigned int>(time(NULL)));
    
    double win = 0;
    double winRatio = 0.0;
    double attempts = 0;
    int inputCycle = 0;
    
    
    cout << "Craps Simulation" << endl;
    cout << "Enter number of cycles to run " << endl;
    cin >> inputCycle;
    
            for(int i = 0 ; i < inputCycle; i++)
            {
                win += craps();
                attempts++;
            }
        
            winRatio = (win/attempts);
    
    cout << std::setprecision(6) << winRatio*100 << '\n';
    cout << inputCycle << '\n';
    cout << "Author: Alexander Schill" << endl;
    
 
    return 0;
}


bool craps()
{
    bool win;
    
    enum Status { CONTINUE, WON, LOST };
    
    int myPoint = 0;
    Status gameStatus;
    
    int sumOfDice = rollDice();
    
    switch (sumOfDice) {
        case 7:   //win w/ 7 on first roll
        case 11:  //win w/ 11 on first roll
            gameStatus = WON;
            break;
        case 2:   //lose w/ 2 on first roll
        case 3:   //lose w/ 3 on first roll
        case 12:  //lose w/ 12 on first roll
            gameStatus = LOST;
            break;
        default:
            gameStatus = CONTINUE;
            myPoint = sumOfDice;
            ///cout << "Point is " << myPoint << endl;
            break;
    }
    
    while (gameStatus == CONTINUE) {
        sumOfDice = rollDice();
        
        if (sumOfDice == myPoint)
            gameStatus = WON;
        else{
            if (sumOfDice == 7)
                gameStatus = LOST;
            }
        }

    
    if  (gameStatus == WON)
    {
        win = 1;

        ///cout << "Player wins" << endl;
    }
    
    else
    {
        ///cout << "Player loses" << endl;
        win = 0;}
        
    
    return win;
}

int rollDice()
{
    int die1 = 1 + rand() % 6;
    int die2 = 1 + rand() % 6;
    
    int sum = die1 + die2;
    
    ///cout << "Player rolled " << die1 << " + " << die2 << " = " << sum << endl;
    return sum;
}
