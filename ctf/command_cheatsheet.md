# 🛠️ CTF Commands Cheat Sheet
## Complete Tool & Command Reference

---

## 📁 Basic Linux Commands

### File System Navigation
```bash
# List files and directories
ls                    # Basic listing
ls -a                 # Show all files (including hidden)
ls -l                 # Long format with details
ls -la                # Long format with all files
ls -lh                # Human readable file sizes
ls -R                 # Recursive listing

# Change directories
cd                    # Go to home directory
cd ..                 # Go up one directory
cd /                  # Go to root directory
cd /home/user         # Go to specific directory
cd -                  # Go to previous directory
pwd                   # Print working directory

# File operations
cat filename          # Display file contents
cat -n filename       # Display with line numbers
head filename         # Show first 10 lines
head -20 filename     # Show first 20 lines
tail filename         # Show last 10 lines
tail -f filename      # Follow file in real-time
less filename         # View file with pagination
more filename         # View file with pagination
nano filename         # Edit file with nano
vim filename          # Edit file with vim
cp source dest        # Copy file
cp -r source dest     # Copy directory recursively
mv source dest        # Move/rename file
rm filename           # Remove file
rm -rf directory      # Remove directory and contents
mkdir directory       # Create directory
touch filename        # Create empty file
```

### File Permissions & Ownership
```bash
# View permissions
ls -la                # Show permissions
stat filename         # Show detailed file info

# Change permissions
chmod 644 filename    # Set permissions (rw-r--r--)
chmod +x filename     # Make executable
chmod -x filename     # Remove executable
chmod u+x filename    # Make executable for user only

# Change ownership
chown user:group filename
chown user filename
chgrp group filename

# Find files
find / -name "filename" 2>/dev/null
find / -type f -name "*.txt" 2>/dev/null
find / -perm -4000 2>/dev/null    # Find SUID binaries
find / -perm -2000 2>/dev/null    # Find SGID binaries
```

### System Information
```bash
# System info
whoami               # Current user
id                   # User and group info
uname -a             # System information
cat /etc/passwd      # User accounts
cat /etc/group       # Group accounts
ps aux               # Running processes
top                  # System monitor
htop                 # Interactive system monitor
df -h                # Disk usage
free -h              # Memory usage
```

### Network Commands
```bash
# Network connectivity
ping 192.168.1.10    # Test connectivity
ping -c 4 192.168.1.10  # Ping 4 times
traceroute 192.168.1.10 # Trace route
netstat -tuln        # Show listening ports
ss -tuln             # Show listening ports (modern)
ifconfig             # Network interfaces
ip addr              # Network interfaces (modern)
route -n             # Routing table
```

---

## 🔐 SSH Commands

### Basic SSH
```bash
# Connect to remote host
ssh user@192.168.1.10
ssh -p 2222 user@192.168.1.10    # Custom port
ssh -i key.pem user@192.168.1.10 # With key file
ssh -v user@192.168.1.10         # Verbose output

# SSH options
ssh -o StrictHostKeyChecking=no user@192.168.1.10  # Skip host key check
ssh -X user@192.168.1.10         # Enable X11 forwarding
ssh -L 8080:localhost:80 user@192.168.1.10  # Port forwarding

# SSH key management
ssh-keygen -t rsa -b 4096        # Generate SSH key
ssh-copy-id user@192.168.1.10    # Copy key to remote host
```

### SSH File Transfer
```bash
# Copy files to remote host
scp file.txt user@192.168.1.10:/home/user/
scp -r directory/ user@192.168.1.10:/home/user/
scp -P 2222 file.txt user@192.168.1.10:/home/user/

# Copy files from remote host
scp user@192.168.1.10:/home/user/file.txt ./
scp -r user@192.168.1.10:/home/user/directory/ ./

# Secure copy with rsync
rsync -avz /local/path/ user@192.168.1.10:/remote/path/
rsync -avz user@192.168.1.10:/remote/path/ /local/path/
```

---

## 🔍 Network Scanning Tools

### Nmap Commands
```bash
# Basic scanning
nmap 192.168.1.10                # Basic scan
nmap -sP 192.168.1.0/24          # Ping sweep
nmap -sn 192.168.1.0/24          # Ping sweep (modern)

# Port scanning
nmap -p 80,443,22 192.168.1.10   # Specific ports
nmap -p- 192.168.1.10            # All ports
nmap -p 1-1000 192.168.1.10      # Port range

# Service detection
nmap -sV 192.168.1.10            # Version detection
nmap -sV -sC 192.168.1.10        # Version + default scripts
nmap -A 192.168.1.10             # Aggressive scan

# Script scanning
nmap --script=vuln 192.168.1.10  # Vulnerability scripts
nmap --script=auth 192.168.1.10  # Authentication scripts
nmap --script=default 192.168.1.10  # Default scripts

# Output formats
nmap -oN output.txt 192.168.1.10 # Normal output
nmap -oX output.xml 192.168.1.10 # XML output
nmap -oG output.grep 192.168.1.10 # Grepable output
nmap -oA output 192.168.1.10     # All formats
```

