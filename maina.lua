-- 这是测试lua代码用的

local abc = function (pfn)
    print("xxx")
    if pfn then 
        pfn()
    end
    return true
end

if abc(function () 
        print(123) 
        end) 
    then  
    print(456)
end