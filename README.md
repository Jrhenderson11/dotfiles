# dotfiles

## Deployment

```
gcl dotfiles
cd dotfiles
ln $PWD/.aliases ~/.aliases

ln $PWD/.inputrc ~/.inputrc

cp ~/.config/i3/config ~/.config/i3/config.bak
ln $PWD/.i3/config ~/.config/i3/config

```

for DOTFILE in `find ~/dotfiles`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

ln -sv "~/.dotfiles/runcom/.bash_profile" ~
ln -sv "~/.dotfiles/runcom/.inputrc" ~
ln -sv "~/.dotfiles/git/.gitconfig" ~