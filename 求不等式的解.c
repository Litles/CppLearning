//�����㲻��ʽ1^3+2^3+...+m^3<n�����m
#include <stdio.h>
#include <math.h>
int main()
{
    int m=0,sum=0,item,n;
    printf("������n��");
    scanf("%d",&n);
    while (sum<n){
        m++;
        item=pow(m,3);
        sum+=item;
    }
    printf("���㲻��ʽ�����mΪ%d\n",m-1);
    return 0;
}
