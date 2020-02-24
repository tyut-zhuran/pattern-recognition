function [res] = test_bayes()
image = imread('template_temp.png');
%imshow(image)
new_feature = get_feature(image);
pXwi = get_pXwi(new_feature);
pwiX = get_pwiX(pXwi);
res = '';
for i =1:length(pwiX)
    res  =  sprintf('%s\r\n%s%s%s',res,num2str(i-1),'¡¢',num2str(pwiX(i)));
end