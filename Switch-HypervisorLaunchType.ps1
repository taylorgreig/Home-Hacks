# Must be run as admin
# Virtualisation must be enabled in BIOS
function Switch-HypervisorLaunchType {
    param()

    if (!(Get-ComputerInfo).HyperVRequirementVirtualizationFirmwareEnabled) {
        Write-Host "Virtualisation not enabled in BIOS. Exiting..." -ForegroundColor Red
        Start-Sleep 1
        Exit 1
    }
    
    $hypervisorlaunchtype = (bcdedit /enum | findstr -i hypervisorlaunchtype).Split(" ")[-1]
    Write-Host "Hypervisor launch type: " -ForegroundColor Yellow -NoNewline
    Write-Host $hypervisorlaunchtype
    Write-Host "You can currently use: " -NoNewline -ForegroundColor Yellow
    if ($hypervisorlaunchtype -eq 'Auto') {
        Write-Host "WSL"
        $newtype = 'off'
    } else {
        Write-Host "VMware Workstation/Virtualbox"
        $newtype = 'Auto'
    }

    Write-Host "Switch and restart? [y/N]" -ForegroundColor Cyan
    $option = Read-Host
    if ($option.ToLower() -eq 'y') {
        bcdedit /set hypervisorlaunchtype $newtype
        Restart-Computer
    } else {
        Write-Host "Exiting..."
        Start-Sleep 1
        Exit
    }
}