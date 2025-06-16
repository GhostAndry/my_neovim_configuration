# ⚡ Neovim AMOLED Setup

> A sleek and ultra-dark Neovim setup, inspired by VSCode and tailored for AMOLED displays 💀  
> Includes file explorer, smart autocompletion, LSP, integrated terminal, and more.

---

## 📸 Preview

![screenshot](https://raw.githubusercontent.com/GhostAndry/my_neovim_configuration/main/preview.png)

---

## 🧪 Included Features

✅ **Catppuccin Mocha** theme (AMOLED-friendly)  
✅ **Sidebar file explorer** with Java namespace support  
✅ **Smart autocomplete** via LSP + `nvim-cmp`  
✅ **Syntax highlighting** powered by Treesitter  
✅ **Integrated terminal** via `toggleterm`  
✅ **Fuzzy finder** with Telescope  

---

## 🧰 Installation

### Method 1 – Automatic (recommended)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/GhostAndry/my_neovim_configuration/refs/heads/main/install.sh)
```

You’ll be prompted to install all components or just specific ones.

### Method 2 – Manual (advanced)

Clone into your Neovim config directory:

```bash
git clone https://github.com/GhostAndry/my_neovim_configuration ~/.config/nvim
```

Then manually install dependencies: `ripgrep`, `fzf`, `neovim`, `zsh`, `oh-my-zsh`, `node`, `npm`, `python3`.

---

## 📦 Included Plugins

| Plugin                                                                  | Description           |
| ----------------------------------------------------------------------- | --------------------- |
| [`lazy.nvim`](https://github.com/folke/lazy.nvim)                       | Plugin manager        |
| [`nvim-tree`](https://github.com/nvim-tree/nvim-tree.lua)               | File explorer sidebar |
| [`catppuccin`](https://github.com/catppuccin/nvim)                      | AMOLED color theme    |
| [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting   |
| [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim)    | Fuzzy file finder     |
| [`toggleterm.nvim`](https://github.com/akinsho/toggleterm.nvim)         | Integrated terminal   |
| [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) + LSP                 | Code autocompletion   |
| [`lualine`](https://github.com/nvim-lualine/lualine.nvim)               | Status line           |

---

## ⌨️ Keybinds

| Shortcut                | Action                                            |
| ----------------------- | ------------------------------------------------- |
| `Ctrl+Shift+E`          | Toggle file explorer and auto-select current file |
| `:ToggleTerm`           | Open integrated terminal                          |
| `:Telescope find_files` | Fuzzy find files (like Ctrl+P in VSCode)          |

---

## 🎯 Extra Tools (via install script)

* Full support for **Arch (yay)** and **Debian/Ubuntu (apt)**
* Optional components: `zsh`, `kitty`, `i3`, `rofi`, `mutt`, `diff-so-fancy`, `emacs`, `fzf`, `ripgrep`
* Pre-configured dotfiles for Oh My Zsh, Kitty, i3, Rofi, Neomutt

---

## 🖤 Theme

Powered by the [Catppuccin Mocha](https://github.com/catppuccin/nvim) dark theme – perfect for AMOLED displays.

---

## 🚀 Next Steps

* [ ] Add `Ctrl+P` shortcut with Telescope
* [ ] Optimize for low-end devices
* [ ] Sync dotfiles using Git
* [ ] Optional JDTLS (Java LSP) integration

---

## 🤝 Credits

Created with 💻 + ☕ by [Andrea Ronzoni](https://github.com/GhostAndry)
Inspired by dark-tech vibes of VSCode + Neovim + rice & violence 🔥
