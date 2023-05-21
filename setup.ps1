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
    Remove-Item -Path "$env:APPDATA/espanso" -Recurse -Force
    Copy-Item -Path ./espanso -Destination "$env:APPDATA/espanso" -Recurse
    Write-Host -ForegroundColor Green "espanso config is installed."
}
Install-EspansoConfig

# set contents in ./powershell at ~/Documents/PowerShell. if need, overwrite.
function Install-PowershellConfig {
    Remove-Item -Path "$env:USERPROFILE\Documents\PowerShell" -Recurse -Force
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

