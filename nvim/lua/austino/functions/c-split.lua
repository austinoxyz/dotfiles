-- lua/austino/functions/c-split.lua

require "austino.functions.list"

local create_command = vim.api.nvim_create_user_command
local get_cwd = vim.loop.cwd

_G.cpp_file_extensions = { header={"h","hpp","hh"}, source={"c","cpp","cc"} }

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

function FileExists(name)
   local f = io.open(name, "r")
   return f ~= nil and io.close(f)
end

function FindFileExtension(basename, candidates)
    for i, ext in pairs(candidates) do
        if FileExists(basename .. "." .. ext) then
            return ext
        end
    end
    return nil
end

-- FIXME: Allow for multiple arguments to open multiple tabs
-- 
-- For C/C++ projects, open a header/source file in a tabnew vsplit, 
-- or just one in a tabnew if only one exists. 
--
-- The function assumes that headers are located in `./include/` 
-- and sources are located in `./src/`.
--
-- Will match on any of ("h","hpp","hh") and ("c","cpp","cc") as 
-- file extensions for the argument passed.
--
-- Usage - :OpenCSplit filename-base
--       - :OpenCSplit path/to/filename-base
create_command('OpenCSplit',
    function(opts)
        if #opts.fargs == 0 then return end

        -- hacky check to make sure we're in a c/c++ project
        -- FIXME: Add check for existence of ./include/ and ./src/

        for i, basename in pairs(opts.fargs) do
            local header_ext = FindFileExtension("include/"..basename, _G.cpp_file_extensions.header)
            local src_ext = FindFileExtension("src/"..basename, _G.cpp_file_extensions.source)

            local command = nil
            if header_ext == nil and src_ext == nil then
                return
            elseif header_ext == nil then
                vim.cmd(string.format("tabnew src/%s.%s", basename, src_ext))
            elseif src_ext == nil then
                vim.cmd(string.format("tabnew include/%s.%s", basename, header_ext))
            else
                vim.cmd(string.format("tabnew include/%s.%s | vsplit src/%s.%s", basename, header_ext, basename, src_ext))
            end
        end
    end, 
    {
        nargs='+',
        complete = function(ArgLead, CmdLine, CursorPos)
            function listfiles(dirname)
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
            local resolved = ""
            local query = ArgLead

            if slash_pos ~= nil then
                 resolved = ArgLead:sub(1, slash_pos)
                 query = ArgLead:sub(slash_pos+1)
            end

            header_dir = dirname.."/include/"..resolved
            header_files = listfiles(header_dir)

            src_dir = dirname.."/src/"..resolved
            src_files = listfiles(src_dir)

            local prepend_resolved_directories = function(fname) 
                return resolved..fname 
            end

            local is_match = function(fname_base)
                if #query == 0 then return true end
                return fname_base:sub(1, #query) == query 
            end

            return ListMap(
                ListJoin(
                    ListFilter(ListMap(header_files, StripFileExt), is_match),
                    ListFilter(ListMap(src_files, StripFileExt), is_match)
                ), 
                prepend_resolved_directories
            )
        end
    }
)

create_command('NewCSplit',
    function(opts) 
        if #opts.fargs == 0 then return end


    end, 
    {
        nargs='+'
    }
)

