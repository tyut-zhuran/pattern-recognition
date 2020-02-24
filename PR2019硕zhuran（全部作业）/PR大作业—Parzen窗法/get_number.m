%传入原始图片，返回识别出的数字
function[res] = get_number(image)
feature = get_feature(image);
pXwi = get_pXwi(feature);
pwiX = get_pwiX(pXwi);
[m,res] = max(pwiX);
res = res-1;
