%初始化函数，生成随机权值和获取所有训练样本。本次实验采用三层神经网络（输入层36节点，隐层46节点，输出层10节点）
function [] = init()
InNum = 36;
OutNum = 10;
HiddenNum =46;
%随机选（-1到1）作为输入层到隐层的权值(包含阈值)，第i行对应隐层第i个节点
w1 = rand(HiddenNum,InNum+1)*2-1;


%随机选（-1到1）作为隐层到输出层的权值(包含阈值)，第i行对应输出层第i个节点
w2 = rand(OutNum,HiddenNum+1)*2-1;

%feature_map共10页，分别存储10种类别的feature
feature_map= [];
for i=0:9
    sample_list = dir(strcat('./样本',num2str(i),'/*.png'));
    for j=1:length(sample_list)
        %先获取用于训练的样本特征
        image = imread(strcat('./样本',num2str(i),'/',sample_list(j).name));
        feature = get_feature(image);
        feature_map(j,:,i+1)=feature;
    end
end

save w1.mat w1
save w2.mat w2
save feature_map.mat feature_map
end