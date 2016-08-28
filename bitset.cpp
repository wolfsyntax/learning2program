/**
  
  Wolf Syntax (c) 2016 : ACPC 2016
  
  Algorithm: 
    color = ROYGBIV
    
    1. Read N
    2. Convert N into binary(32bit)
    3. copy the first 25bits of N and convert to integer
    4. copy the last 7bits of N and store to a [string str] then traverse
       if str[i] == '1' then print the equivalent color 
       
**/

#include <iostream>
#include <bitset>
#include <map>
#include <string>
#include <algorithm>

#include <cstdlib>
/**
	Sample Input:
	868
	1568
	2981
	46092
	1274479
	
	Sample Output:
	6:ROB   
	12:O    
	23:OBV
	360:GB
	9956:ROGBIV
**/
//(c) 2016
using namespace std;

int main()
{
	int n;
	while(cin >> n)
	{
		bitset<32>bit(n);
		map<char,int> flag;
		string colors = "ROYGBIV";

		string str = bit.to_string();
		string str1 = str.substr(0,25);
		string str2 = str.substr(25,32);
		bitset<25>bitsA(str1);
		
		cout << bitsA.to_ulong() << ":";
		for(int i = 0; i < 7; i++)
			if(str2[i] == '1')
				cout << colors[i];
		cout << endl;
	}
	return 0;
}
