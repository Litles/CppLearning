//判断一个正整数是否为素数
#include <stdio.h>
int main()
{
    printf("请输入一个正整数，我将判断它是否是素数\n");
    int n,i=2;
    scanf("%d",&n);
    while (n%i!=0){
        i++;
    }
    if (i==n)
        printf("结论：该数是素数\n");
    else
        printf("结论：该数不是素数\n");
    printf("\n按任意键退出\n");
    getch();
    return 0;
}
