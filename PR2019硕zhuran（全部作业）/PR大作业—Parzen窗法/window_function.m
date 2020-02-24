%方形窗口函数
function[res] = window_function(vec)
if ((vec<0.75) &(vec>-0.75)) == ones(1,36)
    res=1;
else
    res=0;
end
end
