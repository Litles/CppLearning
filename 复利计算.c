#include <stdio.h>
#include <math.h>

int main()
{
    int t;
    double At,i,A0;
    printf("���򽫸��ݸ������㱾����\n\n�����뱾��A0��");
    scanf("%lf",&A0);
    printf("��������Ϣi(С����ʽ)��");
    scanf("%lf",&i);
    printf("������ʱ��t(��)��");
    scanf("%d",&t);
    At=A0*pow(1+i,t);
    printf("t���ı�����At=%.2f\n",At);
    getch();
    return 0;
}
