//�ж�һ���������Ƿ�Ϊ����
#include <stdio.h>
int main()
{
    printf("������һ�����������ҽ��ж����Ƿ�������\n");
    int n,i=2;
    scanf("%d",&n);
    while (n%i!=0){
        i++;
    }
    if (i==n)
        printf("���ۣ�����������\n");
    else
        printf("���ۣ�������������\n");
    printf("\n��������˳�\n");
    getch();
    return 0;
}
