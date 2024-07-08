local function read_package_json()
  local file = io.open("package.json", "r")
  if not file then
    return {}
  end

  local content = file:read("*a")
  file:close()

  local package_json = vim.fn.json_decode(content)
  return package_json and package_json.scripts or {}
end

local function get_npm_commands()
  local scripts = read_package_json()
  local commands = {}

  for cmd, _ in pairs(scripts) do
    table.insert(commands, cmd)
  end

  return commands
end

local function complete_npm_command(lead, _, _)
  local commands = get_npm_commands()
  local matches = {}
  for _, cmd in ipairs(commands) do
    if cmd:find(lead, 1, true) == 1 then
      table.insert(matches, cmd)
    end
  end
  return matches
end

local function npm_command(cmd)
  vim.cmd("terminal npm run " .. cmd)
end

vim.api.nvim_create_user_command("Npm", function(opts)
  npm_command(opts.args)
end, { nargs = "+", complete = complete_npm_command })

vim.api.nvim_set_keymap(
  "n",
  "<leader>npm",
  ":Npm ",
  { noremap = true, silent = false }
)
