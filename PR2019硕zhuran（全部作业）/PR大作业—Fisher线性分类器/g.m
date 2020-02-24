function [num]  = g(x,num1,num2)
%����x:��ʶ��������num1,num2:���Է�������ֿ��ܽ����������������һ�������Խϴ����
%���Է�����g(x) = w'x+w0
%���У�w=inv(S1+S2)*(m1-m2)
%xΪ��ʶ������
%w0ȡ-0.5(m1+m2)'*inv(S1+S2)*(m1-m2)
%������g(x)Ϊһ������

%SΪ�����������ɢ�Ⱦ���
load S
%mean_featureΪ���ֵ����
load mean_feature

S1 = S((36*num1+1):(36*num1+1+35),:);
S2 = S((36*num2+1):(36*num2+1+35),:);
m1 = (mean_feature(num1+1,:))';
m2 = (mean_feature(num2+1,:))';

%Ϊ��֤������죬�ڶԽ��߼�һ�������Խ��������Ӱ��
%SwΪ��������ɢ�Ⱦ���
Sw = S1+S2+diag(10*ones(1,length(S(1,:))));
%����ʽ���ͶӰ����w
w = inv(Sw)*(m1-m2);%d��1��
w0 = -0.5*(m1+m2)'*inv(Sw)*(m1-m2);%����
temp = w'*x'+w0;
temp
if(temp>0)
    num = num1;
else
    num = num2;
end
end