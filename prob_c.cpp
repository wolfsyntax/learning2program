/**
  Jayson D. Alpe
  BSIT-3 Ateneo de Naga University
  09/11/2016
  
  Problem: Keeper of Roads
  
**/

#include <iostream>
#include <set>

using namespace std;

int main()
{
	int test, n, x, y;
	cin >> test;
	while(test--)
	{
		cin >> n;

		set<int> city;
		for(int i = 0; i < n*2; i++){
			cin >> x;
			city.insert(x);
			
		}
		cout << city.size() << endl;
		
	}
	return 0;
}
