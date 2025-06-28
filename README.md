# dotfiles

Install stow.  
In Arch Linux,

```bash
sudo pacman -S stow
```

Then, run `stow` to create symlink to this repository,  

```bash
stow <package_name>
```

For **grub**:  

```bash
stow -t /etc/default grub
```
