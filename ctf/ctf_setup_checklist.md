# 🏴‍☠️ CTF Event Setup Checklist
## Complete Step-by-Step Preparation Guide

---

## 🖥️ Hardware Setup (3-5 days before)

### Raspberry Pi Preparation
- [ ] **Acquire 3 Raspberry Pi 4B** (4GB RAM minimum)
- [ ] **Get 3 microSD cards** (32GB or larger, Class 10)
- [ ] **Get 3 power supplies** (5V/3A USB-C)
- [ ] **Get 3 Ethernet cables** (for network connection)
- [ ] **Get 3 HDMI cables** (for initial setup)
- [ ] **Get 3 USB keyboards** (for initial setup)
- [ ] **Get 3 USB mice** (for initial setup)
- [ ] **Get 3 HDMI monitors** (for initial setup)

### Network Equipment
- [ ] **Get network switch** (8+ ports, gigabit)
- [ ] **Get network cables** (enough for all Pis + student computers)
- [ ] **Get network labels** (to mark cables)
- [ ] **Test network switch** (ensure all ports work)
- [ ] **Configure network isolation** (separate from main network)

### Student Workstations
- [ ] **Confirm student computer count** (1 per student)
- [ ] **Test all student computers** (ensure they boot and work)
- [ ] **Check student computer specs** (minimum 4GB RAM, 50GB free space)
- [ ] **Prepare backup computers** (2-3 extra)
- [ ] **Test all keyboards and mice**
- [ ] **Test all monitors**

### Backup Equipment
- [ ] **Prepare 3 backup Raspberry Pis** (if available)
- [ ] **Prepare backup microSD cards** (with pre-configured images)
- [ ] **Prepare backup network switch**
- [ ] **Prepare backup power supplies**
- [ ] **Prepare extension cords and power strips**

---

## 💾 Software Preparation (2-3 days before)

### Raspberry Pi OS Installation
- [ ] **Download Raspberry Pi OS** (latest version)
- [ ] **Flash OS to all 3 microSD cards**
- [ ] **Enable SSH on all Pis** (create ssh file in boot partition)
- [ ] **Set up initial user accounts** (pi user with known password)
- [ ] **Test boot on all Pis** (ensure they start properly)
- [ ] **Update all Pis** (`sudo apt update && sudo apt upgrade`)

### Required Software Installation
- [ ] **Install required packages on all Pis:**
  - [ ] `sudo apt install openssh-server nmap john hashcat python3 python3-pip`
  - [ ] `sudo apt install gcc make git curl wget`
  - [ ] `sudo apt install openssl`
- [ ] **Enable SSH service** (`sudo systemctl enable ssh`)
- [ ] **Test SSH access** (from another computer)

### Student Computer Software
- [ ] **Install required software on all student computers:**
  - [ ] **SSH client** (PuTTY for Windows, Terminal for Mac/Linux)
  - [ ] **Metasploit Framework** (if not pre-installed)
  - [ ] **John the Ripper** (if not pre-installed)
  - [ ] **Nmap** (if not pre-installed)
  - [ ] **Angry IP Scanner** (download and install)
  - [ ] **Text editor** (Notepad++, VS Code, or similar)
- [ ] **Test all software installations**
- [ ] **Create desktop shortcuts** for easy access

### Wordlists and Tools
- [ ] **Download rockyou.txt** (password wordlist)
- [ ] **Download additional wordlists** (if needed)
- [ ] **Test John the Ripper** with sample hashes
- [ ] **Test Metasploit** (basic functionality)
- [ ] **Test Angry IP Scanner** (network scanning)

---

## 🔧 CTF Configuration (1-2 days before)

### Network Configuration
- [ ] **Set up isolated network** (192.168.1.0/24)
- [ ] **Configure static IPs:**
  - [ ] Pi One: 192.168.1.10
  - [ ] Pi Two: 192.168.1.11
  - [ ] Pi Three: 192.168.1.12
- [ ] **Test network connectivity** (ping all devices)
- [ ] **Test SSH connectivity** (from student computers)
- [ ] **Document network layout**

### Pi One Setup (The Gateway)
- [ ] **Run setup script:** `./ctf_setup_script.sh`
- [ ] **Create user accounts:**
  - [ ] pieone (password: knownpassword)
  - [ ] ally (password: allysecret)
  - [ ] ella (password: ellasecret)
  - [ ] mike (password: mikepass)
  - [ ] sarah (password: sarahpass)
- [ ] **Create flag files:**
  - [ ] `/home/pieone/flag1.txt` → `CTF{Welcome_to_the_game_2024}`
  - [ ] `/home/pieone/.hidden_flag2.txt` → `CTF{Hidden_files_are_fun_2024}`
  - [ ] `/home/ally/flag3.txt` → `CTF{User_enumeration_success_2024}`
  - [ ] `/home/ella/flag4.txt` → `CTF{Base64_decoding_master_2024}`
