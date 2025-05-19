param(
    [Parameter(Mandatory = $false)]
    [ValidateSet("Work", "Fun")]
    [string]$Mode = "Work"
)

if ($Mode -eq "Work") {
    # Enable WSL 2
    wsl --install
    wsl --set-default-version 2

    # Install Ubuntu
    wsl --install -d Ubuntu

    # Install PowerShell using winget
    winget install Microsoft.PowerShell -e --accept-package-agreements -h
    winget install Microsoft.Git -e --accept-package-agreements -h
    winget install Microsoft.WindowsTerminal -e -h --accept-package-agreements
    winget install Microsoft.Teams -e -h --accept-package-agreements
    winget install Microsoft.PowerToys -e -h --accept-package-agreements
    winget install Microsoft.Microsoft.AzureCLI -e -h --accept-package-agreements
    winget install Microsoft.VisualStudioCode -e -h --accept-package-agreements
    winget install Microsoft.VisualStudio.2022.Community -e -h --accept-package-agreements
    winget install JanDeDobbeleer.OhMyPosh -e -h --accept-package-agreements
    winget install Microsoft.Azure.FunctionsCoreTools -e -h --accept-package-agreements

    Install-Module -Name PowerColorLS -Repository PSGallery
    Install-Module -Name Terminal-Icons -Repository PSGallery
    Install-Module -Name PSReadLine -Repository PSGallery
}

if ($Mode -eq "Fun") {
    # For Funzies
    winget install Blizzard.BattleNet -e -h --accept-package-agreements
    winget install EpicGames.EpicGamesLauncher -e -h --accept-package-agreements
    winget install Valve.Steam -e -h --accept-package-agreements
    winget install GOG.Galaxy -e -h --accept-package-agreements
}


# Download CaskadiyaCove
Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaMono.zip" -OutFile "$env:TEMP\CaskaydiaCove.zip"
Expand-Archive -Path "$env:TEMP\CaskaydiaCove.zip" -DestinationPath "$env:TEMP\CaskaydiaCove"
Copy-Item "$env:TEMP\CaskaydiaCove\*.ttf" -Destination "$env:WINDIR\Fonts"

#Download JetBrains Mono
Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip" -OutFile "$env:TEMP\JetBrainsMono.zip"
Expand-Archive -Path "$env:TEMP\JetBrainsMono.zip" -DestinationPath "$env:TEMP\JetBrainsMono"
Copy-Item "$env:TEMP\JetBrainsMono\*.ttf" -Destination "$env:WINDIR\Fonts"

# Clean up
Remove-Item "$env:TEMP\CaskaydiaCove.zip"
Remove-Item "$env:TEMP\JetBrainsMono.zip"
Remove-Item -Recurse "$env:TEMP\CaskaydiaCove"
Remove-Item -Recurse "$env:TEMP\JetBrainsMono"
