# change into a temp dir
mkdir tmpdir
cd tmpdir

# lets just update ubuntu first
sudo apt update -qq -o=Dpkg::Use-Pty=0
sudo apt dist-upgrade -qq -o=Dpkg::Use-Pty=0

# install a tweak tool (gnome already has one installed)
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 unity-tweak-tool notify-osd

# theming
## gtk theme - arc
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 arc-theme

## icons
### icon theme - oranchelo
sudo add-apt-repository ppa:oranchelo/oranchelo-icon-theme -y
sudo apt update -qq -o=Dpkg::Use-Pty=0
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 oranchelo-icon-theme

### icon theme - papirus
sudo add-apt-repository ppa:papirus/papirus -y
sudo apt update -qq -o=Dpkg::Use-Pty=0
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 papirus-icon-theme

### icon theme - paper (includes cursor theme)
sudo add-apt-repository ppa:snwh/pulp -y
sudo apt update -qq -o=Dpkg::Use-Pty=0
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 paper-icon-theme
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 paper-cursor-theme

### icon theme - arc (uses above icons as fallback)
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 unzip
wget -O icons.zip "https://github.com/dhinakg/arc-icon-theme/archive/master.zip"
unzip icons.zip -d icons
cd icons
cd arc-icon-theme-master
sudo cp -r Arc /usr/share/icons/
cd ..

## powerline
### main
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 powerline

### powerline fonts - prepatched
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 git
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

### powerline fonts - symbols

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mv PowerlineSymbols.otf /usr/share/fonts/X11/misc/
sudo fc-cache -vf /usr/share/fonts/X11/misc/

mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
## set font to Anonymice Powerline

# rx 480 drivers - only on LTS
# wget --referer="http://support.amd.com" "https://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-17.10-446706.tar.xz" amdgpu-pro-17.10-446706.tar.xz
# tar -Jxvf amdgpu-pro-17.10-446706.tar.xz
# cd amdgpu-pro-17.10-446706
# ./amdgpu-pro-install -y
# groups
# sudo usermod -a -G video $LOGNAME
# cd ..

# some utilites
## neofetch
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 neofetch
## wormhole
sudo snap install wormhole
## atom
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 curl
curl https://www.franzoni.eu/keys/D401AB61.txt | sudo apt-key add -
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 apt-transport-https
deb https://dl.bintray.com/alanfranz/atom-apt stable main
sudo apt update -qq -o=Dpkg::Use-Pty=0
sudo apt -y install -qq -o=Dpkg::Use-Pty=0 -qq -o=Dpkg::Use-Pty=0 atom

# install gnome extensions
sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
sudo chmod +x /usr/local/bin/gnomeshell-extension-manage
gnomeshell-extension-manage --install --extension-id 826 --version 3.22
gnomeshell-extension-manage --install --extension-id 1007 --version 3.20
gnomeshell-extension-manage --install --extension-id 1031
gnomeshell-extension-manage --install --extension-id 7
gnomeshell-extension-manage --install --extension-id 19
# clean up, clean up
cd ..
# everybody do your share
rm -r tmpdir
# before we go
echo "Things to do: set Arc as default GTK theme and icon theme in Tweak Tool, set Paper as default cursor theme in Tweak Tool, set font to Anonymice Powerline if you want (or any other thing), and reboot"
sleep 5
# bye!
exit
