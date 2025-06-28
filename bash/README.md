# WSL
## Download WSL
1. run `Powershell` in Windows.  
2. `wsl --install`.  
3. install `Ubuntu` from Microsoft Store.  
4. Turn on the following features in `Windows features On or Off`.  
4-1. WSL for Linux  
4-2. Virtual Machine Platform  
4-3. Windows Hypervisor Platform  
5. Turn on `Virtualization` in BIOS settings.
6. Now you can launch `WSL` in your `Windows`.
7. run `sudo passwd --delete hxxdev` to disable password.
--------------------------------
### Setting up SSH with WSL
1. `sudo apt update`
2. `sudo apt install g++ gdb make ninja-build rsync zip`
3. `sudo apt install openssh-server`
4. `sudo vi /etc/ssh/sshd_config`
- `Port 23`
- `PubkeyAuthentication yes`
- `PasswordAuthentication yes`
5. `sudo service ssh start`
6. `sudo systemctl enable ssh`

#### How to restart ssh server
1. `sudo systemctl daemon-reload`
2. `sudo systemctl disable ssh.socket`
3. `sudo systemctl stop ssh.socket`
4. `sudo systemctl enable ssh.service`
5. `sudo systemctl start ssh.service`
- It is was done successfully, `sudo systemctl status ssh` should look something like this:
```
     Loaded: loaded (/usr/lib/systemd/system/ssh.service; enabled; preset: enabled)
     Active: active (running) since Sat 2025-03-01 01:38:04 KST; 2min 11s ago
```
--------------------------------
