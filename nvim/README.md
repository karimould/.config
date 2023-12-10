# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

Custom keymaps

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

#### Buffer Managment

| Key                                            | Mode | Action | Note                            |
| ---------------------------------------------- | :--: | ------ | ------------------------------- |
| <kbd>Cntrl</kbd> + <kbd>h</kbd>                |  N   |        | go to left buffer               |
| <kbd>Cntrl</kbd> + <kbd>j</kbd>                |  N   |        | go to bottom buffer             |
| <kbd>Cntrl</kbd> + <kbd>k</kbd>                |  N   |        | go to upper buffer              |
| <kbd>Cntrl</kbd> + <kbd>l</kbd>                |  N   |        | go to right buffer              |
| <kbd>Space</kbd> + <kbd>b</kbd> + <kbd>d</kbd> |  N   |        | buffer close / delete (current) |

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

| Key                                            | Mode | Action | Note                 |
| ---------------------------------------------- | :--: | ------ | -------------------- |
| <kbd>Space</kbd> + <kbd>e</kbd> + <kbd>e</kbd> |  N   |        | toggle file explorer |

### Git

| Key                                            | Mode | Action | Note                                         |
| ---------------------------------------------- | :--: | ------ | -------------------------------------------- |
| <kbd>Space</kbd> + <kbd>g</kbd> + <kbd>b</kbd> |  N   |        | ( Git Blame ) show git blame of current line |
| <kbd>Space</kbd> + <kbd>g</kbd> + <kbd>g</kbd> |  N   |        | open lazy git                                |

### Comment (Currently not in config)

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
