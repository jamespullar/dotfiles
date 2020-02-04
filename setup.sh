# Run this script to create sumlinks for dotfiles

files=(
  ".zshrc"
  ".aliases"
  ".gitconfig"
  ".vimrc"
)

for file in "${files[@]}"; do
  filepath="$(pwd)/$file"
  if [ ! -f "~/${file}" ]; then
    ln -s $filepath ~/$file
  fi
done
