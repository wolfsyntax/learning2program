/**
  Jayson D. Alpe (Wolf Syntax)
  BSIT-3 : Ateneo de Naga University
  9/11/2016
  
**/

#include <iostream>
#include <cstdio>

using namespace std;

void board(string * str, int n)
{
	int status = 0, x = 0, y = n-1;
	
	for(int r = 0, x = n-1; r < n-2; r++)
	{   
		for(int c = 0,  y = n-1; c < n-2; c++)
		{
			//Upper Left
			if(str[r][c] == 'X' && str[r+1][c] == 'X' && str[r][c+1] == 'X')
			{status = 1; break;}
			//vertical
			if(str[r][c] == 'X' && str[r+1][c] == 'X' && str[r+2][c] == 'X')
			{status = 1; break;}
			//Downward
			if(str[r][c] == 'X' && str[r][c+1] == 'X' && str[r][c+2] == 'X')
			{status = 1; break;}
			//Horizontal
			if(str[r][c] == 'X' && str[r+1][c] == 'X' && str[r+2][c] == 'X')
			{status = 1; break;}
			//Lower Right
			if(str[x][y] == 'X' && str[x][y-1] == 'X' && str[x-1][y] == 'X')
			{status = 1; break;}
			//Lower Left
			if(str[r][c] == 'X' && str[r-1][c] == 'X' && str[r][c+1] == 'X')
			{status = 1; break;}
			
			if(str[r+1][c] == 'X' && str[r][c] == 'X' && str[r+1][c+1] == 'X')
			{status = 1; break;}
			if(str[r+2][c] == 'X' && str[r-1][c] == 'X' && str[r+1][c+1] == 'X')
			{status = 1; break;}
			if(str[x][c] == 'X' && str[x-1][c] == 'X' && str[x][c+1] == 'X')
			{status = 1; break;}
			if(str[r][y] == 'X' && str[r+1][y] == 'X' && str[r+2][y] == 'X')
			{status = 1; break;}			
			//Lower Right
			if(str[x][y] == 'X' && str[x-1][y] == 'X' && str[x][y-1] == 'X')
			{status = 1; break;}
		
/**			==================================================================			**/		
		
			if(str[r][c] == 'O' && str[r+1][c] == 'O' && str[r][c+1] == 'O')
			{status = 2; break;}
			//vertical
			if(str[r][c] == 'O' && str[r+1][c] == 'O' && str[r+2][c] == 'O')
			{status = 2; break;}
			//Downward
			if(str[r][c] == 'O' && str[r][c+1] == 'O' && str[r][c+2] == 'O')
			{status = 2; break;}
			//Horizontal
			if(str[r][c] == 'O' && str[r+1][c] == 'O' && str[r+2][c] == 'O')
			{status = 2; break;}
			//Lower Right
			if(str[x][y] == 'O' && str[x][y-1] == 'O' && str[x-1][y] == 'O')
			{status = 2; break;}
			//Lower Left
			if(str[r][c] == 'O' && str[r-1][c] == 'O' && str[r][c+1] == 'O')
			{status = 2; break;}
			
			if(str[r+1][c] == 'O' && str[r][c] == 'O' && str[r+1][c+1] == 'O')
			{status = 2; break;}
			//Lower Left
			if(str[r+2][c] == 'O' && str[r-1][c] == 'O' && str[r+1][c+1] == 'O')
			{status = 2; break;}
			//Upper Right
			if(str[x][c] == 'O' && str[x-1][c] == 'O' && str[x][c+1] == 'O')
			{status = 2; break;}
			//Left Vertical
			if(str[r][y] == 'O' && str[r+1][y] == 'O' && str[r+2][y] == 'O')
			{status = 2; break;}
			//Lower Right
			if(str[x][y] == 'X' && str[x-1][y] == 'X' && str[x][y-1] == 'X')
			{status = 2; break;}
		
			y--;
		
		}
		x--;
	}
	
	if(status == 1) cout << "X\n";
	else cout << (status == 2? "O\n" : "DRAW\n");

}
int main()
{
	freopen("prob_a.in","r",stdin);
	
	int n;

	while(cin >> n)
	{
		string table[n];
		for(int i = 0; i < n; i++)
			cin >> table[i];
		board(table,n);
	}

	
	return 0;
}
