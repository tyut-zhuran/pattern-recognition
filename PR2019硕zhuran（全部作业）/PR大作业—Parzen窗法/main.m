function[res1,res2,zql] = main()
%在GUI中调用该函数，返回测试样本识别的正确结果、错误结果和识别正确率
%dir('./测试样本集/*.png')

res1 = [];%存放正确结果
res2 = [];%存放错误结果
zq_num = 0;
sample_num = 0;
res1='';
res2='';
for i = 0:9
    str = strcat('./测试样本集/',num2str(i),'*.png');
    %获取数字i的全部测试样本
    sample_list = dir(str);
    sample_num = sample_num + length(sample_list);
    for j=1:length(sample_list)
        %获取手写数字图片
        image = imread(strcat('./测试样本集/',sample_list(j).name));
        %预处理
        image1 = pretreat(image);
        pause(0.01);
        %识别
        recog_num = get_number(image);
        imshow(image1);
        text(0,0,['识别结果：',num2str(recog_num)],'Color','red');
        %识别正确
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
%zql:正确率
zql = zq_num/sample_num;



    