#!/bin/bash


clear

GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[0;33m"
CYAN="\033[0;36m"
RESET="\033[0m"

SCRIPT_NAME="dio"
LOCAL_BIN_PATH="$HOME/.local/bin"
RC_FILE=""

echo -e "${CYAN}Hangi terminali kullanıyorsunuz? (bash/zsh)${RESET}"
read TERMINAL_TYPE

case "$TERMINAL_TYPE" in
  "bash")
    RC_FILE="$HOME/.bashrc"
    ;;
  "zsh")
    RC_FILE="$HOME/.zshrc"
    ;;
  *)
    echo -e "${YELLOW}Desteklenmeyen terminal türü. Yalnızca bash veya zsh destekleniyor.${RESET}"
    exit 1
    ;;
esac

if [ -f "$LOCAL_BIN_PATH/$SCRIPT_NAME" ]; then
  echo -e "${GREEN}$SCRIPT_NAME dosyası $LOCAL_BIN_PATH klasöründen kaldırılıyor...${RESET}⚡"
  sleep 1
  rm "$LOCAL_BIN_PATH/$SCRIPT_NAME"
  echo -e "${GREEN}$SCRIPT_NAME dosyası $LOCAL_BIN_PATH klasöründen kaldırıldı.${RESET}⚡"
  sleep 1
else
  echo -e "${YELLOW}$SCRIPT_NAME dosyası bulunamadı. Önceden kaldırılmış olabilir.${RESET}"
  sleep 1
fi

if grep -q "$LOCAL_BIN_PATH" "$RC_FILE"; then
  echo -e "${GREEN}$LOCAL_BIN_PATH, $RC_FILE dosyasından çıkarılıyor...${RESET}⚡"
  sleep 1
  sed -i "/$LOCAL_BIN_PATH/d" "$RC_FILE"
  source "$RC_FILE"
  echo -e "${GREEN}$LOCAL_BIN_PATH $RC_FILE dosyasından çıkarıldı.${RESET}⚡"
  sleep 1
else
  echo -e "${YELLOW}$LOCAL_BIN_PATH, $RC_FILE dosyasından zaten çıkarılmış.${RESET}"
  sleep 1
fi

echo -e "${GREEN}Uninstall işlemi tamamlandı.${RESET}⚡"
