local config_root = fn.stdpath("config")
package_path = package_path .. ";" .. config_root .. "?.lua;"

plugless = require("plugless")

plugless.plugins = {
    {name = "telescope", url = "https://github.com/telescope/telescope.git"}
}
