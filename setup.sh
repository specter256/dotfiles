#!/bin/bash
YELLOW='\033[1;33m'
NOCOLOR='\033[0m'
NUMIX_DIR='numix-folders'

main_menu()
{
  echo -e $YELLOW
  echo ' 1. Cleanup the system'
  echo ' 2. Copy dotfiles to ~/'
  echo ' 3. Install default packages'
  echo ' 4. Install numix-icon-theme'
  echo ' 5. Install arc-theme (GTK/Gnome Shell)'
  echo ' 6. Run numix-folders script'
  echo ' 7. Set up git config'
  echo ' 8. Set up gnome keybindings and preferences'
  echo ' _______'
  echo -e ' q) Quit'$NOCOLOR

  while :
  do
    read -rsn1 INPUT_STRING
    echo ''
    case $INPUT_STRING in
    q)
      exit
      ;;
    1)
      echo "Cleaning apt cache..."
      clean_system &&
      main_menu
      break
      ;;
    2)
      echo "Copying configuration files..."
      copy_dotfiles &&
      main_menu
      break
      ;;
    3)
      install_packages &&
      main_menu
      break
      ;;
    4)
      install_numix_icon &&
      main_menu
      break
      ;;
    5)
      install_arc_theme &&
      main_menu
      break
      ;;
    6)
      run_numix_script &&
      main_menu
      break
      ;;
    7)
      set_git_config &&
      main_menu
      break
      ;;
    8)
      set_gnome_settings &&
      main_menu
      break
      ;;
    *)
      echo "Unknown command"
      ;;
    esac
  done
}

clean_system() {
  sudo aptitude clean
}

copy_dotfiles() {
  cp -a configs/. ~/
}

install_packages() {
  packages=''
  input="modules/packages"
  while IFS= read -r line
  do
    packages+=$line' '
  done < "$input"
  sudo apt install -y $packages
}

install_numix_icon() {
  sudo add-apt-repository ppa:numix/ppa &&
  sudo apt-get update &&
  sudo apt-get install numix-icon-theme-circle
}

install_arc_theme() {
  sudo apt-get install -y autoconf automake pkg-config libgtk-3-dev git &&
  git clone https://github.com/horst3180/arc-theme --depth 1 &&
  cd arc-theme &&
  ./autogen.sh --prefix=/usr &&
  sudo make install &&
  cd ..
}

run_numix_script() {
  if [ ! -d "$NUMIX_DIR" ]; then
    git clone https://github.com/numixproject/numix-folders.git $NUMIX_DIR
  fi &&

  cd $NUMIX_DIR &&
  sudo ./numix-folders &&
  cd ..
}

set_git_config() {
  read -p "What is your github author name?: " NAME
  read -p "What is your github author email?: " EMAIL
  git config --global user.name $NAME &&
  git config --global user.email $EMAIL
}

set_gnome_settings() {
  gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu' &&
  gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super>q']" &&
  gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up', '<Super>Up', '<Primary><Alt>KP_5']" &&
  gsettings set org.gnome.desktop.wm.keybindings close "['<Super>c']"
}

clear
main_menu
