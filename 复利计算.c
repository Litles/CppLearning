#include <stdio.h>
#include <math.h>

int main()
{
    int t;
    double At,i,A0;
    printf("程序将根据复利计算本利和\n\n请输入本金A0：");
    scanf("%lf",&A0);
    printf("请输入利息i(小数形式)：");
    scanf("%lf",&i);
    printf("请输入时间t(年)：");
    scanf("%d",&t);
    At=A0*pow(1+i,t);
    printf("t年后的本利和At=%.2f\n",At);
    getch();
    return 0;
}
