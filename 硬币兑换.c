#include <stdio.h>
int main()
{
    int nOne,nTwo,nFive,sum=0;/*nOne��ʾ1�ֵ�Ӳ�Ҹ������������ƣ�sum��ʾӲ������*/
    int money,n=0;/*money��ʾҪ�һ���Ǯ���֣���n��ʾ�һ���Ӳ���ܸ���*/
    printf("����Ҫ�һ���Ǯ���Է�Ϊ��λ������8��С��100����");
    scanf("%d",&money);
    if (8<money&&money<100)/*�ж������Ƿ����Ҫ��*/
    {
    printf("�һ�������\n");
    printf(" 5�� 2�� 1�� ����\n");
    /*����һ���ҳ�5��Ӳ�Ҹ���Ϊ[money/5]ʱ�����жһ�����*/
    nFive=money/5,nTwo=0,nOne=money%5;
    for (;nOne>=0;nOne-=2){
        printf("%4d%4d%4d%5d\n",nFive,nTwo,nOne,nFive+nTwo+nOne);n++;
        nTwo++;
    }
    /*����һ���ҳ�5��Ӳ�Ҹ���С��[money/5]�����жһ�����*/
    nOne=money%5,nTwo=0;
    for (nFive=money/5-1;nFive>=0;nFive--){
        nTwo+=2,nOne++;
        printf("%4d%4d%4d%5d\n",nFive,nTwo,nOne,nFive+nTwo+nOne);n++;
        nTwo--,nOne+=2;
        printf("%4d%4d%4d%5d\n",nFive,nTwo,nOne,nFive+nTwo+nOne);n++;
        nTwo--;
    }
    printf("�ܹ�������%d�ֻ���\n",n);
    }
    else
        printf("����ָ����Χ�ڣ��������˳�\n");
    return 0;
}
