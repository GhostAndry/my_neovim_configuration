
# ⚡ Neovim AMOLED Setup

> Un setup super leggero e scuro per Neovim, ispirato a VSCode con stile AMOLED 💀  
> Include file explorer, completamento automatico, syntax highlight, LSP e terminale integrato.

---

## 📸 Preview

![screenshot](https://raw.githubusercontent.com/GhostAndry/my_neovim_configuration/main/preview.png)

---

## 🧪 Funzionalità incluse

✅ Tema **Catppuccin Mocha** (AMOLED)  
✅ **File explorer** in stile sidebar (nvim-tree)  
✅ **Autocomplete intelligente** con LSP  
✅ **Syntax Highlight** via Treesitter  
✅ **Terminale integrato** toggleabile  
✅ **Telescope** per ricerca file/funzioni  

---

## 🧰 Installazione

### Metodo 1 – Automatico (consigliato)

Esegui questo comando:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/GhostAndry/my_neovim_configuration/refs/heads/main/install.sh)
````

---

## 📦 Plugin inclusi

| Plugin                                                                  | Funzione                 |
| ----------------------------------------------------------------------- | ------------------------ |
| [`lazy.nvim`](https://github.com/folke/lazy.nvim)                       | Plugin manager           |
| [`nvim-tree`](https://github.com/nvim-tree/nvim-tree.lua)               | File explorer            |
| [`catppuccin`](https://github.com/catppuccin/nvim)                      | Tema AMOLED              |
| [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlight         |
| [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim)    | Ricerca stile Ctrl+P     |
| [`toggleterm.nvim`](https://github.com/akinsho/toggleterm.nvim)         | Terminale integrato      |
| [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) + LSP                 | Completamento automatico |
| [`lualine`](https://github.com/nvim-lualine/lualine.nvim)               | Status line carina       |

---

## ⌨️ Keybinds

| Shortcut                | Azione                                                |
| ----------------------- | ----------------------------------------------------- |
| `Ctrl+Shift+E`          | Toggle file explorer con focus e selezione automatica |
| `:ToggleTerm`           | Terminale integrato                                   |
| `:Telescope find_files` | Cerca file                                            |

---

## 🖤 Tema usato

Tema AMOLED fornito da [Catppuccin Mocha](https://github.com/catppuccin/nvim):

---

## 🧠 Prossimi passi

* Aggiungere keybind per `Ctrl+P` con Telescope
* Ottimizzare per performance su low-end hardware
* Sincronizzazione dotfiles via Git

---

## 🤝 Credits

Creato da [Andrea Ronzoni](https://github.com/GhostAndry)
Ispirato allo stile dark-tech VSCode + riso e violenza 🔥
