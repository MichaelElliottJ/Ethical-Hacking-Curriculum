# Week 4: CTF Challenge 2
## 12 Flags Across a Raspberry Pi

### 🎯 Game OverviewA
**Objective:** Students must find and capture 12 flags hidden across 3 Raspberry Pi devices using various cybersecurity techniques including Metasploit, John the Ripper, password cracking, privilege escalation, and network reconnaissance.

**Tools Required:** Metasploit, John the Ripper, Nmap, Angry IP Scanner, SSH clients

---

## 🥧 Raspberry Pi (PiTwo) - "The Challenge"
**IP Address:** 192.168.1.11
**Theme:** Password cracking and privilege escalation

### User Accounts:
1. **pitwo** (Password: yellow)
2. **jack** (Password: Encrypted - needs cracking)
3. **admin** (Password: Unknown - brute force required)
4. **hacker** (Password: Hash cracking challenge)
5. **root** (Password: Privilege escalation required)

### Flags:

#### 🏁 Flag 5: "Hash Cracker"
- **Location:** `/home/pitwo/flag5.txt`
- **Content:** `CTF{John_the_Ripper_master_2024}`
- **Hint:** "Find the password hash and crack it with John the Ripper"
- **Hash File:** `/home/pitwo/password_hash.txt`
- **Hash:** `$6$rounds=656000$salt123$hashedpassword` (cracks to: secret123)
- **Difficulty:** Intermediate
- **Skills:** Hash cracking with John the Ripper

#### 🏁 Flag 6: "Hidden Directory"
- **Location:** `/home/pitwo/.secret_folder/flag6.txt`
- **Content:** `CTF{Hidden_directories_rock_2024}`
- **Hint:** "Look for directories that don't want to be found"
- **Difficulty:** Intermediate
- **Skills:** Hidden directory discovery

#### 🏁 Flag 7: "User Switch Challenge"
- **Location:** `/home/jack/flag7.txt`
- **Content:** `CTF{Privilege_escalation_beginner_2024}`
- **Hint:** "Jack's password is encrypted. Use the right tool to decrypt it."
- **Encrypted Password:** `encrypted_jack_password.bin` (decrypts to: jackspassword)
- **Difficulty:** Intermediate
- **Skills:** Password decryption, user switching

#### 🏁 Flag 8: "Metasploit Mastery"
- **Location:** `/home/admin/flag8.txt`
- **Content:** `CTF{Metasploit_brute_force_expert_2024}`
- **Hint:** "Use Metasploit to brute force the admin password"
- **Method:** SSH brute force with Metasploit
- **Password:** admin2024
- **Difficulty:** Intermediate
- **Skills:** Metasploit SSH brute force
  
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

#### Setup:
```bash
# Create users
sudo useradd -m pitwo
sudo useradd -m jack
sudo useradd -m admin
sudo useradd -m hacker
sudo useradd -m root

# Set passwords
echo "pitwo:yellow" | sudo chpasswd
echo "jack:jackspassword" | sudo chpasswd
echo "admin:admin2024" | sudo chpasswd
echo "hacker:hackerpass" | sudo chpasswd

# Create hash file
echo '$6$rounds=656000$salt123$hashedpassword' > /home/pitwo/password_hash.txt

# Create flag files
echo "CTF{John_the_Ripper_master_2024}" > /home/pitwo/flag5.txt
mkdir -p /home/pitwo/.secret_folder
echo "CTF{Hidden_directories_rock_2024}" > /home/pitwo/.secret_folder/flag6.txt
echo "CTF{Privilege_escalation_beginner_2024}" > /home/jack/flag7.txt
echo "CTF{Metasploit_brute_force_expert_2024}" > /home/admin/flag8.txt
```

---
