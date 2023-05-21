# set up wsl
function Install-WSL {
    # install wsl
    wsl --install
    # install docker
    wsl -d Ubuntu -u root -- apt update
    wsl -d Ubuntu -u root -- apt install gnome-terminal
    wsl -d Ubuntu -u root -- apt remove docker-desktop
    wsl -d Ubuntu -u root -- rm -r $HOME/.docker/desktop
    wsl -d Ubuntu -u root -- rm /usr/local/bin/com.docker.cli
    wsl -d Ubuntu -u root -- apt purge docker-desktop
    wsl -d Ubuntu -u root -- aptremove docker docker-engine docker.io containerd runc
    wsl -d Ubuntu -u root -- apt update
    wsl -d Ubuntu -u root -- apt install ca-certificates curl gnupg
    wsl -d Ubuntu -u root -- install -m 0755 -d /etc/apt/keyrings
    wsl -d Ubuntu -u root -- curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    wsl -d Ubuntu -u root -- chmod a+r /etc/apt/keyrings/docker.gpg
    wsl -d Ubuntu -u root -- 'echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \'
    wsl -d Ubuntu -u root -- tee /etc/apt/sources.list.d/docker.list > /dev/null
    wsl -d Ubuntu -u root -- apt update
    wsl -d Ubuntu -u root -- apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    wsl -d Ubuntu -u root -- docker run hello-world
    # install powershell
    wsl -d Ubuntu -u root -- apt update
    wsl -d Ubuntu -u root -- apt-get install -y wget apt-transport-https software-properties-common
    wsl -d Ubuntu -u root -- 'wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"'
    wsl -d Ubuntu -u root -- dpkg -i packages-microsoft-prod.deb
    wsl -d Ubuntu -u root -- rm packages-microsoft-prod.deb
    wsl -d Ubuntu -u root -- apt update
    wsl -d Ubuntu -u root -- apt install -y powershell
    # install homebrew
    wsl -d Ubuntu -u root -- sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # install oh-my-posh
    wsl -d Ubuntu -u root -- brew install jandedobbeleer/oh-my-posh/oh-my-posh
}
Install-WSL