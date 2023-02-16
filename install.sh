targets='.bashrc .vimrc .gitconfig .tmux.conf'

mkdir -p ~/.dotfiles/backup

for target in $targets
do
    if [ -e ~/$target ]; then
        cp ~/$target ~/.dotfiles/backup
    fi
    cp $target ~/
done
