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

For **bash scripts**, `exa` is required.  
`exa` is a modern replacement for `ls`, written in Rust. It's designed to be a more feature-rich, user-friendly, and visually appealing way to list files and directories.  


Install `exa` in Arch Linux:  

```bash
sudo pacman -S exa
```

For **grub**:  

```bash
stow -t /etc/default grub
```
