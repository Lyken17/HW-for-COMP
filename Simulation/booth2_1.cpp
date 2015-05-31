#include <iostream>
#include <cstdio>
#include <stack>
#include <queue>
#include <list>
using namespace std;

void binary(int num,bool choice) {
	if (choice) {
		printf("%d  ", num);
		for (int i = 0x80; i > 0; i >>= 1)
			printf("%d", !!(i & num));
		printf("\n");
	}
	else {
		printf("%d  ", num);
		for (int i = 0x10000; i > 0; i >>= 1)
			printf("%d", !!(i & num));
		printf("\n");
	}
}

int main(int argc, char const *argv[])
{
	int n1, n2,res;
	int k = 0;
	printf("Input two nums\n");
	scanf("%d%d",&n1,&n2);
	bool flag = !((n1 ^ n2) & 0x80000000);
	
	printf("n1 = %X n2 = %X bool = %d\n",n1,n2,flag);
	binary(n1,0);
	binary(n2,0);
	
	n1 = n1 > 0 ? n1 : -n1;
	n2 = n2 > 0 ? n2 : -n2;
	
	

	int tmp = n1 << 8;
	

	res = n2;
	for (int i = 0; i < 8; ++i)
	{
		if (res & 1) {
			res += tmp;
		}
		res >>= 1;
	}
	res = flag ? res : -res;
	binary(res,0);
	return 0;
}