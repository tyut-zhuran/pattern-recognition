function[pwiX] = get_pwiX(pXwi)
%强行假设先验概率相等
pwi = [0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];
pwiX = (pwi.*pXwi)/sum(pwi.*pXwi);
