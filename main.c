/*��������3������1-10����ÿ������3�λ���*/
#include<stdlib.h>
#include<stdio.h>
#include<time.h>
int main()
{
    int magic,guess;
    printf("�����������1-10����ÿ������3�λ���\n");
    for (int i=0;i<3;i++){
        srand(time(NULL));
        magic=rand()%10+1;
        for (int j=3;j>0;j--){
        printf("�µ�%d����������%d�λ��ᣩ��",i+1,j);
        scanf("%d",&guess);
        if (guess==magic){
            printf("��ϲ���¶���\n");
            break;
        }
        else
            printf("�´���\n");
        }
    }
    return 0;
}
