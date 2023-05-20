winget install -e --id 7zip.7zip
winget install -e --id Discord.Discord
winget install -e --id JGraph.Draw
winget install -e --id GIMP.GIMP
winget install -e --id Git.Git
winget install -e --id gerardog.gsudo
winget install -e --id Mozilla.Firefox
winget install -e --id Mozilla.Thunderbird
winget install -e --id OBSProject.OBSStudio
winget install -e --id Microsoft.PowerShell
winget install -e --id Microsoft.PowerToys
winget install --id Microsoft.VisualStudioCode --silent --override "/VERYSILENT /NORESTART /MERGETASKS=!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath"
winget install -e --id wez.wezterm

PowerShell -ExecutionPolicy Unrestricted ./setup.ps1
PowerShell -ExecutionPolicy Unrestricted ./setupWSL.ps1