%���������ѵ��
function [] = train()
%��ʼ�����������Ȩֵ��������������
init();
%w1ÿһ�ж�������ڵ��Ȩֵ��������ֵ
load w1
%w2ÿһ�ж�������ڵ��Ȩֵ��������ֵ
load w2
%feature_mapÿһҳ����һ������������
load feature_map
miu =0.8;%ѧϰ��
b = size(w1);
InNum = b(2)-1;%����ڵ���
HiddenNum = b(1);%����ڵ���
b = size(w2);
OutNum = b(1);%����ڵ���
%�洢���ۺ�����ֵ
eii=[];
%��ȡ1000����������ѵ��
for p=1:1000
    load w1
    load w2
    delta_w1=zeros(HiddenNum,InNum+1);
    delta_w2 = zeros(OutNum,HiddenNum+1);
    %���ѡȡһ������
    i=randperm(10,1)-1;
    %�����������y����������i��������ϣ�������ֻ�е�i+1ά������Ϊ1������Ϊ0
    y=zeros(1,OutNum);
    y(i+1)=1; 
    b = size(feature_map(:,:,i+1));
    %���ѡȡ���������е�һ��
    j=randperm(b(1),1);
    %��ȡ��������
    feature = feature_map(j,:,i+1);
    %�������ǰ�����
    %��������
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
    %�����y2����������������ǰ��������
    %������к������
    %ƫ��
    e = y2-y;
    eii = [eii,0.5*sum(e.^2)];
    %���������
    delta2 = [];
    for n=1:OutNum
        delta2 = [delta2,e(n)*f2(v2(n))];
    end
        
    %��������
    delta1 = [];
    for m=1:HiddenNum
        temp_delta = delta2*w2(:,m+1);
        delta1 = [delta1,temp_delta*f2(v1(m))];
    end
    %���������������̵�Ӱ��
    for n=1:OutNum
        delta_w2(n,2:end) = delta_w2(n,2:end) + delta2(n)*y1;
    end
    for m=1:HiddenNum
        delta_w1(m,2:end) = delta_w1(m,2:end) + delta1(m)*feature;
    end
    %����Ȩֵ
    w1 = w1+(-miu)*delta_w1;
    w2 = w2+(-miu)*delta_w2;
    save w1.mat w1
    save w2.mat w2
end
plot(1:1000,eii);
end