%��ȡĳһͼ���������36ά
function[feature] = get_feature(image)

%��ͼ���зָ����д����
image2 = pretreat(image);
A = mat2cell(image2,[10,10,10,10,10,10],[7,7,7,7,7,7]);
B = reshape(A,1,36);
for i=1:length(B)
    temp = cell2mat(B(i));
    %feature(i)��ʾ�����ص�ռһ��С��ı���
    feature(i) = sum(temp(:) ~= 255) / numel(temp);
end
%feature
end