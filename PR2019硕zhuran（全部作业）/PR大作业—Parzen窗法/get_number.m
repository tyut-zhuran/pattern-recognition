%����ԭʼͼƬ������ʶ���������
function[res] = get_number(image)
feature = get_feature(image);
pXwi = get_pXwi(feature);
pwiX = get_pwiX(pXwi);
[m,res] = max(pwiX);
res = res-1;