### Angry IP Scanner
```bash
# Command line usage
angryipscanner --hosts 192.168.1.0/24
angryipscanner --hosts 192.168.1.1-192.168.1.254
angryipscanner --hosts 192.168.1.10,192.168.1.11,192.168.1.12

# Output options
angryipscanner --hosts 192.168.1.0/24 --output-format txt
angryipscanner --hosts 192.168.1.0/24 --output-format csv
angryipscanner --hosts 192.168.1.0/24 --output-format xml
```

---

## 🔨 Password Cracking Tools

### John the Ripper
```bash
# Basic usage
john hash.txt                    # Crack password hash
john --wordlist=wordlist.txt hash.txt  # With wordlist
john --show hash.txt             # Show cracked passwords

# Hash format specification
john --format=raw-md5 hash.txt   # MD5 hashes
john --format=raw-sha1 hash.txt  # SHA1 hashes
john --format=raw-sha256 hash.txt # SHA256 hashes
john --format=sha512crypt hash.txt # SHA512 crypt

# Advanced options
john --incremental hash.txt      # Incremental mode
john --single hash.txt           # Single crack mode
john --external=name hash.txt    # External mode
john --rules hash.txt            # Word mangling rules

# List supported formats
john --list=formats              # Show all formats
john --list=formats | grep -i sha # Search for SHA formats

# Resume interrupted session
john --restore                    # Restore from checkpoint
john --session=name hash.txt     # Named session
```

### Hashcat
```bash
# Basic usage
hashcat -m 0 hash.txt wordlist.txt    # MD5
hashcat -m 100 hash.txt wordlist.txt  # SHA1
hashcat -m 1400 hash.txt wordlist.txt # SHA256

# Attack modes
hashcat -a 0 -m 0 hash.txt wordlist.txt  # Straight attack
hashcat -a 1 -m 0 hash.txt wordlist1.txt wordlist2.txt  # Combination
hashcat -a 3 -m 0 hash.txt ?a?a?a?a      # Brute force (4 chars)

# Performance options
hashcat -w 3 -m 0 hash.txt wordlist.txt  # Workload profile
hashcat --force -m 0 hash.txt wordlist.txt  # Force GPU usage

# Show results
hashcat --show -m 0 hash.txt      # Show cracked hashes
```

---

## 🚀 Metasploit Framework

### Starting Metasploit
```bash
# Start Metasploit
msfconsole                         # Start interactive console
msfconsole -r script.rc            # Start with resource script
msfconsole -q                      # Quiet mode (no banner)

# Database management
msfdb init                         # Initialize database
msfdb start                        # Start database
msfdb stop                         # Stop database
msfdb status                       # Check database status
```

### Basic Metasploit Commands
```bash
# Help and information
help                               # Show all commands
help search                        # Help for specific command
info module_name                   # Show module information
show options                       # Show current module options
show targets                       # Show available targets
show payloads                      # Show available payloads

# Module management
search keyword                     # Search for modules
search type:exploit platform:linux # Advanced search
use module_name                    # Use a module
back                               # Go back to previous module
reload                             # Reload current module
```

### Setting Module Options
```bash
# Basic options
set RHOSTS 192.168.1.10           # Set target host
set RPORT 22                       # Set target port
set USERNAME admin                 # Set username
set PASSWORD password              # Set password
set PASS_FILE /path/to/wordlist.txt # Set password file

# Payload options
set PAYLOAD payload_name           # Set payload
set LHOST 192.168.1.100           # Set local host
set LPORT 4444                     # Set local port

# Advanced options
set THREADS 10                     # Set number of threads
set TIMEOUT 30                     # Set timeout
set VERBOSE true                   # Enable verbose output
```

### Running Modules
```bash
# Execute modules
run                                # Run current module
exploit                            # Run exploit module
check                              # Check if target is vulnerable
```

### Session Management
```bash
# Session commands
sessions -l                        # List active sessions
sessions -i 1                      # Interact with session 1
sessions -k 1                      # Kill session 1
sessions -u 1                      # Upgrade session 1 to meterpreter
background                         # Background current session
```

