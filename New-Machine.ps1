# Enable WSL 2
wsl --install
wsl --set-default-version 2

# Install Ubuntu
wsl --install -d Ubuntu

# Install Chocolatey (Windows package manager)
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install microsoft-teams -y
choco install powertoys -y
choco install microsoft-windows-terminal -y
choco install azurevpn -y
choco install azure-cli -y
choco install vscode -y
choco install visualstudio2022community -y
choco install spotify -y
choco install oh-my-posh -y
choco install slack -y

# Doenload CaskadiyaCove
Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CaskaydiaCove.zip" -OutFile "$env:TEMP\CaskaydiaCove.zip"
Expand-Archive -Path "$env:TEMP\CaskaydiaCove.zip" -DestinationPath "$env:TEMP\CaskaydiaCove"
Copy-Item "$env:TEMP\CaskaydiaCove\*.ttf" -Destination "$env:WINDIR\Fonts"

# Clean up
Remove-Item "$env:TEMP\CaskaydiaCove.zip"
Remove-Item -Recurse "$env:TEMP\CaskaydiaCove"
