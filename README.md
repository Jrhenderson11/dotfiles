# dotfiles

## Deployment

```sh
gcl dotfiles
cd dotfiles
ln $PWD/.aliases ~/.aliases

ln $PWD/.inputrc ~/.inputrc

cp ~/.config/i3/config ~/.config/i3/config.bak
ln $PWD/.i3/config ~/.config/i3/config

ln $PWD/.gitconfig ~/.gitconfig
ln $PWD/.gitconfig-priv ~/.gitconfig-priv
ln $PWD/.gitconfig-work ~/.gitconfig-work
```