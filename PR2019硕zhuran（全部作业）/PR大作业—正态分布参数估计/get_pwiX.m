function[pwiX] = get_pwiX(pXwi)

%�������ʣ�ǿ�м�������������
pwi = [0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];
pwiX = (pwi.*pXwi)/sum(pwi.*pXwi);
