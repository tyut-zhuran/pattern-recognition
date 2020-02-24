%返回处理后的image
function[res] = pretreat(image)
%分割图像
image2 = imcrop(image,[32,2,43,58]);
%imshow(image2);
%不用RGB
image3 = rgb2gray(image2);
%imshow(image3);
%分割成10*9
%%%%--------------------------
%我想把数字整整齐齐地圈出来
%a：第一个坐标
for a = 1:30
    a = a+1;
    if(sum(image3(a,:)==0) > 3)
        break;
    end
end

%b:第二个。（a,b）是左上角坐标
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

%（c,d）是右下角坐标
for d = 20:43
    d = d+1;
    if(sum(image3(:,d)==0) < 3)
        break;
    end
end
%%%%--------------------------
image4 = imcrop(image3,[b,a,d-b,c-a]);
res = imresize(image4,[60,42]);