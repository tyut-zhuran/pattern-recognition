%输入手写数字图片，返回识别结果
function [num] = get_number(image)
load w1
load w2
feature = get_feature(image);

b = size(w1);
InNum = b(2)-1;%输入节点数
HiddenNum = b(1);%隐层节点数
b = size(w2);
OutNum = b(1);%输出节点数
y1=[];%隐层的输出
v1=[];%激活函数的输入
for m=1:HiddenNum
    v1 = [v1,([1,feature])*w1(m,:)'];
end
for m=1:HiddenNum
    y1 = [y1,f(v1(m))];
end
%输出层
y2=[];%输出
v2=[];%输出层激活函数的输入
for n=1:OutNum
    v2 = [v2,([1,y1])*w2(n,:)'];
end
for n=1:OutNum
    y2 = [y2,f(v2(n))];
end
%输出各维中最大值的索引就是识别结果
[value,index]=max(y2);
num = index-1;
end