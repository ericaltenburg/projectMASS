# Copying over rc files from /dotfiles
cp dotfiles/.vimrc ~
cp dotfiles/.zshrc ~

# Add fs.sh script to github folder containing repos
# fs.sh just does a git fetch on all repos to tell me which are out-of-date
cp fs.sh ..
