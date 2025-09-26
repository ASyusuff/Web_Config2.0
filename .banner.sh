#!/bin/bash
clear

# ambil lebar terminal
COLUMNS=$(tput cols)

center_text() {
    local text="$1"
    local width=${#text}
    local pad=$(( (COLUMNS - width) / 2 ))
    printf "%*s%s\n" $pad "" "$text"
}

# tampilkan ASCII art (pakai center per baris)
ascii_art="
░██╗░░░░░░░██╗███████╗██████╗░░░░░░░░░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░░
░██║░░██╗░░██║██╔════╝██╔══██╗░░░░░░░██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░░
░╚██╗████╗██╔╝█████╗░░██████╦╝░░░░░░░██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░░
░░████╔═████║░██╔══╝░░██╔══██╗░░░░░░░██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗░
░░╚██╔╝░╚██╔╝░███████╗██████╦╝░░░░░░░╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝░
░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░░░░░░░░░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░░
"

while IFS= read -r line; do
    center_text "$line"
done <<< "$ascii_art"

echo ""

center_text "[==========================| By Ahmad Syarifudin Yusuf |==========================]"
center_text "[Github]~> https://github.com/ASyusuff                                             "
echo ""
# array quotes
quotes=(
    "Hidup adalah belajar tanpa henti."
    "Linux itu gratis, tapi waktumu tidak."
    "Jangan takut gagal, takutlah berhenti mencoba."
    "Koding itu 10% mengetik, 90% debugging."
    "Error adalah guru terbaik."
    "Semakin banyak bug, semakin banyak ilmu."
    "Programmer sejati tidak pernah pensiun, hanya ganti bahasa."
    "Keep calm and sudo apt-get install coffee."
    "Semua masalah punya solusi, kecuali listrik mati."
    "Kalau hidupmu penuh error, coba recompile hatimu."
    "Bug hari ini, skill esok hari."
    "Belajar Linux itu kayak naik sepeda, jatuh dulu baru bisa lancar."
    "Skrip kecil bisa bikin perubahan besar."
    "Seorang hacker bukan kriminal, tapi kritikus cyber."
    "Jangan takut Terminal, karena di situlah kekuatan sesungguhnya berada."
    "Salah itu biasa, yang penting jangan copy-paste salahnya."
    "Think twice, code once."
    "Open source bukan sekadar software, tapi cara hidup."
    "Keyboard adalah senjata, terminal adalah medan perang."
)

# ambil random
rand=$((RANDOM % ${#quotes[@]}))
center_text "${quotes[$rand]}"
center_text "                                                                   ~ ASyusuff"
