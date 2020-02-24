%��Parzen����
function[pXwi] = get_pXwi(new_feature)
pXwi = [];
for i=0:9
    image_list = dir(strcat('./����',num2str(i),'/*.png'));
    p=0;
    for j=1:length(image_list)
        feature = get_feature(imread(strcat('./����',num2str(i),'/',image_list(j).name)));
        %pΪ����С���е�������
        p = p+window_function(new_feature-feature);
    end
    p = p/length(image_list);%������������
    p = p/1.5^length(new_feature);%���Կռ����
    pXwi = [pXwi,p];
end
