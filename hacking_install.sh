#!/bin/bash

# Menambahkan Logo dengan Warna
echo -e "\e[1;34m"  # Mengatur warna biru
figlet -f slant "HACKING_TOOLS"
echo -e "\e[0m"     # Reset warna ke default

# Menambahkan Aktor dan Informasi dengan Warna
echo -e "Pebuat: Farel Alfareza"  # Warna hijau
echo -e "Instagram & TikTok: @farel.project_5"  # Warna kuning


# Menampilkan Informasi Perangkat
echo -e "\nMenampilkan informasi perangkat..."
neofetch

# Menu Pilihan Alat Hacking
echo -e "\nPilih alat hacking yang ingin diinstal dan jalankan:"
echo "1. Nmap"
echo "2. Metasploit Framework"
echo "3. Hydra"
echo "4. Aircrack-ng"
echo "5. SQLMap"
echo "6. Nikto"
echo "7. Semua Alat"
echo "8. Keluar"

# Membaca pilihan pengguna
read -p "Masukkan nomor pilihan Anda: " choice

# Fungsi untuk menginstal dan menjalankan alat berdasarkan pilihan
install_and_run_tool() {
  # Mengupdate dan Mengupgrade Termux
echo -e "\nMengupdate dan meng-upgrade Termux..."
pkg update && pkg upgrade -y
    case $1 in
        1) 
            pkg install nmap -y
            nmap --help ;;
        2) 
            pkg install unstable-repo && pkg install metasploit -y
            msfconsole ;;
        3) 
            pkg install hydra -y
            hydra -h ;;
        4) 
            pkg install aircrack-ng -y
            aircrack-ng --help ;;
        5) 
            pkg install sqlmap -y
            sqlmap --help ;;
        6) 
            pkg install nikto -y
            nikto -h ;;
        7) 
            pkg install nmap -y
            pkg install unstable-repo && pkg install metasploit -y
            pkg install hydra -y
            pkg install aircrack-ng -y
            pkg install sqlmap -y
            pkg install nikto -y
            echo -e "\nSemua alat telah terinstal."
            echo "Menjalankan Nmap sebagai contoh..."
            nmap --help ;;
        8) 
            echo "Keluar dari skrip." ;;
        *) 
            echo "Pilihan tidak valid." ;;
    esac
}

# Memanggil fungsi instalasi dan eksekusi
install_and_run_tool "$choice"

echo -e "\nSelesai! Jika Anda memilih alat untuk diinstal, mereka telah terinstal."
