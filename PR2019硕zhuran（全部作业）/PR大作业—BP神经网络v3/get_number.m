%������д����ͼƬ������ʶ����
function [num] = get_number(image)
load w1
load w2
feature = get_feature(image);

b = size(w1);
InNum = b(2)-1;%����ڵ���
HiddenNum = b(1);%����ڵ���
b = size(w2);
OutNum = b(1);%����ڵ���
y1=[];%��������
v1=[];%�����������
for m=1:HiddenNum
    v1 = [v1,([1,feature])*w1(m,:)'];
end
for m=1:HiddenNum
    y1 = [y1,f(v1(m))];
end
%�����
y2=[];%���
v2=[];%����㼤���������
for n=1:OutNum
    v2 = [v2,([1,y1])*w2(n,:)'];
end
for n=1:OutNum
    y2 = [y2,f(v2(n))];
end
%�����ά�����ֵ����������ʶ����
[value,index]=max(y2);
num = index-1;
end