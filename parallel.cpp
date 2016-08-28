/**
  Check if the 2 lines are parallel
  
  Wolf Syntax (c) 2016 : ACPC 2016
  (c) ACM Stanford : Geometry.cc
  
  Algorithm: Extracted from Geometry.cc of ACM Team Notebook
  
**/

#include <cmath>
#include <iostream>

using namespace std;
#define LL long long int
#define EPS 1e-12
LL cross(LL x1, LL y1, LL x2, LL y2)
{
	return (x1*y2-y1*x2);
}
bool ParallelLines(LL x1m, LL y1m, LL x2m, LL y2m, LL x3m, LL y3m, LL x4m, LL y4m)
{
	return fabs(cross(x2m-x1m, y2m-y1m, x3m-x4m, y3m-y4m)) < EPS;
}
int main()
{

	LL t;
	LL x1m, y1m, x2m, y2m, x3m, y3m, x4m, y4m;
	cin >> t;
	while(t--)
	{
		cin >> x1m >> y1m >> x2m >> y2m 
			>> x3m >> y3m >> x4m >> y4m;
		cout << (ParallelLines(x1m,y1m,x2m,y2m,x3m,y3m,x4m,y4m) ? "parallel\n" : "not parallel\n");
		
	}
	return 0;
}
