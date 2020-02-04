# Setup and install i3-gaps and other things quickly
# Only for ubuntu like systems, for now
echo "Installing i3"
apt install i3 -y

echo "----------------"
echo "Installing i3-gaps dependencies"
apt-get install -y git build-essential autoconf pkg-config
apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev




echo "----------------"
echo "Installing i3-gaps"
mkdir -p /opt/i3install/gui/ && cd /opt/i3install/gui/
git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps

autoreconf --force --install
rm -rf build/

mkdir -p build && cd build

sleep .5

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make -j8
make install

echo "----------------"
echo "Installing useful programs"

apt-get install -y lxappearance nitrogen arc-theme rofi compton xfce4-terminal neofetch i3status ranger ffmpeg

