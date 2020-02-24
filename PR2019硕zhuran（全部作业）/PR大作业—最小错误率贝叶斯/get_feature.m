%获取某一图像的特征，36维
function[feature] = get_feature(image)

%从图像中分割出手写部分
image2 = pretreat(image);
A = mat2cell(image2,[10,10,10,10,10,10],[7,7,7,7,7,7]);
B = reshape(A,1,36);
for i=1:length(B)
    temp = cell2mat(B(i));
    %feature(i)表示黑像素点占一个小块的比例
    feature(i) = sum(temp(:) ~= 255) / numel(temp);
end
%feature
end