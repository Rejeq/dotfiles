local dap = require "dap"
local masonDap = require "mason-nvim-dap"
-- local masonDapAutoSetup = require "mason-nvim-dap.automatic_setup"

local masonInstalled = {
  'clangd',
  'cmake',
  'sumneko_lua',
}

masonDap.setup({
    ensure_installed = masonInstalled
})

masonDap.setup_handlers {
    function(source_name)
      -- all sources with no handler get passed here


      -- Keep original functionality of `automatic_setup = true`
      masonDap.automatic_setup(source_name)
    end,
    python = function(source_name)
        dap.adapters.python = {
	        type = "executable",
	        command = "/usr/bin/python3",
	        args = {
		        "-m",
		        "debugpy.adapter",
	        },
        }

        dap.configurations.python = {
	        {
		        type = "python",
		        request = "launch",
		        name = "Launch file",
		        program = "${file}", -- This configuration will launch the current file if used.
	        },
        }
    end,
}
