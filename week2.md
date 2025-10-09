# Week 2: More Kali Linux Experience, First CTF Challenge, and Virtual Machines

# Kali Linux: Scanning Networks

## What is a network?
A network is how a device connects to another device. This can be done in multiple ways, <ins>**LAN, WAN, and the Internet**</ins>.

**LAN (Local Area Network)** : A WIFI at home or your school's computer lab

**WAN (Wide Area Network)** : The Internet or connecting offices in different cities

**Internet** : The worldwide web

# How Can We See Networks?

## IP (Internet Protocol) Addresses

### IPv4 Format
```
192.168.1.100
[4 numbers separated by dots, each 0-255]
```

### Common IP Ranges
- **Home Networks:** `192.168.x.x` or `10.x.x.x`
- **Public IPs:** `8.8.8.8` (Google DNS), `1.1.1.1` (Cloudflare)
- **Localhost:** `127.0.0.1` (your own computer)

## MAC Addresses (Media Access Control)

### Format
```
AA:BB:CC:DD:EE:FF
[6 pairs of letters/numbers, separated by colons]
```

### What It Does
- **Unique identifier** for each network device
- **Never changes** (like a device's fingerprint)
- Used for **local network communication**

### Example
```
Your laptop: 00:1B:44:11:3A:B7
Your phone:  A1:B2:C3:D4:E5:F6
```

---

## DNS (Domain Name System)

### What It Does
**Translates website names to IP addresses**

### How It Works
```
www.google.com → 142.250.191.78
www.youtube.com → 142.250.191.46
```

### Common DNS Servers
- **Google:** `8.8.8.8` and `8.8.4.4`
- **Cloudflare:** `1.1.1.1` and `1.0.0.1`

---

## 📋 Network Protocols

| Protocol | Port | What It Does | Example |
|----------|------|--------------|---------|
| **HTTP** | 80 | Regular web browsing | `http://example.com` |
| **HTTPS** | 443 | Secure web browsing | `https://example.com` |
| **FTP** | 21 | File transfer | Uploading files to server |
| **SSH** | 22 | Secure remote access | Connecting to servers |

### Protocol Comparison
```
HTTP  = Regular mail (anyone can read)
HTTPS = Encrypted mail (only you can read)
FTP   = File delivery service
SSH   = Secure phone call to another computer
```

---

## 🔍 Network Commands for Lab Activity

### Basic Network Info
```bash
# View your network info
ipconfig (Windows)
ifconfig (Mac/Linux)
ip addr (Linux)

# View your MAC address
ipconfig /all (Windows)
ifconfig (Mac/Linux)
```

### Network Discovery Commands
```bash
# Test connection to a device
ping 192.168.1.1

# Test connection to a range of devices
ping 192.168.1.1
ping 192.168.1.2
ping 192.168.1.3
# ... continue for your network range

# See the path to a device
traceroute 192.168.1.1

# Test DNS resolution
nslookup google.com
```

### Advanced Network Mapping
```bash
# Scan network for active devices (Windows)
arp -a

# Scan network for active devices (Mac/Linux)
arp -a
# or
ip neigh show

# Find your network range
# Look at your IP address and subnet mask from ipconfig/ifconfig
# Example: 192.168.1.100 with mask 255.255.255.0 = scan 192.168.1.1-254
```

### Device Identification Commands
```bash
# Get detailed network info (Windows)
ipconfig /all

# Get detailed network info (Mac/Linux)
ifconfig -a

# View network interfaces
netstat -i (Mac/Linux)
netstat -e (Windows)
```

---

## 🕵️ Mystery Device Challenge Commands

### Step 1: Find Your Network
```bash
# Windows
ipconfig
# Look for "IPv4 Address" and "Subnet Mask"

# Mac/Linux
ifconfig
# Look for "inet" and "netmask"
```

### Step 2: Map Your Network
```bash
# Example: If your IP is 192.168.1.100, scan 192.168.1.1-254
# Test each IP in your network range:

ping 192.168.1.1
ping 192.168.1.2
ping 192.168.1.3
# ... continue for your network
```

### Step 3: Identify Devices
```bash
# View all devices your computer knows about
arp -a

# Get detailed info about a specific device
ping -c 4 192.168.1.X  # Replace X with device number
```

### Step 4: Document Your Findings
```
Device IP: 192.168.1.X
MAC Address: XX:XX:XX:XX:XX:XX
Response Time: XX ms
Device Type: (laptop, phone, printer, etc.)
```

---

## 🎯 Quick Reference

### Network Communication Flow
```
1. You type: www.google.com
2. DNS looks up: www.google.com → 142.250.191.78
3. Your device sends request to: 142.250.191.78
4. Google's server responds with webpage
```

### Device Identification
- **IP Address:** Like a house address (can change)
- **MAC Address:** Like a house serial number (never changes)

### Network Scanning Strategy
1. **Find your network range** (use ipconfig/ifconfig)
2. **Ping each IP** in your range systematically
3. **Document responding devices** with IP and MAC
4. **Identify the mystery device** by process of elimination

### Safety Tips
- ✅ Use HTTPS for sensitive information
- ✅ Be careful with public WiFi
- ✅ Don't share your network passwords
- ❌ Don't click suspicious links
- ❌ Don't connect to unknown networks
- ✅ Only scan your own network (with permission)

---

## 🏆 Network Detective Challenge

**Your Mission:** Find the mystery device on the network!

### Step-by-Step Process:
1. **Get your network info:** `ipconfig` or `ifconfig`
2. **Find your network range:** Look at your IP and subnet mask
3. **Scan systematically:** `ping` each IP in your range
4. **Document devices:** Record IP, MAC, and response times
5. **Identify mystery device:** Compare with known devices

### Tools You'll Use:
- `ipconfig` / `ifconfig` - Find your network
- `ping` - Test device connectivity
- `arp -a` - View known devices
- `traceroute` - Map network paths
- Team collaboration
- Problem-solving skills

### Mystery Device Clues:
- It responds to ping
- It has a unique MAC address
- It might be a printer, IoT device, or hidden device
- Compare with your team's devices

---
