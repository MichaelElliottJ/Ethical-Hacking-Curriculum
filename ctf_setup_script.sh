#!/bin/bash

# 🏴‍☠️ CTF Game Setup Script
# This script sets up all 3 Raspberry Pis for the Capture The Flag game
# Run this script on each Pi with appropriate modifications

echo "🏴‍☠️ CTF Game Setup Script"
echo "=========================="
echo ""

# Function to create users and set passwords
create_user() {
    local username=$1
    local password=$2
    echo "Creating user: $username"
    sudo useradd -m -s /bin/bash "$username"
    echo "$username:$password" | sudo chpasswd
    echo "User $username created with password: $password"
}

# Function to create flag files
create_flag() {
    local filepath=$1
    local content=$2
    local owner=$3
    echo "Creating flag: $filepath"
    echo "$content" | sudo tee "$filepath" > /dev/null
    sudo chown "$owner:$owner" "$filepath"
    sudo chmod 644 "$filepath"
}

# Function to create hidden files
create_hidden_flag() {
    local filepath=$1
    local content=$2
    local owner=$3
    echo "Creating hidden flag: $filepath"
    echo "$content" | sudo tee "$filepath" > /dev/null
    sudo chown "$owner:$owner" "$filepath"
    sudo chmod 644 "$filepath"
}

# Function to create directories
create_directory() {
    local dirpath=$1
    local owner=$2
    echo "Creating directory: $dirpath"
    sudo mkdir -p "$dirpath"
    sudo chown "$owner:$owner" "$dirpath"
    sudo chmod 755 "$dirpath"
}

# Detect which Pi this is based on hostname or IP
PI_NUMBER=""
if [[ $(hostname) == *"pi1"* ]] || [[ $(hostname) == *"one"* ]]; then
    PI_NUMBER="1"
elif [[ $(hostname) == *"pi2"* ]] || [[ $(hostname) == *"two"* ]]; then
    PI_NUMBER="2"
elif [[ $(hostname) == *"pi3"* ]] || [[ $(hostname) == *"three"* ]]; then
    PI_NUMBER="3"
else
    echo "Please specify which Pi this is (1, 2, or 3):"
    read -r PI_NUMBER
fi

echo "Setting up Raspberry Pi $PI_NUMBER"
echo ""

# Update system
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install required packages
echo "Installing required packages..."
sudo apt install -y openssh-server nmap john hashcat python3 python3-pip

# Enable SSH
echo "Enabling SSH..."
sudo systemctl enable ssh
sudo systemctl start ssh

# Configure network (optional - set static IP)
echo "Configuring network..."
if [[ $PI_NUMBER == "1" ]]; then
    echo "Setting Pi 1 IP to 192.168.1.10"
    # Add network configuration here if needed
elif [[ $PI_NUMBER == "2" ]]; then
    echo "Setting Pi 2 IP to 192.168.1.11"
    # Add network configuration here if needed
elif [[ $PI_NUMBER == "3" ]]; then
    echo "Setting Pi 3 IP to 192.168.1.12"
    # Add network configuration here if needed
fi

echo ""
echo "Setting up users and flags for Pi $PI_NUMBER..."
echo ""

if [[ $PI_NUMBER == "1" ]]; then
    # Pi One Setup
    echo "🥧 Setting up Raspberry Pi One - The Gateway"
    echo "============================================="
    
    # Create users
    create_user "pieone" "knownpassword"
    create_user "ally" "allysecret"
    create_user "ella" "ellasecret"
    create_user "mike" "mikepass"
    create_user "sarah" "sarahpass"
    
    # Create flag files
    create_flag "/home/pieone/flag1.txt" "CTF{Welcome_to_the_game_2024}" "pieone"
    create_hidden_flag "/home/pieone/.hidden_flag2.txt" "CTF{Hidden_files_are_fun_2024}" "pieone"
    create_flag "/home/ally/flag3.txt" "CTF{User_enumeration_success_2024}" "ally"
    create_flag "/home/ella/flag4.txt" "CTF{Base64_decoding_master_2024}" "ella"
    
    # Create additional files for hints
    echo "ZWxsYXNlY3JldA==" | sudo tee /home/ella/password_hint.txt > /dev/null
    sudo chown ella:ella /home/ella/password_hint.txt
    
    echo "Pi One setup complete!"
    
