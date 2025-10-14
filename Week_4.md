# Week 4: CTF Challenge 3
## 4 Flags Across a Raspberry Pi

**Tools Required:** Metasploit, John the Ripper, Nmap, Angry IP Scanner, SSH clients

---

## 🥧 Raspberry Pi Three (PiThree) - "The Advanced"
**IP Address:** 192.168.1.12
**Theme:** Advanced exploitation and network analysis

### User Accounts:
1. **pithree** (Password: blue)
2. **alice** (Password: Advanced hash cracking)
3. **bob** (Password: Custom encryption)
4. **charlie** (Password: Steganography challenge)
5. **root** (Password: Final privilege escalation)

### Flags:

#### 🏁 Flag 9: "Network Discovery"
- **Location:** `/home/pithree/flag9.txt`
- **Content:** `CTF{Network_reconnaissance_expert_2024}`
- **Hint:** "Use Angry IP Scanner to find all devices on the network"
- **Method:** Network scanning to discover all Pi devices
- **Difficulty:** Intermediate
- **Skills:** Network reconnaissance, IP scanning

#### 🏁 Flag 10: "Advanced Hash Cracking"
- **Location:** `/home/alice/flag10.txt`
- **Content:** `CTF{Advanced_hash_cracking_master_2024}`
- **Hint:** "Alice uses a complex password. You'll need wordlists and patience."
- **Hash:** `$6$rounds=1000000$complexsalt$verylonghash`
- **Password:** cybersecurity2024
- **Difficulty:** Advanced
- **Skills:** Advanced hash cracking, wordlist manipulation

#### 🏁 Flag 11: "Custom Encryption"
- **Location:** `/home/bob/flag11.txt`
- **Content:** `CTF{Custom_encryption_solver_2024}`
- **Hint:** "Bob created his own encryption. Reverse engineer it."
- **Encrypted File:** `/home/bob/encrypted_flag.bin`
- **Method:** Custom XOR encryption with key: "CTF2024"
- **Difficulty:** Advanced
- **Skills:** Reverse engineering, custom decryption

#### 🏁 Flag 12: "Final Challenge"
- **Location:** `/root/final_flag.txt`
- **Content:** `CTF{Master_hacker_achievement_unlocked_2024}`
- **Hint:** "You need root access. Think about privilege escalation techniques."
- **Method:** Exploit SUID binary or kernel vulnerability
- **Difficulty:** Advanced
- **Skills:** Privilege escalation, kernel exploitation
