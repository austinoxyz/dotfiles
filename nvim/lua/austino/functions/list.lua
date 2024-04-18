-- lua/austino/functions/list.lua

function ListConcat(a1, a2)
    if a1 == nil and a2 == nil then return nil
    elseif a1 == nil then return a2
    elseif a2 == nil then return a1
    end

    for i=1, #a2 do
        a1[#a1+1] = a2[1]
    end
    return a1
end

function ListContains(a, val)
    if a == nil then return false end
    for i=1, #a do
        if a[i] == val then
            return true
        end
    end
    return false
end

function ListIntersect(a1, a2)
    if a1 == nil and a2 == nil then return nil
    elseif a1 == nil then return a2
    elseif a2 == nil then return a1
    end

    local _res = {}
    local k = 0
    if #a1 < #a2 then
        tmp = a1
        a1 = a2
        a2 = tmp
    end
    for i=1, #a1 do
        if ListContains(a2, a1[i]) then
            _res[k] = a1[i]
        end
    end
    return _res
end

function ListPrint(a)
    for i=1,#a do
        print(a[i])
    end
end

function ListJoin(a1, a2)
    if a1 == nil and a2 == nil then return nil
    elseif a1 == nil then return a2
    elseif a2 == nil then return a1
    end

    local res = {}
    for i=1, #a1 do
        res[i] = a1[i]
    end
    for i=1, #a2 do
        if not ListContains(res, a2[i]) then
            res[#res+1] = a2[i]
        end
    end
    return res
end

function ListMap(a, f)
    if a == nil then return nil end
    local res = {}
    for i=1, #a do
        if a[i] ~= nil then 
            res[#res+1] = f(a[i])
        end
    end
    return res
end

function ListFilter(a, f)
    local res = {}
    for i=1, #a do
        if f(a[i]) == true then
            res[#res+1] = a[i]
        end
    end
    return res
end