- [ ] **Create password hint:** `/home/ella/password_hint.txt` → `ZWxsYXNlY3JldA==`
- [ ] **Test all user logins**
- [ ] **Verify all flag files are accessible**

### Pi Two Setup (The Challenge)
- [ ] **Run setup script:** `./ctf_setup_script.sh`
- [ ] **Create user accounts:**
  - [ ] pitwo (password: yellow)
  - [ ] jack (password: jackspassword)
  - [ ] admin (password: admin2024)
  - [ ] hacker (password: hackerpass)
  - [ ] root (password: rootpass)
- [ ] **Create flag files:**
  - [ ] `/home/pitwo/flag5.txt` → `CTF{John_the_Ripper_master_2024}`
  - [ ] `/home/pitwo/.secret_folder/flag6.txt` → `CTF{Hidden_directories_rock_2024}`
  - [ ] `/home/jack/flag7.txt` → `CTF{Privilege_escalation_beginner_2024}`
  - [ ] `/home/admin/flag8.txt` → `CTF{Metasploit_brute_force_expert_2024}`
- [ ] **Create hash file:** `/home/pitwo/password_hash.txt` → `$6$rounds=656000$salt123$hashedpassword`
- [ ] **Create encrypted password:** `/home/jack/encrypted_jack_password.bin`
- [ ] **Test all user logins**
- [ ] **Verify all flag files are accessible**

### Pi Three Setup (The Advanced)
- [ ] **Run setup script:** `./ctf_setup_script.sh`
- [ ] **Create user accounts:**
  - [ ] pithree (password: blue)
  - [ ] alice (password: cybersecurity2024)
  - [ ] bob (password: bobspassword)
  - [ ] charlie (password: charliepass)
- [ ] **Create flag files:**
  - [ ] `/home/pithree/flag9.txt` → `CTF{Network_reconnaissance_expert_2024}`
  - [ ] `/home/alice/flag10.txt` → `CTF{Advanced_hash_cracking_master_2024}`
  - [ ] `/home/bob/flag11.txt` → `CTF{Custom_encryption_solver_2024}`
  - [ ] `/root/final_flag.txt` → `CTF{Master_hacker_achievement_unlocked_2024}`
- [ ] **Create encrypted flag:** `/home/bob/encrypted_flag.bin` (XOR with "CTF2024")
- [ ] **Create SUID binary:** `/home/pithree/suid_exploit`
- [ ] **Test all user logins**
- [ ] **Verify all flag files are accessible**

---

## 🧪 Testing & Validation (Day before event)

### Individual Pi Testing
- [ ] **Test Pi One:**
  - [ ] SSH access for all users
  - [ ] Flag file accessibility
  - [ ] Base64 decoding works
  - [ ] User switching works
- [ ] **Test Pi Two:**
  - [ ] SSH access for all users
  - [ ] Flag file accessibility
  - [ ] John the Ripper works with hash
  - [ ] OpenSSL decryption works
  - [ ] Hidden directory accessible
- [ ] **Test Pi Three:**
  - [ ] SSH access for all users
  - [ ] Flag file accessibility
  - [ ] SUID binary works
  - [ ] Custom encryption/decryption works
  - [ ] Root access achievable

### Network Testing
- [ ] **Test network isolation** (no access to external internet)
- [ ] **Test connectivity between all devices**
- [ ] **Test Angry IP Scanner** (discovers all Pis)
- [ ] **Test Nmap scanning** (finds open ports)
- [ ] **Test Metasploit connectivity**

### Tool Testing
- [ ] **Test John the Ripper** (crack sample hashes)
- [ ] **Test Metasploit** (SSH brute force module)
- [ ] **Test Angry IP Scanner** (network discovery)
- [ ] **Test SSH clients** (PuTTY, Terminal)
- [ ] **Test text editors** (for viewing files)

### Full Game Walkthrough
- [ ] **Complete all 12 flags** as a test run
- [ ] **Time the completion** (should take 2-3 hours)
- [ ] **Document any issues** and solutions
- [ ] **Verify scoring system** works correctly
- [ ] **Test achievement badge system**

---

## 🏢 Venue Setup (Morning of event)

### Physical Setup
- [ ] **Arrive 2 hours before event start**
- [ ] **Set up tables and chairs** (1 per student)
- [ ] **Set up power strips** (test all outlets)
- [ ] **Set up network switch** (test all ports)
- [ ] **Connect all Raspberry Pis** (test connectivity)
- [ ] **Connect all student computers** (test boot)
- [ ] **Set up projector/screen** (for presentations)
- [ ] **Set up whiteboard** (for explanations)

