%用Parzen窗法
function[pXwi] = get_pXwi(new_feature)
pXwi = [];
for i=0:9
    image_list = dir(strcat('./样本',num2str(i),'/*.png'));
    p=0;
    for j=1:length(image_list)
        feature = get_feature(imread(strcat('./样本',num2str(i),'/',image_list(j).name)));
        %p为落入小舱中的样本数
        p = p+window_function(new_feature-feature);
    end
    p = p/length(image_list);%除以样本总数
    p = p/1.5^length(new_feature);%除以空间体积
    pXwi = [pXwi,p];
end
