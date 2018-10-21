#include <stdio.h>
int main()
{
    int nOne,nTwo,nFive,sum=0;/*nOne表示1分的硬币个数，其它类似，sum表示硬币总数*/
    int money,n=0;/*money表示要兑换的钱（分），n表示兑换的硬币总个数*/
    printf("输入要兑换的钱（以分为单位，大于8但小于100）：");
    scanf("%d",&money);
    if (8<money&&money<100)/*判断输入是否符合要求*/
    {
    printf("兑换方法：\n");
    printf(" 5分 2分 1分 总数\n");
    /*下面一段找出5分硬币个数为[money/5]时的所有兑换方法*/
    nFive=money/5,nTwo=0,nOne=money%5;
    for (;nOne>=0;nOne-=2){
        printf("%4d%4d%4d%5d\n",nFive,nTwo,nOne,nFive+nTwo+nOne);n++;
        nTwo++;
    }
    /*下面一段找出5分硬币个数小于[money/5]的所有兑换方法*/
    nOne=money%5,nTwo=0;
    for (nFive=money/5-1;nFive>=0;nFive--){
        nTwo+=2,nOne++;
        printf("%4d%4d%4d%5d\n",nFive,nTwo,nOne,nFive+nTwo+nOne);n++;
        nTwo--,nOne+=2;
        printf("%4d%4d%4d%5d\n",nFive,nTwo,nOne,nFive+nTwo+nOne);n++;
        nTwo--;
    }
    printf("总共有以上%d种换法\n",n);
    }
    else
        printf("不在指定范围内，程序已退出\n");
    return 0;
}
