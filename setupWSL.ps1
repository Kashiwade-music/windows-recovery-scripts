# set up wsl
function Install-WSL {
    # installing wsl has already been done in setup.ps1
    # wsl --install
    # copy .\setupWSL.sh to ~/setupWSL.sh in WSL Ubuntu
    $CurrentWorkingDir = (Get-Location).Path.Replace("\", "/").Replace("C:", "/mnt/c")
    # replace "\" to "/" in $CurrentWorkingDir
    wsl -d Ubuntu -u root -- cp "$CurrentWorkingDir/setupWSL.sh" ~/
    # run setupWSL.sh
    wsl -d Ubuntu -u root -- bash ~/setupWSL.sh
}
Install-WSL