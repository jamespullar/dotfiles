# Run this script to create symlinks for dotfiles

files=(
  ".zshrc"
  ".aliases"
  ".gitconfig"
  ".vimrc"
  ".tigrc"
  ".tigrc.vim"
  ".tmux.conf"
  ".yabairc"
  ".skhdrc"
  ".tridactylrc"
)

for file in "${files[@]}"; do
  filepath="$(pwd)/$file"
  if [ ! -f "~/${file}" ]; then
    ln -s $filepath ~/$file
  fi
done
