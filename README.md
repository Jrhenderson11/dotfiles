# dotfiles

## Deployment

```
gcl dotfiles
cd dotfiles
ln $PWD/.aliases ~/.aliases
```

for DOTFILE in `find ~/dotfiles`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

ln -sv "~/.dotfiles/runcom/.bash_profile" ~
ln -sv "~/.dotfiles/runcom/.inputrc" ~
ln -sv "~/.dotfiles/git/.gitconfig" ~