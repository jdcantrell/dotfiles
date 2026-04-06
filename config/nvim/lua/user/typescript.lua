local lsp = require('lspconfig')

local function readFile(filePath)
  local file = io.open(filePath, "r")

  if not file then
    return nil
  end

  local contents = file:read("*all")

  file:close()

  return contents;
end

local function read_nearest_ts_config(fromFile)
  local rootDir = vim.fs.root(0, { 'tsconfig.json' })

  if not rootDir then
    return nil
  end

  local tsConfig = rootDir .. "/tsconfig.json"
  local contents = readFile(tsConfig)
  local manifest = readFile(rootDir .. "/package.json")

  if not contents then
    return nil
  end

  if not manifest then
    return nil
  end


  -- BUG:
  --   this does not follow "extends" or global tsconfigs if a "one tsconfig.json"
  --   is used.
  local isGlint = string.find(contents, '"glint"')
  -- NOTE: hyphens don't work here
  local hasGlintPlugin = string.find(manifest, "@glint/tsserver")

  return {
    isGlint = not not isGlint,
    isGlintPlugin = not not hasGlintPlugin,
    rootDir = rootDir,
  };
end

local function is_ts_project(filename, onDir)
  local result = read_nearest_ts_config(filename)

  if not result then
    return nil
  end

  if (result.isGlintPlugin) then
    return onDir(result.rootDir)
  end

  if (result.isGlint) then
    return nil
  end

  return onDir(result.rootDir)
end

local function is_glint_project(filename, bufnr)
  local result = read_nearest_ts_config(filename)

  if not result then
    return nil
  end

  if (not result.isGlintPlugin) then
    return nil
  end

  if (not result.isGlint) then
    return nil
  end

  return result.rootDir
end



local filetypes = {
  'typescript',
  'javascript',
  'typescript.glimmer',
  'javascript.glimmer',
  'typescript.tsx',
  'javascript.jsx',
  'typescriptreact',
  'javascriptreact',
  'html.handlebars',
  'handlebars',
}

-- https://neovim.io/doc/user/lsp.html
vim.lsp.config('ts_ls', {
  -- This allows us to switch types of TSServers based on the open file.
  -- We don't always need the @glint/tsserver-plugin -- for example, in backend projects.
  root_dir = is_ts_project,
  settings = {
    hostInfo = "neovim native TS LS",
    maxTsServerMemory = 8000,
    -- implicitProjectConfig = {
    --   experimentalDecorators = true
    -- },
    disableAutomaticTypingAcquisition = true,
    importModuleSpecifierPreference = "relative",
    importModuleSpecifierEnding = "minimal",
  },
  init_options = {
    -- tsserver = { logVerbosity = 'verbose', trace = "verbose" },
    preferences = {
      disableAutomaticTypingAcquisition = true,
      importModuleSpecifierPreference = "relative",
      importModuleSpecifierEnding = "minimal",
    },
    plugins = {
      -- All plugins need to be defined here,
      -- even if we have to change the location later
      {
        name = "@glint/tsserver-plugin",
        location = "/your/path/to/@glint/tsserver-plugin",
        languages = filetypes
      },
    },
  },
  filetypes = filetypes,
  on_new_config = function(new_config, new_root_dir)
    local info = read_nearest_ts_config(new_root_dir)
    local glintPlugin = new_root_dir .. "node_modules/@glint/tsserver-plugin"

    if new_config.init_options then
      if (info.isGlintPlugin) then
        new_config.init_options.plugins = {
          {
            name = "@glint/tsserver-plugin",
            location = glintPlugin,
            languages = filetypes,
            enableForWorkspaceTypeScriptVersions = true,
            configNamespace = "typescript"
          }
        }
      end
    end
  end,
})


vim.lsp.config('glint', {
  root_dir = is_glint_project,
})

vim.lsp.enable('ts_ls')
vim.lsp.enable('glint')