### Common Modules
```bash
# SSH brute force
use auxiliary/scanner/ssh/ssh_login
set USERNAME admin
set PASS_FILE /usr/share/wordlists/rockyou.txt
run

# Port scanning
use auxiliary/scanner/portscan/tcp
set PORTS 1-1000
run

# Service enumeration
use auxiliary/scanner/ssh/ssh_version
run

# FTP brute force
use auxiliary/scanner/ftp/ftp_login
set USERNAME admin
set PASS_FILE /usr/share/wordlists/rockyou.txt
run
```

---

## 🔓 Privilege Escalation

### User Switching
```bash
# Switch users
su username                        # Switch to user
su - username                      # Switch with environment
sudo -u username command           # Run command as user
sudo -l                            # List sudo privileges

# Check user privileges
id                                # Current user info
whoami                            # Current username
groups                            # Current user groups
```

### SUID/SGID Exploitation
```bash
# Find SUID binaries
find / -perm -4000 2>/dev/null    # Find SUID files
find / -perm -2000 2>/dev/null    # Find SGID files
find / -perm -u=s -type f 2>/dev/null  # Alternative SUID find

# Common SUID exploits
# If you find a SUID binary, try:
./binary_name                      # Run the binary
# If it gives root shell, you can access root files
```

### Kernel Exploitation
```bash
# Check system information
uname -a                          # Kernel version
cat /etc/os-release               # OS information
lsb_release -a                    # Distribution info

# Check for kernel exploits
searchsploit kernel_version        # Search for exploits
```

---

## 🔍 Information Gathering

### User Enumeration
```bash
# List users
cat /etc/passwd                   # All users
cut -d: -f1 /etc/passwd           # Usernames only
grep -E ":[0-9]{4}:" /etc/passwd  # Users with UID 1000+

# User details
id username                       # User info
finger username                   # User details
w                                 # Who is logged in
who                               # Current users
last                              # Last logins
```

### Process Enumeration
```bash
# Running processes
ps aux                           # All processes
ps aux | grep root               # Root processes
ps aux | grep -v root            # Non-root processes

# Process details
lsof -i                          # Open network connections
lsof -p PID                      # Files opened by process
netstat -tulpn                   # Network connections
```

### File System Enumeration
```bash
# Find interesting files
find / -name "*.txt" 2>/dev/null
find / -name "*.conf" 2>/dev/null
find / -name "*.log" 2>/dev/null
find / -name "*.key" 2>/dev/null
find / -name "*.pem" 2>/dev/null

# Find writable directories
find / -writable 2>/dev/null
find / -perm -222 -type d 2>/dev/null

# Find files with specific permissions
find / -perm -4000 2>/dev/null   # SUID
find / -perm -2000 2>/dev/null   # SGID
find / -perm -1000 2>/dev/null   # Sticky bit
```

---

## 🔐 Encryption/Decryption

### Base64
```bash
# Encode
echo "text" | base64
base64 filename > encoded.txt

# Decode
echo "encoded_text" | base64 -d
base64 -d encoded.txt > decoded.txt
```

### OpenSSL
```bash
# Encrypt file
openssl enc -aes-256-cbc -salt -in file.txt -out file.enc -k password

# Decrypt file
openssl enc -aes-256-cbc -d -in file.enc -out file.txt -k password

# Generate hash
echo "text" | openssl dgst -md5
echo "text" | openssl dgst -sha256
```

### Custom XOR Decryption (Python)
```python
# XOR decryption
def xor_decrypt(encrypted_data, key):
    decrypted = ""
    for i, char in enumerate(encrypted_data):
        decrypted += chr(ord(char) ^ ord(key[i % len(key)]))
    return decrypted

# Usage
with open('encrypted_file.bin', 'rb') as f:
    encrypted = f.read().decode()
key = "CTF2024"
decrypted = xor_decrypt(encrypted, key)
print(decrypted)
```

---

## 📊 Data Analysis

### Text Processing
```bash
# Search in files
grep "pattern" filename           # Search for pattern
grep -r "pattern" directory/      # Recursive search
grep -i "pattern" filename        # Case insensitive
grep -v "pattern" filename        # Invert match

# Sort and filter
sort filename                     # Sort lines
sort -u filename                 # Sort and remove duplicates
uniq filename                    # Remove consecutive duplicates
head -20 filename                # First 20 lines
tail -20 filename                # Last 20 lines

# Text manipulation
cut -d: -f1 filename             # Cut first field
awk '{print $1}' filename        # Print first column
sed 's/old/new/g' filename       # Replace text
```

### File Analysis
```bash
# File type
file filename                     # Determine file type
strings filename                  # Extract strings
hexdump -C filename              # Hex dump
xxd filename                      # Hex dump (alternative)

# Archive files
tar -xzf archive.tar.gz          # Extract tar.gz
unzip archive.zip                # Extract zip
7z x archive.7z                  # Extract 7z
```

