/**
  Jayson D. Alpe
  BSIT-3 Ateneo de Naga University
  09/11/16
  
  Problem Description: check if the sum of a number and its reverse is a palindrome. If not palindrome, repeat the process;
**/


#include <iostream>
#include <string>		//itoa()
#include <cstdlib>		//atoi()
#include <cstring>		//.c_str()
#include <sstream>		//stringstream
#include <cstdio>		//freopen()
#include <algorithm> 	//reverse()
using namespace std;

int main()
{
	string num;
	while(getline(cin,num))
	{
		int ctr = 0, a, b;
		string orig = num;
		bool flag = false;
		while(ctr != 10)
		{
			reverse(num.begin(),num.end());
			ctr++;
			a = atoi(orig.c_str()); b = atoi(num.c_str());
			a += b;
			stringstream io;
			io << a;
			
			num = orig = io.str();
			flag = equal(num.begin(),num.end(), num.rbegin());
			if(flag == true) break;
			
		}
		if(flag == true) cout << "YES " << ctr << endl;
		else cout << "NONE " << num << endl;
	}

	return 0;
}
