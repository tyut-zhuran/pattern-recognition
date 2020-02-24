%正态分布参数估计求类条件概率密度函数pXwi
function[pXwi] = get_pXwi(new_feature)
load mean_feature;
%mean_feature放到主函数里执行
%到这里mean_feature的每一行都是一个类别的mean_feature
%也就是要估计的参数miu
%下面估计sigma
pXwi = [];
for i =0:9
    miu = mean_feature(i+1,:);
    image_list = dir(strcat('./样本',num2str(i),'/*.png'));
    sigma = zeros(length(miu),length(miu));
    for j=1:length(image_list)
        feature = get_feature(imread(strcat('./样本',num2str(i),'/',image_list(j).name))); 
        sigma = sigma+(feature-miu)'*(feature-miu);
    end
    %无法保证sigma非奇异，所以在对角线加一个数字，几乎不对结果产生影响
    sigma = (sigma+10*diag(ones(1,length(new_feature))))/length(image_list);
    %代公式求类条件概率密度函数
    p = ((2*pi)^(-length(new_feature)/2)) * ((det(sigma))^(-1/2)) * exp(-0.5*((new_feature-miu)*inv(sigma)*(new_feature-miu)' ));
    pXwi = [pXwi,p];
end
