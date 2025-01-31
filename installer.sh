#!/bin/bash

clear


GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[0;33m"
CYAN="\033[0;36m"
RESET="\033[0m"

SCRIPT_NAME="file_tree"
LOCAL_BIN_PATH="$HOME/.local/bin"

echo -e  "${CYAN}Hangi terminali kullanıyorsunuz? (bash/zsh)${RESET}"
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
    echo 
    exit 1
    ;;
esac

if [ ! -d "$LOCAL_BIN_PATH" ]; then
  echo -e "${GREEN}$LOCAL_BIN_PATH klasörü oluşturuluyor...${RESET}⚡"
  mkdir -p "$LOCAL_BIN_PATH"
fi
sleep 1

echo -e "${BLUE}Dosya $LOCAL_BIN_PATH klasörüne kopyalanıyor...${RESET}⚡"
cp "$SCRIPT_NAME" "$LOCAL_BIN_PATH/"
sleep 1

echo -e "${GREEN}Çalıştırma izni veriliyor...${RESET}⚡"
chmod +x "$LOCAL_BIN_PATH/$SCRIPT_NAME"
sleep 1

if ! grep -q "$LOCAL_BIN_PATH" "$RC_FILE"; then
  echo -e "${GREEN}$LOCAL_BIN_PATH, $RC_FILE dosyasına ekleniyor...${RESET}⚡"
  sleep 1
  echo -e "${GREEN}export PATH=\$HOME/.local/bin:\$PATH" >> "$RC_FILE${RESET}⚡"
  sleep 1
  source "$RC_FILE"
  echo -e "${GREEN}.local/bin dizini $RC_FILE dosyasına eklendi.${RESET}⚡"
  sleep 1
else
  echo -e "${YELLOW}$LOCAL_BIN_PATH zaten $RC_FILE dosyasına ekli.${RESET}"
  sleep 1
fi

echo -e  "${BLUE}Tester eklemek isterseniz klasör adını intra sistemindeki ile aynı yazmanız gerekmektedir!${RESET}⚡"
echo -e  "${BLUE}Projeniz için (eğer varsa) tester kurulacaktır.${RESET}⚡"
echo -e "${GREEN}$SCRIPT_NAME dosyası $LOCAL_BIN_PATH klasörüne taşındı ve çalıştırma izni verildi.${RESET}⚡"
echo -e "${GREEN}Artık terminalden $SCRIPT_NAME komutunu her yerden çalıştırabilirsiniz.${RESET}⚡"

