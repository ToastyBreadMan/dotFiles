#!/bin/bash
# Setup and install i3-gaps and other things quickly
# Only for ubuntu like systems, for now

Header() {
	str="$*"
	length=${#str}
	length=$(($length + 4))

	seperator=""

	for i in $(seq 1 $length)
	do
		seperator+='-'
	done

	printf "\n\n"
	printf "%s\n" $seperator
	printf "| %s |\n" "$*"
	printf "%s\n" $seperator
	printf "\n\n"
}

Header "Updating OS"
apt update
apt upgrade -y

Header "Installing i3"
apt install i3 -y

Header "Installing i3-gaps dependencies"
apt install -y git build-essential autoconf pkg-config
apt install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev

Header "Installing i3-gaps"
mkdir -p /opt/i3install/gui/ && cd /opt/i3install/gui/
git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps

autoreconf --force --install
rm -rf build/

mkdir -p build && cd build

sleep .5

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make -j8
make install

Header "Installing useful programs"

apt install -y lxappearance nitrogen arc-theme rofi compton xfce4-terminal neofetch i3status ranger ffmpeg rxvt-unicode scrot xclip htop clipit
apt install -y python3 python3-pip

umask 133
pip3 install ueberzug

Header "Installing fonts"
cd /usr/share/fonts/opentype/

umask 133

curl -fLo "FontAwesome.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/FontAwesome.otf
curl -fLo "Pomicons.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/Pomicons.otf
curl -fLo "PowerlineExtraSymbols.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/PowerlineExtraSymbols.otf
curl -fLo "PowerlineExtraSymbols.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/PowerlineExtraSymbols.otf
curl -fLo "PowerlineSymbols.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/PowerlineSymbols.otf
curl -fLo "Unicode_IEC_symbol_font.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/Unicode_IEC_symbol_font.otf
curl -fLo "original-source.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/original-source.otf

cd /usr/share/fonts/truetype/
curl -fLo "devicons.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/devicons.ttf
curl -fLo "font-awesome-extension.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/font-awesome-extension.ttf
curl -fLo "font-logos.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/font-logos.ttf
curl -fLo "materialdesignicons-webfont.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/materialdesignicons-webfont.ttf
curl -fLo "octicons.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/octicons.ttf
curl -fLo "weathericons-regular-webfont.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/weathericons-regular-webfont.ttf
curl -fLo "Anonymice Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/AnonymousPro/complete/Anonymice%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "Anonymice Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/AnonymousPro/complete/Anonymice%20Nerd%20Font%20Complete.ttf

fc-cache -f -v

Header "Next Steps"
echo "Run the sync script as the user you with to install configs to."
