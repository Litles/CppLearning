#include <stdio.h>

int main()
{
    const int bigM=31,smaM=30,bigF=29,smaF=28;
    int dsum=0,date[2][3];
    printf("������������date1��date2��date1<date2��\n�Կո�ָ��ꡢ�¡��գ���λ��ǰ���ò���0�������磺\n");
    printf("2008 1 23\n2018 2 9\n�����룺\n");
    for (int i=0;i<2;i++)
        for (int j=0;j<3;j++)
        scanf("%d",&date[i][j]);
    int y1=date[0][0],y2=date[1][0];
    /*��ͷ*/
    if (y1%4==0&&y1%100!=0||y1%400==0)
        switch (date[0][1]){
            case 1:dsum+=bigM;
            case 2:dsum+=bigF;
            case 3:dsum+=bigM;
            case 4:dsum+=smaM;
            case 5:dsum+=bigM;
            case 6:dsum+=smaM;
            case 7:dsum+=bigM;
            case 8:dsum+=bigM;
            case 9:dsum+=smaM;
            case 10:dsum+=bigM;
            case 11:dsum+=smaM;
            case 12:dsum+=bigM;
        }
    else
        switch (date[0][1]){
            case 1:dsum+=bigM;
            case 2:dsum+=smaF;
            case 3:dsum+=bigM;
            case 4:dsum+=smaM;
            case 5:dsum+=bigM;
            case 6:dsum+=smaM;
            case 7:dsum+=bigM;
            case 8:dsum+=bigM;
            case 9:dsum+=smaM;
            case 10:dsum+=bigM;
            case 11:dsum+=smaM;
            case 12:dsum+=bigM;
        }
    dsum-=date[0][2];
    /*�м�*/
    for (int i=y1+1;i<y2;i++){
        if (i%4==0&&i%100!=0||i%400==0)
            dsum+=366;
        else
            dsum+=365;
    }
    /*��β*/
    if (y2%4==0&&y2%100!=0||y2%400==0)
        switch (date[1][1]-1){
            case 12:dsum+=bigM;
            case 11:dsum+=smaM;
            case 10:dsum+=bigM;
            case 9:dsum+=smaM;
            case 8:dsum+=bigM;
            case 7:dsum+=bigM;
            case 6:dsum+=smaM;
            case 5:dsum+=bigM;
            case 4:dsum+=smaM;
            case 3:dsum+=bigM;
            case 2:dsum+=bigF;
            case 1:dsum+=bigM;
        }
    else
        switch (date[1][1]-1){
            case 12:dsum+=bigM;
            case 11:dsum+=smaM;
            case 10:dsum+=bigM;
            case 9:dsum+=smaM;
            case 8:dsum+=bigM;
            case 7:dsum+=bigM;
            case 6:dsum+=smaM;
            case 5:dsum+=bigM;
            case 4:dsum+=smaM;
            case 3:dsum+=bigM;
            case 2:dsum+=smaF;
            case 1:dsum+=bigM;
        }
    dsum+=date[1][2];
    /*����*/
    if (y1==y2){
        if (y1%4==0&&y1%100!=0||y1%400==0)
            dsum-=366;
        else
            dsum-=365;
    }
    printf("date2-date1=%d(��)\n",dsum);
    getchar();
    getchar();
    return 0;
}
