function[res1,res2,zql] = main()
%��GUI�е��øú��������ز�������ʶ�����ȷ�������������ʶ����ȷ��
%dir('./����������/*.png')

res1 = [];%�����ȷ���
res2 = [];%��Ŵ�����
zq_num = 0;
sample_num = 0;
res1='';
res2='';
for i = 0:9
    str = strcat('./����������/',num2str(i),'*.png');
    %��ȡ����i��ȫ����������
    sample_list = dir(str);
    sample_num = sample_num + length(sample_list);
    for j=1:length(sample_list)
        %��ȡ��д����ͼƬ
        image = imread(strcat('./����������/',sample_list(j).name));
        %Ԥ����
        image1 = pretreat(image);
        pause(0.01);
        %ʶ��
        recog_num = get_number(image);
        imshow(image1);
        text(0,0,['ʶ������',num2str(recog_num)],'Color','red');
        %ʶ����ȷ
        if(i==recog_num)
            zq_num = zq_num + 1;
            %res1 = [res1,sample_list(j).name];
            res1 = sprintf('%s\r\n%s',res1,sample_list(j).name);
        else
            %res2 = [res2,sample_list(j).name]; 
            res2 = sprintf('%s\r\n%s',res2,sample_list(j).name);
        end
    end
end
%zql:��ȷ��
zql = zq_num/sample_num;



    