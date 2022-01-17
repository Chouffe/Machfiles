local _2afile_2a = "/home/chouffe/.config/nvim/fnl/config/plugins/lsp.fnl"
local _2amodule_name_2a = "config.plugins.lsp"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local configs, lsp, nvim, util, _ = autoload("lspconfig.configs"), autoload("lspconfig"), autoload("aniseed.nvim"), autoload("lspconfig/util"), nil
_2amodule_locals_2a["configs"] = configs
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["util"] = util
_2amodule_locals_2a["_"] = _
--[[ lsp configs lspconfigutil ]]--
local on_attach
local function _1_(client, bufnr)
  local opts = {noremap = true, silent = true}
  local buf_set_keymap
  local function _2_(mode, mapping, target)
    return nvim.buf_set_keymap(bufnr, mode, mapping, target, opts)
  end
  buf_set_keymap = _2_
  local buf_set_option
  local function _3_(name, value)
    return nvim.buf_set_option(bufnr, name, value)
  end
  buf_set_option = _3_
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  buf_set_keymap("n", "<space>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>")
  buf_set_keymap("n", "<space>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
  buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>")
  if client.resolved_capabilities.document_formatting then
    do
      nvim.ex.augroup("lsp_highlight")
      nvim.ex.autocmd_()
      do
        nvim.ex.autocmd("CursorHold", "<buffer>", "lua vim.lsp.buf.formatting_sync(nil, 1000)")
      end
      nvim.ex.augroup("END")
    end
    return print("Can format document on save")
  else
    return nil
  end
end
on_attach = _1_
return lsp.clojure_lsp.setup({on_attach = on_attach})