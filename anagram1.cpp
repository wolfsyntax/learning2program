/**
  Check if the string is anagram
  
  Wolf Syntax (c) 2016 : ACPC 2016
  (c) ACM Stanford : Geometry.cc
  
  Algorithm: Extracted from Geometry.cc of ACM Team Notebook
  
**/

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
//(c) 2016

using namespace std;

int main(){
	
	LL t, n; string str, str_copy, s;
	
	cin >> t;
	while(t--)
	{
		cin >> n >> str;
		for(int i = 0; i < n; i++) 
		{
			cin >> s;
			
			for(int j = 0; j < s.length(); j++)
				for(int k = 0; k < str.length(); k++)
					if(str[j] == s[k]) {s[k] = ' '; break;}
			
			if(count(s.begin(), s.end(),' ') == s.length()) cout << "An Anagram\n";
			else cout << "Not An Anagram\n";
				
		}
			
	}	
		

	return 0;
}
