//求满足不等式1^3+2^3+...+m^3<n的最大m
#include <stdio.h>
#include <math.h>
int main()
{
    int m=0,sum=0,item,n;
    printf("请输入n：");
    scanf("%d",&n);
    while (sum<n){
        m++;
        item=pow(m,3);
        sum+=item;
    }
    printf("满足不等式的最大m为%d\n",m-1);
    return 0;
}
