#!/binbash

#
# script: setup.sh
#

# vars


# main
echo
echo "Instalamos el entorno de desarrollo de apps de apple XCode:"
xcode-select --install

echo
echo "Verificamos la instalación de xcode:"
xcode-select -p

echo
echo "Instalamos el gestor de paquetes brew:"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo
echo "Instalamos herramientas para descargas:"
brew install git wget curl

echo
echo "Instalamos el shell zsh:"
brew install zsh

echo
echo "Cambiamos el shell default por zsh:"
chsh -s $(which zsh)

echo
echo "Instalamos ansible:"
brew install ansible ansible-lint