elif [[ $PI_NUMBER == "2" ]]; then
    # Pi Two Setup
    echo "🥧 Setting up Raspberry Pi Two - The Challenge"
    echo "=============================================="
    
    # Create users
    create_user "pitwo" "yellow"
    create_user "jack" "jackspassword"
    create_user "admin" "admin2024"
    create_user "hacker" "hackerpass"
    create_user "root" "rootpass"
    
    # Create hash file for John the Ripper
    echo "Creating password hash file..."
    echo '$6$rounds=656000$salt123$hashedpassword' | sudo tee /home/pitwo/password_hash.txt > /dev/null
    sudo chown pitwo:pitwo /home/pitwo/password_hash.txt
    
    # Create flag files
    create_flag "/home/pitwo/flag5.txt" "CTF{John_the_Ripper_master_2024}" "pitwo"
    create_directory "/home/pitwo/.secret_folder" "pitwo"
    create_flag "/home/pitwo/.secret_folder/flag6.txt" "CTF{Hidden_directories_rock_2024}" "pitwo"
    create_flag "/home/jack/flag7.txt" "CTF{Privilege_escalation_beginner_2024}" "jack"
    create_flag "/home/admin/flag8.txt" "CTF{Metasploit_brute_force_expert_2024}" "admin"
    
    # Create encrypted password file for jack
    echo "Creating encrypted password file for jack..."
    echo "jackspassword" | openssl enc -aes-256-cbc -salt -out /home/jack/encrypted_jack_password.bin -k "CTF2024"
    sudo chown jack:jack /home/jack/encrypted_jack_password.bin
    
    echo "Pi Two setup complete!"
    
elif [[ $PI_NUMBER == "3" ]]; then
    # Pi Three Setup
    echo "🥧 Setting up Raspberry Pi Three - The Advanced"
    echo "==============================================="
    
    # Create users
    create_user "pithree" "blue"
    create_user "alice" "cybersecurity2024"
    create_user "bob" "bobspassword"
    create_user "charlie" "charliepass"
    
    # Create flag files
    create_flag "/home/pithree/flag9.txt" "CTF{Network_reconnaissance_expert_2024}" "pithree"
    create_flag "/home/alice/flag10.txt" "CTF{Advanced_hash_cracking_master_2024}" "alice"
    create_flag "/home/bob/flag11.txt" "CTF{Custom_encryption_solver_2024}" "bob"
    create_flag "/root/final_flag.txt" "CTF{Master_hacker_achievement_unlocked_2024}" "root"
    
    # Create custom encrypted file for bob
    echo "Creating custom encrypted file for bob..."
    python3 -c "
import sys
flag = 'CTF{Custom_encryption_solver_2024}'
key = 'CTF2024'
encrypted = ''.join(chr(ord(f) ^ ord(k)) for f, k in zip(flag, key * (len(flag)//len(key) + 1)))
with open('/home/bob/encrypted_flag.bin', 'wb') as f:
    f.write(encrypted.encode())
"
    sudo chown bob:bob /home/bob/encrypted_flag.bin
    
    # Create advanced hash for alice
    echo "Creating advanced hash for alice..."
    echo "cybersecurity2024" | sudo tee /home/alice/password_hash.txt > /dev/null
    sudo chown alice:alice /home/alice/password_hash.txt
    
    # Create SUID binary for privilege escalation
    echo "Creating SUID binary for privilege escalation..."
    cat > /tmp/suid_exploit.c << 'EOF'
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    setuid(0);
    system("/bin/bash");
    return 0;
}
EOF
    gcc -o /home/pithree/suid_exploit /tmp/suid_exploit.c
    sudo chown root:root /home/pithree/suid_exploit
    sudo chmod 4755 /home/pithree/suid_exploit
    rm /tmp/suid_exploit.c
    
    echo "Pi Three setup complete!"
fi

# Create a summary file
echo "Creating setup summary..."
cat > /home/pi/setup_summary.txt << EOF
CTF Game Setup Summary - Pi $PI_NUMBER
=====================================

Setup completed on: $(date)
Pi Number: $PI_NUMBER

Users created:
$(cut -d: -f1 /etc/passwd | grep -E "(pieone|ally|ella|mike|sarah|pitwo|jack|admin|hacker|pithree|alice|bob|charlie)" | sort)

Flag files created:
$(find /home -name "*flag*" -type f 2>/dev/null | sort)

Network configuration:
$(ip addr show | grep "inet " | grep -v "127.0.0.1")

SSH Status: $(systemctl is-active ssh)
EOF

echo ""
echo "🎉 Setup complete for Pi $PI_NUMBER!"
echo ""
echo "📋 Summary:"
echo "- Users created and configured"
echo "- Flag files placed"
echo "- SSH enabled"
echo "- Network configured"
echo ""
echo "📝 Setup summary saved to: /home/pi/setup_summary.txt"
echo ""
echo "🔧 Next steps:"
echo "1. Test SSH access to all users"
echo "2. Verify all flag files are accessible"
echo "3. Test password cracking challenges"
echo "4. Ensure network connectivity between Pis"
echo ""
echo "🚨 Remember to:"
echo "- Keep this environment isolated"
echo "- Monitor student activities"
echo "- Have backup images ready"
echo "- Follow safety protocols"
echo ""
echo "Good luck with your CTF game! 🏴‍☠️" 