# .dotfiles

This repo contains some of my essential config files for ArchLinux on Acer Aspire 5.
The files are symlinked to the correct location in my system.
I am using this repo mainly as a backup.

## Notes to myself
* For managing the Nvidia and Intel GPUs, I am using Optimus Manager
	* Switching between GPUs and to hybrid mode works (sometimes you need to switch 2 times for it to be effective)
	* In Nvidia mode TTY changes are not recommended and can result in freezes
* As a screen-locker I am using light-locker, which just redirects to the LightDM login page
	* For some strange reason, the login after lock is done in TTY8, while LightDM is on TTY7
		* Given the problem above for TTY switching with Nvidia, do not use the lock when in Nvidia mode
	* The locker is called by xautolock which is itself executed in the i3 config file
		* The lock is invoked calling `light-locker-command -l`
		* xautolock just calls that command when needed
	* The command light-locker is a background process that also needs to be in execution for the lock to work
		* I also execute it in the i3 config file

