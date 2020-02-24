%对网络进行训练
function [] = train()
%初始化，生成随机权值并保存样本数据
init();
%w1每一行都是隐层节点的权值，包括阈值
load w1
%w2每一行都是输出节点的权值，包括阈值
load w2
%feature_map每一页都是一类样本的特征
load feature_map
miu =0.8;%学习率
b = size(w1);
InNum = b(2)-1;%输入节点数
HiddenNum = b(1);%隐层节点数
b = size(w2);
OutNum = b(1);%输出节点数
%存储代价函数的值
eii=[];
%抽取1000个样本进行训练
for p=1:1000
    load w1
    load w2
    delta_w1=zeros(HiddenNum,InNum+1);
    delta_w2 = zeros(OutNum,HiddenNum+1);
    %随机选取一类样本
    i=randperm(10,1)-1;
    %设置期望输出y，对于数字i的样本，希望输出中只有第i+1维的数字为1，其余为0
    y=zeros(1,OutNum);
    y(i+1)=1; 
    b = size(feature_map(:,:,i+1));
    %随机选取该类样本中的一个
    j=randperm(b(1),1);
    %获取样本特征
    feature = feature_map(j,:,i+1);
    %下面进行前向计算
    %先是隐层
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
    %这里的y2就是神经网络的输出，前向计算完毕
    %下面进行后向计算
    %偏差
    e = y2-y;
    eii = [eii,0.5*sum(e.^2)];
    %对于输出层
    delta2 = [];
    for n=1:OutNum
        delta2 = [delta2,e(n)*f2(v2(n))];
    end
        
    %对于隐层
    delta1 = [];
    for m=1:HiddenNum
        temp_delta = delta2*w2(:,m+1);
        delta1 = [delta1,temp_delta*f2(v1(m))];
    end
    %该样本对修正过程的影响
    for n=1:OutNum
        delta_w2(n,2:end) = delta_w2(n,2:end) + delta2(n)*y1;
    end
    for m=1:HiddenNum
        delta_w1(m,2:end) = delta_w1(m,2:end) + delta1(m)*feature;
    end
    %更新权值
    w1 = w1+(-miu)*delta_w1;
    w2 = w2+(-miu)*delta_w2;
    save w1.mat w1
    save w2.mat w2
end
plot(1:1000,eii);
end