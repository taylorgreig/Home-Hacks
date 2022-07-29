# Home-Hacks
### What does it do?
[Windows Subsytem for Linux](https://www.reddit.com/r/Windows10/comments/h10smc/wsl2_vmware_compatibility_issues/) [and VMware Workstation player](https://answers.microsoft.com/en-us/windows/forum/all/windows-10-wsl-and-vmware-workstation-player-wont/1540810a-cd81-4f04-a60e-4e02da092c59) [do not play nicely together.](https://www.reddit.com/r/bashonubuntuonwindows/comments/eq4100/is_it_possible_to_use_wsl_2_if_vmware_workstation/)

This script uses [bcedit](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/bcdedit-command-line-options?view=windows-11) to toggle the `hypervisorlaunchtype` between `auto` and `off`. 
It will show what the current setting is and ask if you would like to switch and restart the computer.
### Which setting?
|   Type    | You can use                     |
| :-------: | :-----------------------------  |
|   Auto    |   WSL                           |
|   Off     |   VMware Workstation/VirtualBox |

You can execute the script like normal, or you can save the module into your powershell path.
View the directories in your PowerShell module path: `$env:PSMODULEPATH -split ';'`

If you save the module to your path you can simply open powershell and run
`Import Home-Hacks` and then the function should be imported with the module.

[*"In PowerShell 3.0, PowerShell is able to implicitly import a module when one of the functions or cmdlets in the module is called by a user."*](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/importing-a-powershell-module?view=powershell-7.2)
`$PSVersionTable`
### Requirements
- [Script execution policy]((https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.2)) must be set per your requirements.
    `Get-ExecutionPolicy`
    `Set-ExecutionPolicy <Bypass|RemoteSigned>`
- It must be run in an elevated session.
- Virtualisation must be enabled in BIOS.
### How to execute
In PowerShell as Admin run:
`Switch-HypervisorLaunchType`
Follow the prompts.
