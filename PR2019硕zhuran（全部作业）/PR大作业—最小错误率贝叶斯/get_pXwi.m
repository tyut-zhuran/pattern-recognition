%最小错误率求类条件概率密度函数pXwi
function[pXwi] = get_pXwi(new_feature)
mean_feature = [];
for i = 0:9
    mean_feature = [mean_feature;get_mean_feature(i)];
end
%mean_feature有10行，每一行代表一个类的特征

%二值化
new_feature = new_feature>0.4;
pXwi = [];
for i=0:9
    p = 1;
    for j =1:length(new_feature)
        if(new_feature(j))
            p = p*mean_feature(i+1,j);
        else
            p = p*(1-mean_feature(i+1,j));
        end
    end
    pXwi = [pXwi,p];
end