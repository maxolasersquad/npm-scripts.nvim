# NPM-Scripts.nvim

NPM-Scripts is a Neovim plugin to easily run any script defined in your
package.json file.

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'maxolasersquad/npm-scripts',
  cond = function()
    return vim.fn.filereadable(vim.fn.getcwd() .. '/package.json') == 1
  end,
  config = function()
    require('npm')
    -- Optional: Add your key mapping here
    vim.api.nvim_set_keymap('n',
                            '<leader>npm',
                            ':Npm ',
                            { noremap = true, silent = false }
                           )
  end
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'maxolasersquad/npm-scripts',
  cond = function()
    return vim.fn.filereadable(vim.fn.getcwd() .. '/package.json') == 1
  end,
  config = function()
    require('npm')
    -- Optional: Add your key mapping here
    vim.api.nvim_set_keymap('n',
                            '<leader>npm',
                            ':Npm ',
                            { noremap = true, silent = false }
                           )
  end
}
```

## Usage

If we assume your `package.json` contains the following `scripts` object:

```json
  "scripts": {
    "start": "webpack serve --mode development",
    "build": "webpack --mode production",
    "lint": "eslint ./src",
    "prettier": "prettier -c ./src",
  }
```

You can run the `start` script by typing `:Npm start`. You can also type
`:Npm <Tab>` to auto-complete all available scripts.

If you defined the optional keymap, then you can do the same using your leader
key.