### Network Setup
- [ ] **Power on all Pis** (verify they boot correctly)
- [ ] **Verify network connectivity** (ping all devices)
- [ ] **Test SSH from all student computers**
- [ ] **Verify network isolation** (no internet access)
- [ ] **Label all network cables** (for easy troubleshooting)

### Software Setup
- [ ] **Boot all student computers**
- [ ] **Verify all required software is installed**
- [ ] **Test SSH connections** to all Pis
- [ ] **Test Metasploit** (basic functionality)
- [ ] **Test John the Ripper** (with sample hash)
- [ ] **Test Angry IP Scanner** (network discovery)

### Materials Setup
- [ ] **Distribute student guides** (1 per seat)
- [ ] **Distribute cheat sheets** (1 per seat)
- [ ] **Distribute scorecards** (1 per seat)
- [ ] **Distribute safety rules** (1 per seat)
- [ ] **Set up achievement badges** (organized by type)
- [ ] **Set up stickers and prizes**
- [ ] **Prepare whiteboard** with network diagram

---

## 👥 Staff Briefing (30 minutes before event)

### Safety Briefing
- [ ] **Review safety protocols** (no real network access)
- [ ] **Review emergency procedures** (Pi failure, student issues)
- [ ] **Assign staff roles** (who monitors what)
- [ ] **Review student-to-staff ratio** (max 8:1)
- [ ] **Review communication protocols** (hand signals, etc.)

### Technical Briefing
- [ ] **Review network layout** (IP addresses, connectivity)
- [ ] **Review common issues** and solutions
- [ ] **Review flag locations** and solutions
- [ ] **Review scoring system** and badge distribution
- [ ] **Review backup procedures** (if Pis fail)

### Event Flow
- [ ] **Review event timeline** (3-4 hours total)
- [ ] **Review break schedule** (every 45 minutes)
- [ ] **Review challenge progression** (beginner to advanced)
- [ ] **Review team formation** (if applicable)
- [ ] **Review wrap-up activities**

---

## 🎯 Final Pre-Event Checklist (15 minutes before)

### Technical Verification
- [ ] **All 3 Pis are running and accessible**
- [ ] **All student computers are working**
- [ ] **Network is isolated and functional**
- [ ] **All required software is installed and working**
- [ ] **Backup equipment is ready**

### Materials Verification
- [ ] **All printed materials are distributed**
- [ ] **Achievement badges are organized**
- [ ] **Scorecards are ready**
- [ ] **Safety rules are visible**
- [ ] **Emergency contacts are posted**

### Staff Verification
- [ ] **All staff are present and briefed**
- [ ] **Staff roles are assigned**
- [ ] **Communication protocols are established**
- [ ] **Emergency procedures are understood**
- [ ] **Staff contact list is distributed**

### Venue Verification
- [ ] **Room is properly set up**
- [ ] **Power is stable**
- [ ] **Network is functional**
- [ ] **Temperature is comfortable**
- [ ] **Emergency exits are accessible**

---

## 🚨 Emergency Procedures

### If a Pi Fails
- [ ] **Immediate:** Power cycle the Pi
- [ ] **If still not working:** Replace with backup Pi
- [ ] **If no backup:** Use pre-configured image on new SD card
- [ ] **Document:** What caused the failure

### If Network Fails
- [ ] **Check:** Network switch power and connections
- [ ] **Reset:** Network switch if needed
- [ ] **Verify:** All cables are properly connected
- [ ] **Test:** Connectivity from multiple computers

### If Student Computer Fails
- [ ] **Immediate:** Provide backup computer
- [ ] **If no backup:** Have student work with partner
- [ ] **Document:** What caused the failure

### If Student Gets Stuck
- [ ] **Provide:** Appropriate hints (not solutions)
- [ ] **Encourage:** Teamwork and collaboration
- [ ] **Guide:** Student to next logical step
- [ ] **Document:** Common sticking points

---

## 📊 Post-Event Checklist

### Equipment Cleanup
- [ ] **Power down all Pis** (properly)
- [ ] **Disconnect all network cables**
- [ ] **Pack up all equipment**
- [ ] **Inventory all items** (ensure nothing is missing)
- [ ] **Store equipment securely**

### Data Cleanup
- [ ] **Backup student work** (if any)
- [ ] **Reset Pis to clean state** (if needed)
- [ ] **Clear any temporary files**
- [ ] **Document any issues** for future improvements

### Event Documentation
- [ ] **Collect student feedback**
- [ ] **Document completion times**
- [ ] **Record common challenges**
- [ ] **Note successful strategies**
- [ ] **Plan improvements for next event**
---

**Remember:** The goal is education and fun in a safe, controlled environment! 🎓 
