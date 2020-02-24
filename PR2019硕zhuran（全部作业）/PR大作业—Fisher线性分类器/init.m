%主要完成初始化工作，如计算各类的类内离散度矩阵、总类内离散度矩阵
function[] = init()
mean_feature = [];
S = [];
for i = 0:9
    feature = get_mean_feature(i);
    mean_feature = [mean_feature; feature];
end
save mean_feature.mat mean_feature;

%下面计算各类的类内离散度矩阵
S = [];
for i=0:9
    Si = zeros(length(mean_feature(i+1,:)),length(mean_feature(i+1,:)));
    image_list = dir(strcat('./样本',num2str(i),'/*.png'));
    for j=1:length(image_list)
        feature = get_feature(imread(strcat('./样本',num2str(i),'/',image_list(j).name)));
        Si = Si+(feature-mean_feature(i+1))' * (feature-mean_feature(i+1));
    end
    S = [S;Si];
end
save S.mat S;
%S中每36行都是一类的类内离散度矩阵
%S(1:36,:)
    




    