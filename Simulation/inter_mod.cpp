#include <iostream>
#include <cstdio>
#include <stack>
#include <queue>
#include <list>
using namespace std;

void binary(int num,bool choice) {
	int count = 1;
	if (choice) {
		printf("%d  ", num);
		for (int i = 0x80; i > 0; i >>= 1, count++) {
			printf("%d", !!(i & num));
		}
		printf("\n");
	}
	else {
		printf("%d  ", num);
		for (int i = 0x8000; i > 0; i >>= 1, count++) {
			printf("%d", !!(i & num));
			if (count % 8 == 0 && count != 16)
				printf("_");
		}
		printf("\n");
	}
}

int main(int argc, char const *argv[])
{
	int n1, n2;
	int add = 0;
	scanf("%d%d", &n1, &n2);getchar();
	int minus_n2 = (-n2) << 8, plus_n2 = n2 << 8;
	int tmp = (n1 << 1) + minus_n2;
	tmp += tmp / 0x10000 ? 1 : 0;
	binary(tmp, 0);
	getchar();
	for (int i = 0; i < 7; ++i)
	{

		tmp = tmp << 1;
		tmp += tmp & 0x8000 ? plus_n2 : minus_n2;
		add = !(tmp & 0x10000);
		tmp += add;
		tmp = tmp % 0x10000;
		printf("tmp = %d add = %d\n", tmp, add);
		binary(tmp, 0);
		binary(tmp & 0x8000 ? plus_n2 : minus_n2,0);
		getchar();
	}

	tmp += tmp & 0x8000 ? plus_n2 : 0;

	binary(tmp, 0);
	
	binary(tmp % 0x100, 1);
	printf("%d\n", tmp % 0x100);

	return 0;
}