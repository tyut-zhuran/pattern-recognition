%��ʼ���������������Ȩֵ�ͻ�ȡ����ѵ������������ʵ��������������磨�����36�ڵ㣬����46�ڵ㣬�����10�ڵ㣩
function [] = init()
InNum = 36;
OutNum = 10;
HiddenNum =46;
%���ѡ��-1��1����Ϊ����㵽�����Ȩֵ(������ֵ)����i�ж�Ӧ�����i���ڵ�
w1 = rand(HiddenNum,InNum+1)*2-1;


%���ѡ��-1��1����Ϊ���㵽������Ȩֵ(������ֵ)����i�ж�Ӧ������i���ڵ�
w2 = rand(OutNum,HiddenNum+1)*2-1;

%feature_map��10ҳ���ֱ�洢10������feature
feature_map= [];
for i=0:9
    sample_list = dir(strcat('./����',num2str(i),'/*.png'));
    for j=1:length(sample_list)
        %�Ȼ�ȡ����ѵ������������
        image = imread(strcat('./����',num2str(i),'/',sample_list(j).name));
        feature = get_feature(image);
        feature_map(j,:,i+1)=feature;
    end
end

save w1.mat w1
save w2.mat w2
save feature_map.mat feature_map
end