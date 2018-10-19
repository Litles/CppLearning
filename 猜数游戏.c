/*下面程序猜3个数（1-10），每个数有3次机会*/
#include<stdlib.h>
#include<stdio.h>
#include<time.h>
int main()
{
    int magic,guess;
    printf("请猜三个数（1-10），每个数有3次机会\n");
    for (int i=0;i<3;i++){
        srand(time(NULL));
        magic=rand()%10+1;
        for (int j=3;j>0;j--){
        printf("猜第%d个数（还有%d次机会）：",i+1,j);
        scanf("%d",&guess);
        if (guess==magic){
            printf("恭喜，猜对了\n");
            break;
        }
        else
            printf("猜错了\n");
        }
    }
    return 0;
}
