local lspconfig = require("lspconfig")
lspconfig.pyright.setup {}
lspconfig.clangd.setup {
  cmd = { "clangd", "--query-driver=/usr/bin/clang++,/usr/bin/clang,*" },
}
lspconfig.svlangserver.setup {
  cmd = { "svlangserver" },
  filetypes = { "verilog", "systemverilog" },
  root_dir = lspconfig.util.root_pattern("*.v", "*.sv"),
}
