 -- lua/austino/functions.lua

local create_command = vim.api.nvim_create_user_command
local get_cwd = vim.loop.cwd

function ArrayConcat(a1, a2)
    if a1 == nil and a2 == nil then return nil
    elseif a1 == nil then return a2
    elseif a2 == nil then return a1
    end

    for i=1, #a2 do
        a1[#a1+1] = a2[1]
    end
    return a1
end

function ArrayContains(a, val)
    if a == nil then return false end
    for i=1, #a do
        if a[i] == val then
            return true
        end
    end
    return false
end

function ArrayIntersect(a1, a2)
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
        if ArrayContains(a2, a1[i]) then
            _res[k] = a1[i]
        end
    end
    return _res
end

function ArrayPrint(a)
    for i=1,#a do
        print(a[i])
    end
end

function ArrayJoin(a1, a2)
    if a1 == nil and a2 == nil then return nil
    elseif a1 == nil then return a2
    elseif a2 == nil then return a1
    end

    local res = {}
    for i=1, #a1 do
        res[i] = a1[i]
    end
    for i=1, #a2 do
        if not ArrayContains(res, a2[i]) then
            res[#res+1] = a2[i]
        end
    end
    return res
end

function ArrayMap(a, f)
    if a == nil then return nil end
    local res = {}
    for i=1, #a do
        if a[i] ~= nil then 
            res[#res+1] = f(a[i])
        end
    end
    return res
end

function ArrayFilter(a, f)
    local res = {}
    for i=1, #a do
        if f(a[i]) == true then
            res[#res+1] = a[i]
        end
    end
    return res
end

function rfind(str, char)
    local index = str:find(char, 1, true)
    local lastIndex = nil
    while index do
        lastIndex = index
        index = str:find(char, index + 1, true)
    end
    return lastIndex
end

function StripFileExt(fname)
    pos = rfind(fname, ".")
    if pos == nil then 
        return fname.."/" 
    end
    return string.sub(fname, 0, pos-1)
end

create_command('OpenCSplit',
    function(opts)
        print("we are here 1")
        print(get_cwd())
    end, { 
        nargs=1, -- this can later be '+' to open multiple tabs of splits at once
        complete = function(ArgLead, CmdLine, CursorPos)
            function listfiles(dirname)
                print("we are here 2")
                local i = 0
                local filenames = {}
                local pfile = io.popen('ls -a "'..dirname..'"')
                for filename in pfile:lines() do
                    i = i + 1
                    if filename ~=(nil or "." or ".." or "\n" or "") then
                        filenames[#filenames+1] = filename
                    end
                end
                pfile:close()
                return filenames
            end

            dirname = get_cwd()

            local slash_pos = rfind(ArgLead, "/")
            local suffix = ""
            local so_far = ArgLead
            if slash_pos ~= nil then
                 suffix = ArgLead:sub(1, slash_pos)
                 so_far = ArgLead:sub(slash_pos, (#ArgLead-slash_pos))
                 print("ArgLead="..ArgLead)
                 print("#ArgLead="..tostring(#ArgLead))
                 print("slash_pos="..tostring(slash_pos))
            end

            header_dir = dirname.."/include/"..suffix
            src_dir = dirname.."/src/"..suffix

            print(header_dir)
            print(src_dir)

            header_files = listfiles(header_dir)
            src_files = listfiles(src_dir)

            local is_match = function(fname) 
                if #so_far == 0 then return true end
                return fname:sub(1, #so_far) == so_far 
            end

            local prefix = suffix -- now we prepend it so we're renaming it

            function prepend_dir_prefix(fname) return prefix..fname end

            local map = ArrayMap
            local join = ArrayJoin
            local filter = ArrayFilter

            return map(
                join(
                    filter(map(header_files, StripFileExt), is_match),
                    filter(map(src_files, StripFileExt), is_match)
                ), 
                prepend_dir_prefix
            )
        end
    }
)
