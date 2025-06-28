local fn = vim.fn
local api = vim.api
local config_root = fn.stdpath("config")

M = {}
M.plugins = {

}
M.colorschemes = {

}

function get_git (dir, address) 
  os.execute("git clone " .. address .. " " .. dir)
end

function handle_colourschemes ()

end

M.start = function () 
  
  --adds basic runtime paths
  local lua_paths = {
    config_root .. "/lua/?.lua",
    config_root .. "/lua/?/init.lua",
  }
  
  --adds all runtime_paths to the package path so the files can be required
  local rp = api.nvim_list_runtime_paths()
  for _, path in ipairs(rp) do

    local lua_dir = path .. "/lua"
    if fn.isdirectory(lua_dir) == 1 then
      table.insert(lua_paths, 1, lua_dir .. "/?.lua")
      table.insert(lua_paths, 1, lua_dir .. "/?/init.lua")
    end
  end

  package.path = table.concat(lua_paths, ";") .. ";" .. package.path


  --sources all the config files

  for plugin in M.plugins do
    require("config."plugin.name)
  end

  -- pregiven config files
  require("config.keymap")
  require("config.config")

end

return M
