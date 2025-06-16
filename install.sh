#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info() { echo -e "\e[1;34m[INFO]\e[0m $*"; }

install_oh_my_zsh() {
  info "Setting up Oh My Zsh..."
  rm -f ~/.zshrc
  ln -s "$DOTFILES_DIR/zsh/zshrc" ~/.zshrc
  for repo in \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-syntax-highlighting \
    Aloxaf/fzf-tab \
    romkatv/powerlevel10k; do
    plugin_dir="$HOME/.oh-my-zsh/custom/$(basename $repo)"
    [ -d "$plugin_dir" ] || git clone --depth=1 "https://github.com/$repo.git" "$plugin_dir"
  done
  [ -f ~/z.sh ] || curl -fsLo ~/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
}

install_neovim() {
  info "Setting up Neovim..."
  rm -rf ~/.config/nvim ~/.fzf
  ln -s "$DOTFILES_DIR/nvim" ~/.config/nvim
  if command -v yay &>/dev/null; then
    yay -S --noconfirm ripgrep fzf
  elif command -v apt &>/dev/null; then
    sudo apt update && sudo apt install -y ripgrep fzf
  fi
}

install_emacs() {
  info "Setting up Emacs..."
  mkdir -p ~/.config/emacs
  rm -f ~/.config/emacs/init.el
  ln -s "$DOTFILES_DIR/emacs/init.el" ~/.config/emacs/init.el
}

install_packages() {
  info "Installing packages..."
  if command -v yay &>/dev/null; then
    yay -S --noconfirm pyenv keychain go
  elif command -v apt &>/dev/null; then
    sudo apt install -y pyenv keychain golang
  fi
}

install_diff_so_fancy() {
  info "Installing diff-so-fancy..."
  npm install -g diff-so-fancy
  git config --global core.pager "diff-so-fancy | less --tabs=4 -R"
}

install_kitty() {
  info "Installing Kitty..."
  rm -rf ~/.local/kitty.app ~/.config/kitty
  if command -v yay &>/dev/null; then
    yay -S --noconfirm kitty
  elif command -v apt &>/dev/null; then
    sudo apt install -y kitty
  fi
  ln -s "$DOTFILES_DIR/kitty" ~/.config/kitty
}

install_i3() {
  info "Installing i3 + dependencies..."
  if command -v yay &>/dev/null; then
    yay -S --noconfirm rofi polybar \
      ttf-twemoji ttf-nerd-fonts-symbols-mono ttf-jetbrains-mono
  elif command -v apt &>/dev/null; then
    sudo apt install -y i3 rofi polybar fonts-jetbrains-mono fonts-noto-color-emoji
  fi
  rm -rf ~/.config/i3
  ln -s "$DOTFILES_DIR/i3" ~/.config/i3
}

install_rofi() {
  info "Installing Rofi..."
  install_i3  # ensures rofi installed
  rm -rf ~/.config/rofi
  ln -s "$DOTFILES_DIR/rofi" ~/.config/rofi
}

install_mutt() {
  info "Installing Mutt..."
  if command -v yay &>/dev/null; then
    yay -S --noconfirm neomutt mutt-wizard cyrus-sasl-xoauth2-git abook lynx
  elif command -v apt &>/dev/null; then
    sudo apt install -y neomutt abook lynx libsasl2-modules
  fi
}

show_help() {
  cat <<EOF
Usage: $(basename "$0") [component]
Without args, prompts before installing all components:
  zsh      – Oh My Zsh + plugins
  nvim     – Neovim config + tools
  emacs    – Emacs config
  packages – pyenv, go, keychain
  diff     – diff-so-fancy
  kitty    – Kitty terminal config
  i3       – i3 + rofi + polybar + fonts
  mutt     – Neomutt + dependencies
EOF
}

main() {
  if [ $# -gt 0 ]; then
    case "$1" in
      zsh) install_oh_my_zsh ;;
      nvim) install_neovim ;;
      emacs) install_emacs ;;
      packages) install_packages ;;
      diff) install_diff_so_fancy ;;
      kitty) install_kitty ;;
      i3) install_i3 ;;
      rofi) install_rofi ;;
      mutt) install_mutt ;;
      *) show_help ;;
    esac
  else
    read -rp "This will overwrite configs. Proceed? (y/n) " ans
    if [[ $ans =~ ^[Yy]$ ]]; then
      install_oh_my_zsh
      install_neovim
      install_emacs
      install_packages
      install_diff_so_fancy
      install_kitty
      install_i3
      install_rofi
      install_mutt
      info "All done!"
    else
      info "Cancelled."
    fi
  fi
}

main "$@"
