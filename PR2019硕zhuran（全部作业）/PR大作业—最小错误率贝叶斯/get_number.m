%传入图片，返回识别结果
function[res] = get_number(image)
feature = get_feature(image);
%类条件概率密度
pXwi = get_pXwi(feature);
%后验概率
pwiX = get_pwiX(pXwi);
[m,res] = max(pwiX);
res = res-1;
