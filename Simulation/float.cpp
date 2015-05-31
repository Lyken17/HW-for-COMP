#include <stdio.h>
#include <string.h>

typedef unsigned char   byte;
typedef unsigned int    word;
typedef unsigned long   dwrd;

union {
    float f;
    dwrd d;
} u;

int main()
{
    int i, j, k;
    dwrd m;
    char ans[100];
    int tmp;
    for(;;){
        printf("Input a float: ");
        scanf("%f", &u.f);

        m=0x80000000; //u.d=0xFF800000;
        for(i=0; i<32; i++){
            if(m & u.d) ans[i] = '1';
            else ans[i] = '0';
            m >>= 1;
        }
        ans[i] = '\0';
        printf("%s    ",ans);
        printf("\t%30.20f\n", u.f);
        for (i = 0; i < 8; i++) {
            tmp = 0;
            for (j = 4 * i; j < 4 * i + 4 ; j++) {
                tmp = ans[j] - '0' + tmp * 2;
            }
            printf("%X", tmp);
        }
        printf("\n");


        if(getchar()==27)break;
    }
    return 0;
}
