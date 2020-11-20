# Saul Dotfiles

This repo contains some of my essential config files for ArchLinux on Acer Aspire 5.
The files are symlinked to the correct location in my system.
I am using this repo mainly as a backup.

## Bootloader
* I am using Grub2 with the `arch-silence-grub-theme-git` theme
* I use `grub-btrfs` to see also btrfs snapshots in the boot menu

## Kernel
* I use linux-zen and I also installed the headers

## GPU
* For managing the Nvidia and Intel GPUs, I am using Optimus Manager
	* Switching between GPUs and to hybrid mode works (sometimes you need to switch 2 times for it to be effective)
	* In Nvidia mode TTY changes are not recommended and can result in freezes
* For Nvidia I use the `nvidia-dkms` driver (since I am using the linux-zen kernel)

## Lock Screen and Screensaver
* As a screen-locker I am using light-locker, which just redirects to the LightDM login page
* The locker is called when xset (part of xorg) activates the screensaver
	* The screensaver activation behavior is managed permanently in `/etc/X11/xorg.conf.d/10-monitor.conf`
	* I can inspect the current settings with `xset q`
* I can invoke the lock manually by calling `light-locker-command -l`
* The command light-locker is a background process that needs to be in execution for the lock to work
	* I execute it in the i3 config file
	* The execution parameters of the command can tweak the behavior of the lock (when to lock after the X screensaver is activated)
* For some strange reason, the login after lock is done in TTY8, while LightDM is on TTY7
* Given the problem for TTY switching with Nvidia, do not use the lock when in Nvidia mode
	* If the screen gets locked in nvidia mode: press space, then write the passwrd and press enter. The lockscreen is working even if the screen no
	* After unlocking like this once, then the screen lock works in nvidia mode until the next logout
* Inhibition of the lockscreen is done with exam_mode.sh and inhibited with exam_mode_undo.sh
	* They just call xset and disable/enable blanking and screen poweroff

## Login Manager
* I am using LightDM with the webkit2 `lightdm-webkit-theme-litarvan` theme
* The user avatar and name (Saul Pierotti, not the user name) are better managed from the gnome settings panel (login to gnome!)
	* For some reason when I change the picture manually it does not work

## Window Manager
* I am using i3-gapps, and I keep gnome as a fallback
* In i3, I use polybar as a status bar

## Text Editor
* I use nvim

## Terminal
* I use konsole since it supports fonts with ligatures (I use Fira Code)

## Console
* I use zsh

