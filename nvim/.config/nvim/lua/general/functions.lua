-- TODO: should be moved it to utils?
local is_empty = function (value)
  if value == nil then
    return true
  elseif value == "" then
    return true
  elseif value == 0 then
    return true
  else
    return false
  end
end

local highlight_at_colorcolumn = function()

  local colorcolumn = vim.o.colorcolumn
  local textwidth = vim.o.textwidth

  if is_empty(colorcolumn) then
    if is_empty(textwidth) then
      print("colorcolumn=80")
      vim.o.colorcolumn = "80"
    else
      print("colorcolumn=+1")
      vim.o.colorcolumn = "+1"
    end
  else
    print("colorcolumn=")
    vim.o.colorcolumn = ""
  end
end

return { highlight_at_colorcolumn = highlight_at_colorcolumn }
