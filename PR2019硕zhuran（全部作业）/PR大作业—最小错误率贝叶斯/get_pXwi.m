%��С�������������������ܶȺ���pXwi
function[pXwi] = get_pXwi(new_feature)
mean_feature = [];
for i = 0:9
    mean_feature = [mean_feature;get_mean_feature(i)];
end
%mean_feature��10�У�ÿһ�д���һ���������

%��ֵ��
new_feature = new_feature>0.4;
pXwi = [];
for i=0:9
    p = 1;
    for j =1:length(new_feature)
        if(new_feature(j))
            p = p*mean_feature(i+1,j);
        else
            p = p*(1-mean_feature(i+1,j));
        end
    end
    pXwi = [pXwi,p];
end