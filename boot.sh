set -e

ascii_art='   ____  __  ______    __ ____  ______     __  ___    __
  / __ \/  |/  /   |  / //_/ / / / __ )   /  |/  /   / /
 / / / / /|_/ / /| | / ,< / / / / __  |  / /|_/ /_  / / 
/ /_/ / /  / / ___ |/ /| / /_/ / /_/ /  / /  / / /_/ /  
\____/_/  /_/_/  |_/_/ |_\____/_____/  /_/  /_/\____/   
'

echo -e "$ascii_art"
echo "=> Omakub is for fresh Manjaro GNOME 24 or newer installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

command -v yay >/dev/null 2>&1 || sudo pacman -S --noconfirm yay git
yay -Syyuu --noconfirm

echo "Cloning Omakub..."
rm -rf ~/.local/share/omakub
git clone https://github.com/brunomileto/omakub-mj.git ~/.local/share/omakub >/dev/null

cd ~/.local/share/omakub
git fetch origin "${OMAKUB_REF:-fix-atuin-register}" && git checkout "${OMAKUB_REF:-fix-atuin-register}"
cd -

echo "Installation starting..."
source ~/.local/share/omakub/install.sh
