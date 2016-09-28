/**
  Jayson D. Alpe (Wolf Syntax)
  BSIT-3 : Ateneo de Naga University
  9/11/2016
  
  Problem: The Koch Curve
  
**/

#include <iostream>
#include <cmath>
#include <algorithm>

using namespace std;

int main()
{
	int test, x, n, gcd_koch; cin >> test;
	while(test--)
	{
		cin >> n >> x;
		
		int a = x * pow(4,n);
		int b = pow(3,n);
		gcd_koch = __gcd(a,b);
		cout << a/gcd_koch << "/" << b/gcd_koch << endl;
		
		
	}
	return 0;
}
