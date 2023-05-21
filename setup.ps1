function Get-YNAnswer {
    param(
        [string]$Question
    )
    $Answer = Read-Host "$Question (y/n)"
    if ($Answer -eq "y") {
        return $true
    } else {
        return Ask-Question $Question $Default
    }
}

function Install-Espanso {
    # open URL https://espanso.org
    Write-Host -ForegroundColor Green "Open URL https://espanso.org"
    Get-YNAnswer "Have you installed espanso?"
}
Install-Espanso

function Get-Wallpaper {
    # download from https://drive.google.com/file/d/18NYc7_gI2C1dKb964DpZ8NAoWZh4RlKI/view?usp=sharing
    Write-Host -ForegroundColor Green "Download wallpaper from https://drive.google.com/file/d/18NYc7_gI2C1dKb964DpZ8NAoWZh4RlKI/view?usp=sharing"
    Get-YNAnswer "Have you downloaded?"
}
Get-Wallpaper

# Download https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/SourceCodePro.zip and save it at ~/Downloads
function Install-Fonts{
    Invoke-WebRequest https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/SourceCodePro.zip -OutFile ~/Downloads/SourceCodePro.zip
    Expand-Archive ~/Downloads/SourceCodePro.zip -DestinationPath ~/Downloads/SourceCodePro

    Write-Host -ForegroundColor Green "Install your fonts from ~/Downloads/SourceCodePro"
    Invoke-Item ~/Downloads/SourceCodePro
    Get-YNAnswer "Have you installed the fonts?"
}
Install-Fonts

# set contents of ./espanso at ~/AppData/Roaming/espanso. if need, overwrite.
function Install-EspansoConfig {
    if (Test-Path "$env:APPDATA/espanso") {
        Remove-Item -Path "$env:APPDATA/espanso" -Recurse -Force
    }
    Copy-Item -Path ./espanso -Destination "$env:APPDATA/espanso" -Recurse
    Write-Host -ForegroundColor Green "espanso config is installed."
}
Install-EspansoConfig

# set contents in ./powershell at ~/Documents/PowerShell. if need, overwrite.
function Install-PowershellConfig {
    if (Test-Path "$env:USERPROFILE\Documents\PowerShell") {
        Remove-Item -Path "$env:USERPROFILE\Documents\PowerShell" -Recurse -Force
    }
    Copy-Item -Path ./powershell -Destination "$env:USERPROFILE\Documents\PowerShell" -Recurse
    Write-Host -ForegroundColor Green "powershell config is installed."
}
Install-PowershellConfig

# set contents of ./wezterm at ~/.
function Install-WeztermConfig {
    Copy-Item -Path ./wezterm/.wezterm.lua -Destination $env:USERPROFILE
    Write-Host -ForegroundColor Green "wezterm config is installed."
}
Install-WeztermConfig

wsl --install
Write-Host -ForegroundColor Green "WSL Installed."
Write-Host -ForegroundColor Green "You need to restart your computer to complete the installation."