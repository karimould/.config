# My Neovim Config

## General

Arrow keys are disabled.

<details>
<summary>Plugins</summary>
<br>

**Plugin managment:**

- [packer](https://github.com/wbthomason/packer.nvim)

**Snippets:**

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

**LSP:**

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [lsp sage](https://github.com/glepnir/lspsaga.nvim)
- [additional fuctionality for TS](https://github.com/jose-elias-alvarez/typescript.nvim)
- [lsp kind](https://github.com/onsails/lspkind.nvim)

**CMD / Autocompletion:**

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)

**Formating / Linting:**

- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [mason-null-ls](https://github.com/jayp0521/mason-null-ls.nvim)

**Other:**

- [popup](https://github.com/nvim-lua/popup.nvim)
- [plenary](https://github.com/folke/plenary.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [bufferline](https://github.com/akinsho/bufferline.nvim)
- [which-key](https://github.com/folke/which-key.nvim)
- [toggleterm](https://github.com/akinsho/toggleterm.nvim)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [vim-maximizer](https://github.com/szw/vim-maximizer)
- [comment](https://github.com/numToStr/Comment.nvim)
- [vim-surround](https://github.com/tpope/vim-surround)
- [live server](https://github.com/manzeloth/live-server)
- [lazy git](https://github.com/kdheepak/lazygit.nvim)
- [harpoon](https://github.com/ThePrimeagen/harpoon)
</details>

<details>
<summary>Theme</summary>
<br>

- [vim-nigthfly](https://github.com/bluz71/vim-nightfly-colors)
</details>

## Custom Key-mappings

Note that,

- **Leader** key set as <kbd>Space</kbd>
- you can exist insert mode with "jj"

<details open>
  <summary>
    <strong>Key-mappings</strong>
  </summary>

### Vim Surround

| Key                                                                                        | Mode | Action | Note                                                                                                                                               |
| ------------------------------------------------------------------------------------------ | :--: | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| <kbd>y</kbd> + <kbd>s</kbd> + <kbd>Motion</kbd> + <kbd>Char to surround</kbd>              |  N   |        | for exmple <kbd>y</kbd> + <kbd>s</kbd> + <kbd>w</kbd> + <kbd>{</kbd> => to surround the next word with <kbd>{ </kbd> <kbd>}</kbd>                  |
| <kbd>c</kbd>+ <kbd>s</kbd> + <kbd>Motion</kbd> + <kbd>Old Char</kbd> + <kbd>New Char</kbd> |  N   |        | for exmple <kbd>y</kbd> + <kbd>s</kbd> + <kbd>w</kbd> + <kbd>{</kbd> => to change the surrounding of the next word with <kbd>{ </kbd> <kbd>}</kbd> |
| <kbd>d</kbd> + <kbd>s</kbd> + <kbd>Motion</kbd> + <kbd>Char to surround</kbd>              |  N   |        | for exmple <kbd>y</kbd> + <kbd>s</kbd> + <kbd>w</kbd> + <kbd>{</kbd> => to surround the next word with <kbd>{ </kbd> <kbd>}</kbd>                  |

### Windows Managment

#### Split

| Key                                            | Mode | Action | Note                                    |
| ---------------------------------------------- | :--: | ------ | --------------------------------------- |
| <kbd>Space</kbd> + <kbd>s</kbd> + <kbd>v</kbd> |  N   |        | split window verticaly                  |
| <kbd>Space</kbd> + <kbd>s</kbd> + <kbd>h</kbd> |  N   |        | split window horizontally               |
| <kbd>Space</kbd> + <kbd>s</kbd> + <kbd>e</kbd> |  N   |        | make split windows equal width & height |
| <kbd>Space</kbd> + <kbd>s</kbd> + <kbd>x</kbd> |  N   |        | close current split window              |
| <kbd>Space</kbd> + <kbd>s</kbd> + <kbd>m</kbd> |  N   |        | toggle split window maximization        |

#### Tab

| Key                             | Mode | Action | Note              |
| ------------------------------- | :--: | ------ | ----------------- |
| <kbd>Space</kbd> + <kbd>o</kbd> |  N   |        | open new tab      |
| <kbd>Space</kbd> + <kbd>x</kbd> |  N   |        | close current tab |
| <kbd>Space</kbd> + <kbd>n</kbd> |  N   |        | go to next tab    |
| <kbd>Space</kbd> + <kbd>p</kbd> |  N   |        | go to prev tab    |
| <kbd>tab</kbd>                  |  N   |        | circle next tab   |

#### Buffer Managment

| Key                             | Mode | Action | Note                |
| ------------------------------- | :--: | ------ | ------------------- |
| <kbd>Cntrl</kbd> + <kbd>h</kbd> |  N   |        | go to left buffer   |
| <kbd>Cntrl</kbd> + <kbd>j</kbd> |  N   |        | go to bottom buffer |
| <kbd>Cntrl</kbd> + <kbd>k</kbd> |  N   |        | go to upper buffer  |
| <kbd>Cntrl</kbd> + <kbd>l</kbd> |  N   |        | go to right buffer  |

### Telescope / Search

\*Note: You need ripgrep
| Key | Mode | Action | Note
| ----- |:----:| ------------------ | ------
|<kbd>Space</kbd> + <kbd>f</kbd> + <kbd>f</kbd>| N | | ( Find Files ) open find files
|<kbd>Space</kbd> + <kbd>f</kbd> + <kbd>s</kbd>| N | | ( Find String ) open live grep
|<kbd>Space</kbd> + <kbd>f</kbd> + <kbd>h</kbd>| N | | ( Find help ) open find help tags
|<kbd>Space</kbd> + <kbd>f</kbd> + <kbd>b</kbd>| N | | ( Find Branches ) open search all git branches
|<kbd>Space</kbd> + <kbd>s</kbd> | N | | find and replace for word under cursor

#### In Telescope

| Key                            | Mode | Action | Note                |
| ------------------------------ | :--: | ------ | ------------------- |
| <kbd>Ctrl</kbd> + <kbd>k</kbd> |  I   |        | move to prev result |
| <kbd>Ctrl</kbd> + <kbd>j</kbd> |  I   |        | move to next result |
| <kbd>Ctrl</kbd> + <kbd>q</kbd> |  I   |        | save to quick list  |

### File Tree

| Key                                            | Mode | Action | Note                               |
| ---------------------------------------------- | :--: | ------ | ---------------------------------- |
| <kbd>Space</kbd> + <kbd>e</kbd> + <kbd>e</kbd> |  N   |        | toggle file explorer               |
| <kbd>Space</kbd> + <kbd>e</kbd> + <kbd>f</kbd> |  N   |        | find current file in file explorer |

#### Keymaps in File Tree (mostly default)

| Key                            | Mode | Action | Note                                                                                             |
| ------------------------------ | :--: | ------ | ------------------------------------------------------------------------------------------------ |
| <kbd>Ctrl</kbd> + <kbd>v</kbd> |  N   |        | vsplit open the file in a vertical split                                                         |
| <kbd>Ctrl</kbd> + <kbd>x</kbd> |  N   |        | split open the file in a horizontal split                                                        |
| <kbd>Ctrl</kbd> + <kbd>t</kbd> |  N   |        | tabnew open the file in a new tab                                                                |
| <kbd>R</kbd>                   |  N   |        | refresh refresh the tree                                                                         |
| <kbd>a</kbd>                   |  N   |        | create add a file; leaving a trailing `/` will add a directory                                   |
| <kbd>d</kbd>                   |  N   |        | remove delete a file (will prompt for confirmation)                                              |
| <kbd>D</kbd>                   |  N   |        | trash trash a file via                                                                           |
| <kbd>r</kbd>                   |  N   |        | rename rename a file                                                                             |
| <kbd>x</kbd>                   |  N   |        | cut add/remove file/directory to cut clipboard                                                   |
| <kbd>c</kbd>                   |  N   |        | copy add/remove file/directory to copy clipboard                                                 |
| <kbd>p</kbd>                   |  N   |        | paste paste from clipboard; cut clipboard has precedence over copy; will prompt for confirmation |
| <kbd>y</kbd>                   |  N   |        | copy_name copy name to system clipboard                                                          |
| <kbd>Y</kbd>                   |  N   |        | copy_path copy relative path to system clipboard                                                 |
| <kbd>g</kbd> + <kbd>y</kbd>    |  N   |        | copy_absolute_path copy absolute path to system clipboard                                        |
| <kbd>W</kbd>                   |  N   |        | collapse_all collapse the whole tree                                                             |
| <kbd>E</kbd>                   |  N   |        | expand_all expand the whole tree, stopping after expanding                                       |

### Terminal

| Key                                            | Mode | Action | Note                       |
| ---------------------------------------------- | :--: | ------ | -------------------------- |
| <kbd>Space</kbd> + <kbd>T</kbd> + <kbd>f</kbd> |  N   |        | toggle floating terminal   |
| <kbd>Space</kbd> + <kbd>T</kbd> + <kbd>h</kbd> |  N   |        | toggle horizontal terminal |
| <kbd>Space</kbd> + <kbd>T</kbd> + <kbd>v</kbd> |  N   |        | toggle vertical terminal   |
| <kbd>Space</kbd> + <kbd>T</kbd> + <kbd>n</kbd> |  N   |        | toggle node terminal       |
| <kbd>Space</kbd> + <kbd>T</kbd> + <kbd>p</kbd> |  N   |        | toggle python terminal     |

### Git

| Key                                            | Mode | Action | Note                                         |
| ---------------------------------------------- | :--: | ------ | -------------------------------------------- |
| <kbd>Space</kbd> + <kbd>g</kbd> + <kbd>d</kbd> |  N   |        | ( Git Diff ) show git diff of current buffer |
| <kbd>Space</kbd> + <kbd>g</kbd> + <kbd>b</kbd> |  N   |        | ( Git Blame ) show git blame of current line |
| <kbd>Space</kbd> + <kbd>g</kbd> + <kbd>g</kbd> |  N   |        | open lazy git                                |

### Comment

| Key                                                       | Mode | Action | Note                 |
| --------------------------------------------------------- | :--: | ------ | -------------------- |
| <kbd>g</kbd> + <kbd>c</kbd> + <kbd>c</kbd>                |  N   |        | comment line         |
| <kbd>g</kbd> + <kbd>c</kbd> + <kbd>4</kbd> + <kbd>J</kbd> |  N   |        | comment 4 lines down |

### LSP / Code Actions

| Key                             | Mode | Action | Note                                        |
| ------------------------------- | :--: | ------ | ------------------------------------------- |
| <kbd>g</kbd> + <kbd>r</kbd>     |  N   |        | show definition, go to references           |
| <kbd>g</kbd> + <kbd>D</kbd>     |  N   |        | got to declaration                          |
| <kbd>g</kbd> + <kbd>d</kbd>     |  N   |        | see definition and make edits in window     |
| <kbd>g</kbd> + <kbd>i</kbd>     |  N   |        | go to implementation                        |
| <kbd>c</kbd> + <kbd>a</kbd>     |  N   |        | see available code actions                  |
| <kbd>r</kbd> + <kbd>n</kbd>     |  N   |        | smart rename                                |
| <kbd>Space</kbd> + <kbd>d</kbd> |  N   |        | show diagnostics for line                   |
| <kbd>Space</kbd> + <kbd>d</kbd> |  N   |        | show diagnostics for cursor                 |
| <kbd>[</kbd> + <kbd>d</kbd>     |  N   |        | jump to previous diagnostic in buffer       |
| <kbd>]</kbd> + <kbd>d</kbd>     |  N   |        | jump to next diagnostic in buffer           |
| <kbd>K</kbd>                    |  N   |        | show documentation for what is under cursor |
| <kbd>Space</kbd>+<kbd>o</kbd>   |  N   |        | see outline on right hand side              |

#### Typescript Specific Keymaps

| Key                                            | Mode | Action | Note                           |
| ---------------------------------------------- | :--: | ------ | ------------------------------ |
| <kbd>Space</kbd> + <kbd>r</kbd> + <kbd>f</kbd> |  N   |        | rename file and update imports |
| <kbd>Space</kbd> + <kbd>o</kbd> + <kbd>i</kbd> |  N   |        | organize imports               |
| <kbd>Space</kbd> + <kbd>r</kbd> + <kbd>u</kbd> |  N   |        | remove unused variables        |

### Harpoon

| Key                                            | Mode | Action | Note                           |
| ---------------------------------------------- | :--: | ------ | ------------------------------ |
| <kbd>Space</kbd> + <kbd>h</kbd> + <kbd>a</kbd> |  N   |        | add current file to harpoon    |
| <kbd>Space</kbd> + <kbd>h</kbd> + <kbd>u</kbd> |  N   |        | open harpoon ui                |
| <kbd>Space</kbd> + <kbd>h</kbd> + <kbd>1</kbd> |  N   |        | jump to first file in harpoon  |
| <kbd>Space</kbd> + <kbd>h</kbd> + <kbd>2</kbd> |  N   |        | jump to second file in harpoon |

</details>
