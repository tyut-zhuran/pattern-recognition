%��̬�ֲ����������������������ܶȺ���pXwi
function[pXwi] = get_pXwi(new_feature)
load mean_feature;
%mean_feature�ŵ���������ִ��
%������mean_feature��ÿһ�ж���һ������mean_feature
%Ҳ����Ҫ���ƵĲ���miu
%�������sigma
pXwi = [];
for i =0:9
    miu = mean_feature(i+1,:);
    image_list = dir(strcat('./����',num2str(i),'/*.png'));
    sigma = zeros(length(miu),length(miu));
    for j=1:length(image_list)
        feature = get_feature(imread(strcat('./����',num2str(i),'/',image_list(j).name))); 
        sigma = sigma+(feature-miu)'*(feature-miu);
    end
    %�޷���֤sigma�����죬�����ڶԽ��߼�һ�����֣��������Խ������Ӱ��
    sigma = (sigma+10*diag(ones(1,length(new_feature))))/length(image_list);
    %����ʽ�������������ܶȺ���
    p = ((2*pi)^(-length(new_feature)/2)) * ((det(sigma))^(-1/2)) * exp(-0.5*((new_feature-miu)*inv(sigma)*(new_feature-miu)' ));
    pXwi = [pXwi,p];
end
