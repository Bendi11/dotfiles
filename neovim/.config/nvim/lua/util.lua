local M = {}

--- @param name string Name of the package to load
M.safeload = function(name)
    local ok, err = pcall(require, name)
    if not ok then
        vim.notify('Failed to load ' .. name .. ': ' .. err, vim.log.levels.WARN)
    end
end

--- @param dir string Path to load from relative to configuration root
M.safeload_directory = function (dir)
    local path = vim.fn.stdpath('config') .. '/lua/' .. dir:gsub('%.', '/')
    for name, type in vim.fs.dir(path) do
        if type == 'file' and name:match('%.lua$') then
            local lua_mod = dir .. '.' .. name:gsub('%.lua$', '')
            M.safeload(lua_mod)
        end
    end
end

return M
