%get_number(image),����image,����ʶ����recog_num
function[recog_num] = get_number(image)

new_feature = get_feature(image);
%���ѭ����ѡ����������������
for i = 1:9
    if (i==1)
        %��һ���ж�
        %�Ӻ���g(x,num1,num2),�������������п����Խϴ��ֵ
        temp = g(new_feature,0,1);
    else
        temp = g(new_feature,temp,i);
    end
end
recog_num = temp;
end