#include <algorithm>
#include <iostream>
#include <map>
#include <string>

#define LL long long int
/**
	Sample Input:
	2
	3 mike
	ikem
	ekim
	meki
	2 love
	oloe
	elov
	
	Sample Output:
	An Anagram
	An Anagram
	An Anagram
	Not An Anagram
	An Anagram
**/


using namespace std;

int main(){
	
	LL t, n; string str, str_copy, s;
	
	cin >> t;
	while(t--)
	{
		cin >> n >> str;
//		str_copy = str;
		for(int i = 0; i < n; i++) 
		{
			cin >> s;
			str_copy = str;
			for(int j = 0; j < s.length(); j++)
				for(int k = 0; k < str.length(); k++)
					if(s[j] == str_copy[k]) {str_copy[k] = ' '; break;}
			
			if(count(str_copy.begin(), str_copy.end(),' ') == s.length()) cout << "An Anagram\n";
			else cout << "Not An Anagram\n";
				
		}
			
	}	
		

	return 0;
}
