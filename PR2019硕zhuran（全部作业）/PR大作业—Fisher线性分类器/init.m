%��Ҫ��ɳ�ʼ�����������������������ɢ�Ⱦ�����������ɢ�Ⱦ���
function[] = init()
mean_feature = [];
S = [];
for i = 0:9
    feature = get_mean_feature(i);
    mean_feature = [mean_feature; feature];
end
save mean_feature.mat mean_feature;

%�����������������ɢ�Ⱦ���
S = [];
for i=0:9
    Si = zeros(length(mean_feature(i+1,:)),length(mean_feature(i+1,:)));
    image_list = dir(strcat('./����',num2str(i),'/*.png'));
    for j=1:length(image_list)
        feature = get_feature(imread(strcat('./����',num2str(i),'/',image_list(j).name)));
        Si = Si+(feature-mean_feature(i+1))' * (feature-mean_feature(i+1));
    end
    S = [S;Si];
end
save S.mat S;
%S��ÿ36�ж���һ���������ɢ�Ⱦ���
%S(1:36,:)
    




    