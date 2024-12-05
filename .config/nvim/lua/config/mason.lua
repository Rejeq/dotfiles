local mason = require('mason')

local ui = {
  icons = {
    package_installed = "✓",
    package_pending = "➜",
    package_uninstalled = "✗",
  },
}

mason.setup({ ui = ui })
