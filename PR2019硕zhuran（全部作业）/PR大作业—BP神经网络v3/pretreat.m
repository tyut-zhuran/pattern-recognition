%���ش�����image
function[res] = pretreat(image)
%�ָ�ͼ��
image2 = imcrop(image,[32,2,43,58]);
%imshow(image2);
%����RGB
image3 = rgb2gray(image2);
%imshow(image3);
%�ָ��10*9
%%%%--------------------------
%������������������Ȧ����
%a����һ������
for a = 1:30
    a = a+1;
    if(sum(image3(a,:)==0) > 3)
        break;
    end
end

%b:�ڶ�������a,b�������Ͻ�����
for b = 1:20
    b = b+1;
    if(sum(image3(:,b)==0) > 3)
        break;
    end
end

for c = 30:58
    c = c+1;
    if(sum(image3(c,:)==0) < 3)
        break;
    end
end

%��c,d�������½�����
for d = 20:43
    d = d+1;
    if(sum(image3(:,d)==0) < 3)
        break;
    end
end
%%%%--------------------------
image4 = imcrop(image3,[b,a,d-b,c-a]);
res = imresize(image4,[60,42]);