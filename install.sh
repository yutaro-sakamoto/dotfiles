targets='.bashrc .vimrc .gitconfig .tmux.conf .config'

mkdir -p ~/.dotfiles/backup

for target in $targets
do
    if [ -e ~/$target ]; then
        cp ~/$target ~/.dotfiles/backup
    fi
    cp -r $target ~/
done
