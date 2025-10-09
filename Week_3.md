# Week 3: CTF

## 12 Flags Across 3 Raspberry Pis

### 🎯 Game Overview

**Objective:** Students must find and capture 12 flags hidden across 3 Raspberry Pi devices using various cybersecurity techniques including Metasploit, John the Ripper, password cracking, privilege escalation, and network reconnaissance.
**Tools Required:** Metasploit, John the Ripper, Nmap, Angry IP Scanner, SSH clients

---

## 🥧 Raspberry Pi One (PiOne) - "The Gateway"
**IP Address:** 192.168.1.10
**Theme:** Basic reconnaissance and user enumeration

### User Accounts:
1. **pieone** (Password: Known)
2. **ally** (Password: Hidden)
3. **ella** (Password: Base64 encoded)
4. **mike** (Password: MD5 hash)
5. **sarah** (Password: SHA256 hash)

### Flags:

#### 🏁 Flag 1: "First Steps"
- **Location:** `/home/pieone/flag1.txt`
- **Content:** `CTF{Welcome_to_the_game_2024}`
- **Hint:** "Start with what you know - the main user account"
- **Difficulty:** Beginner
- **Skills:** Basic file system navigation

#### 🏁 Flag 2: "Hidden in Plain Sight"
- **Location:** `/home/pieone/.hidden_flag2.txt`
- **Content:** `CTF{Hidden_files_are_fun_2024}`
- **Hint:** "Some files like to hide from prying eyes"
- **Difficulty:** Beginner
- **Skills:** Hidden file discovery

#### 🏁 Flag 3: "User Hopping"
- **Location:** `/home/ally/flag3.txt`
- **Content:** `CTF{User_enumeration_success_2024}`
- **Hint:** "Try switching users - ally might have something interesting"
- **Difficulty:** Beginner
- **Skills:** User switching, password discovery

#### 🏁 Flag 4: "Base64 Challenge"
- **Location:** `/home/ella/flag4.txt`
- **Content:** `CTF{Base64_decoding_master_2024}`
- **Hint:** "Ella's password is encoded in base64. Decode it to proceed."
- **Password:** `ZWxsYXNlY3JldA==` (decodes to: ellasecret)
- **Difficulty:** Beginner
- **Skills:** Base64 decoding

---

## 🛠️ Required Tools & Setup

### Tools Students Need:
1. **Metasploit Framework** - For brute forcing and exploitation
2. **John the Ripper** - For password hash cracking
3. **Nmap** - For network scanning and service enumeration
4. **Angry IP Scanner** - For network discovery
5. **SSH Client** - For remote access
6. **Base64 decoder** - For encoded passwords
7. **Hash identifier** - To identify hash types
8. **Text editor** - For viewing files

### Setup Instructions:

#### Pi One Setup:
```bash
# Create users
sudo useradd -m pieone
sudo useradd -m allie
sudo useradd -m ella
sudo useradd -m mike
sudo useradd -m sarah

# Set passwords
echo "pieone:knownpassword" | sudo chpasswd
echo "ally:alliesecret" | sudo chpasswd
echo "ella:ellasecret" | sudo chpasswd
echo "mike:$(echo -n 'mikepass' | md5sum)" | sudo chpasswd
echo "sarah:$(echo -n 'sarahpass' | sha256sum)" | sudo chpasswd

# Create flag files
sudo echo "CTF{Welcome_to_the_game_2024}" > /home/pieone/flag1.txt
sudo echo "CTF{Hidden_files_are_fun_2024}" > /home/pieone/.hidden_flag2.txt
sudo echo "CTF{User_enumeration_success_2024}" > /home/allie/flag3.txt
sudo echo "CTF{Base64_decoding_master_2024}" > /home/ella/flag4.txt
```