---

## 🛡️ CTF-Specific Commands

### Flag Hunting
```bash
# Find flag files
find / -name "*flag*" 2>/dev/null
find / -name "*.txt" -exec grep -l "CTF{" {} \; 2>/dev/null
grep -r "CTF{" /home/ 2>/dev/null

# Check common locations
ls -la /home/*/
ls -la /root/
ls -la /tmp/
ls -la /var/
```

### Steganography
```bash
# Image analysis
strings image.jpg                 # Extract strings from image
file image.jpg                    # Check file type
binwalk image.jpg                 # Analyze file structure
exiftool image.jpg                # Extract metadata

# Audio analysis
strings audio.wav                 # Extract strings from audio
file audio.wav                    # Check file type
```

### Web Challenges
```bash
# Web enumeration
curl http://192.168.1.10          # Basic HTTP request
curl -I http://192.168.1.10       # HTTP headers only
wget http://192.168.1.10          # Download file
dirb http://192.168.1.10          # Directory brute force
nikto -h http://192.168.1.10      # Web vulnerability scanner
```

---

## 📝 Documentation Commands

### Note Taking
```bash
# Create notes
echo "Note: Found flag in /home/user/flag.txt" >> notes.txt
cat >> notes.txt << EOF
Flag 1: CTF{example}
Location: /home/user/flag1.txt
Method: SSH access
EOF

# View notes
cat notes.txt
less notes.txt
tail -f notes.txt                 # Follow notes in real-time
```

### Screenshots and Recording
```bash
# Take screenshot (if X11 available)
import -window root screenshot.png
scrot screenshot.png              # Alternative screenshot tool

# Record terminal session
script session.log                # Start recording
# ... your commands ...
exit                              # Stop recording
```

---

## 🚨 Emergency Commands

### System Recovery
```bash
# Kill processes
kill PID                          # Kill process by PID
killall process_name              # Kill all processes by name
pkill process_name                # Kill processes by name

# Reset terminal
reset                             # Reset terminal
clear                             # Clear screen
stty sane                         # Reset terminal settings
```

### Network Troubleshooting
```bash
# Network reset
sudo systemctl restart networking
sudo systemctl restart ssh
sudo systemctl status ssh

# Check connectivity
ping -c 1 192.168.1.10
telnet 192.168.1.10 22
nc -zv 192.168.1.10 22
```

---

## 📚 Quick Reference

### Common Ports
- **21:** FTP
- **22:** SSH
- **23:** Telnet
- **25:** SMTP
- **53:** DNS
- **80:** HTTP
- **110:** POP3
- **143:** IMAP
- **443:** HTTPS
- **445:** SMB
- **1433:** MSSQL
- **3306:** MySQL
- **5432:** PostgreSQL
- **8080:** HTTP Alternative

### File Permissions
- **400:** r-------- (read only)
- **600:** rw------- (read/write owner)
- **644:** rw-r--r-- (read/write owner, read others)
- **755:** rwxr-xr-x (read/write/execute owner, read/execute others)
- **777:** rwxrwxrwx (read/write/execute all)

### Common Hash Formats
- **MD5:** 32 characters
- **SHA1:** 40 characters
- **SHA256:** 64 characters
- **SHA512:** 128 characters
- **bcrypt:** $2a$ or $2b$ prefix
- **SHA512crypt:** $6$ prefix

---

## 🎯 CTF Game Specific Commands

### Pi One (192.168.1.10)
```bash
# Connect and explore
ssh pieone@192.168.1.10
ls -la /home/pieone/
cat /home/pieone/flag1.txt
cat /home/pieone/.hidden_flag2.txt
su ally
cat /home/ally/flag3.txt
echo "ZWxsYXNlY3JldA==" | base64 -d
su ella
cat /home/ella/flag4.txt
```

### Pi Two (192.168.1.11)
```bash
# Connect and crack
ssh pitwo@192.168.1.11
cat /home/pitwo/password_hash.txt
john /home/pitwo/password_hash.txt
ls -la /home/pitwo/.secret_folder/
cat /home/pitwo/.secret_folder/flag6.txt
openssl enc -aes-256-cbc -d -in /home/jack/encrypted_jack_password.bin -k "CTF2024"
su jack
cat /home/jack/flag7.txt
```

### Pi Three (192.168.1.12)
```bash
# Advanced techniques
ssh pithree@192.168.1.12
find / -perm -4000 2>/dev/null
./suid_exploit
cat /root/final_flag.txt
```

---

**Remember:** Always use these tools ethically and only on systems you own or have permission to test! 🛡️ 
