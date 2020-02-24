%get_number(image),传入image,返回识别结果recog_num
function[recog_num] = get_number(image)

new_feature = get_feature(image);
%多次循环，选出可能性最大的数字
for i = 1:9
    if (i==1)
        %第一次判断
        %子函数g(x,num1,num2),返回两个数字中可能性较大的值
        temp = g(new_feature,0,1);
    else
        temp = g(new_feature,temp,i);
    end
end
recog_num = temp;
end