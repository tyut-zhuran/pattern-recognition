%返回数字num的样本集的mean_feature，是一个1*36的向量
function[mean_feature] = get_mean_feature(num)
feature_list = [];
image_list = dir(strcat('./样本',num2str(num),'/*.png'));
for i = 1:length(image_list)
    feature = get_feature(imread(strcat('./样本',num2str(num),'/',image_list(i).name)));
    feature_list = [feature_list;feature];
end

mean_feature = mean(feature_list);