function [num]  = g(x,num1,num2)
%参数x:待识别样本，num1,num2:线性分类的两种可能结果，函数返回其中一个可能性较大的数
%线性分类器g(x) = w'x+w0
%其中，w=inv(S1+S2)*(m1-m2)
%x为待识别样本
%w0取-0.5(m1+m2)'*inv(S1+S2)*(m1-m2)
%最后算出g(x)为一个标量

%S为各类的类内离散度矩阵
load S
%mean_feature为类均值向量
load mean_feature

S1 = S((36*num1+1):(36*num1+1+35),:);
S2 = S((36*num2+1):(36*num2+1+35),:);
m1 = (mean_feature(num1+1,:))';
m2 = (mean_feature(num2+1,:))';

%为保证其非奇异，在对角线加一常数，对结果几乎不影响
%Sw为总类内离散度矩阵
Sw = S1+S2+diag(10*ones(1,length(S(1,:))));
%带公式求出投影方向w
w = inv(Sw)*(m1-m2);%d行1列
w0 = -0.5*(m1+m2)'*inv(Sw)*(m1-m2);%标量
temp = w'*x'+w0;
temp
if(temp>0)
    num = num1;
else
    num = num2;
end
end