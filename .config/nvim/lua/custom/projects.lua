-- ~/.config/nvim/lua/custom/projects.lua

local fzf_status_ok, fzf_lua = pcall(require, 'fzf-lua')

if not fzf_status_ok then
  vim.notify('Custom projects: fzf-lua not loaded. Error: ' .. tostring(fzf_lua), vim.log.levels.ERROR)
  return {}
end

if type(fzf_lua) ~= 'table' then
  vim.notify('Custom projects: fzf-lua did not return a table. Actual type: ' .. type(fzf_lua), vim.log.levels.ERROR)
  return {}
end

local scan_status_ok, scan = pcall(require, 'plenary.scandir')

if not scan_status_ok then
  vim.notify('Custom projects: plenary.scandir not loaded. Error: ' .. tostring(scan), vim.log.levels.ERROR)
  return {}
end

if type(scan) ~= 'table' then
  vim.notify('Custom projects: plenary.scandir did not return a table. Actual type: ' .. type(scan), vim.log.levels.ERROR)
  return {}
end

local M = {}

M.projects = function(projects, opts)
  local repos = {}

  projects = projects or {}
  opts = opts or {}
  opts.prompt = 'Projects> '
  opts.actions = {
    ['default'] = function(selected)
      if selected and type(selected) == 'table' and #selected > 0 and selected[1] then
        local target_path = repos[selected[1]]
        if target_path then
          vim.notify('Changing directory to: ' .. target_path, vim.log.levels.INFO)
          vim.cmd('cd ' .. target_path)
        else
          vim.notify('Selected project path not found in repos: ' .. tostring(selected[1]), vim.log.levels.WARN)
        end
      else
        vim.notify('No project selected or invalid selection.', vim.log.levels.WARN)
      end
    end,
  }

  local max_depth = opts.max_depth or 5

  for _, project in ipairs(projects) do
    local key = string.match(project, '.*/(.*)')
    local absolute_path = vim.fn.expand(project)

    repos[key] = absolute_path

    if type(scan.scan_dir) ~= 'function' then
      vim.notify('Custom projects: scan.scan_dir is not a function. scandir module might be corrupted.', vim.log.levels.ERROR)
      return
    end

    local git_dirs = scan.scan_dir(absolute_path, {
      depth = max_depth,
      add_dirs = true,
      hidden = true,
      search_pattern = '%.git$',
    })

    if type(git_dirs) ~= 'table' then
      vim.notify('Custom projects: scan.scan_dir did not return a table for git_dirs. Type: ' .. type(git_dirs), vim.log.levels.ERROR)
      git_dirs = {}
    end

    for _, val in ipairs(git_dirs) do
      local git_dir = string.gsub(val, '/.git$', '')
      key = string.match(git_dir, '.*/(.*)') or git_dir
      if repos[key] and repos[key] ~= git_dir then
        -- Optionally handle duplicates, but no print here
      end
      repos[key] = git_dir
    end
  end

  local dirs = {}
  for key in pairs(repos) do
    dirs[#dirs + 1] = key
  end

  table.sort(dirs, function(a, b)
    if type(a) ~= 'string' or type(b) ~= 'string' then
      vim.notify('Custom projects: Attempted to sort non-string values. Please check project paths.', vim.log.levels.ERROR)
      return false
    end
    return a:lower() < b:lower()
  end)

  fzf_lua.fzf_exec(dirs or {}, opts)
end

return M
