## Challenge 13 & 14: Client VM Setup & Domain Join

**Goal:** Second VM (`PC1`) created, network-configured, and joined to `tjserverlab.local` with a working domain user login.

**Creating Client VM**
- Created a second Hyper-V VM named `PC1` with 4 GB RAM, 2 vCPUs, 60 GB dynamic VHD
- Installed Windows 10/11
- Assigned static IP: `192.168.0.20 / 255.255.255.0 / GW 192.168.0.1`
- Set DNS to `192.168.0.10` (pointing to `WIN-DH9D3SPO213`)
- Verified ping to `WIN-DH9D3SPO213` by both IP and hostname

**Joining Domain**
- On `PC1`: System Properties > Change > Member of Domain > `tjserverlab.local`
- Entered domain admin credentials when prompted
- Rebooted after successful join
- In ADUC, moved `PC1` computer object into `Workstations` OU
- Logged in with a domain user account (`tjserverlab\j.beckett`) to confirm domain authentication

---

### Setting up Client VM - VM has already been setup but this would be the steps 

1. Download Windows 11 ISO from Microsoft
2. On Hyper-V click "New" > "Virtual Machine"
3. Name: Win11Vm > Generation 2 > Startup Memory: 4096 MB > Connection: Internal Network
4. Choose "Create a virtual hard disk", for location i have decided to put it my E: drive and size is 60GB
5. Click next and select "Install an operating system from a bootable image file" 
6. Locate the ISO file and press next
7. Double click the new VM and press start and follow the steps to install Windows 11
8. Once booted into Windows, run Windows Update and allow the device to restart when required

The new VM should have appeared

<img src="https://github.com/user-attachments/assets/3499269a-fe7b-4f23-8b66-fdf799bd5881" width="750" alt="Client VM">


---
### Setting Static IP & DNs for VM

1. Search for Network Connections
2. Right click the ethernet connection and go to properties
3. Update IPV4 settings to: `IP Address: 192.168.0.20 / Subnet: 255.255.255.0 / DW: 192.168.0.1 / DNS: 192.168.0.10`
<img src="https://github.com/user-attachments/assets/4b5dab5c-3ab2-4ebe-869a-a5eea5f9aeaa" width="750" alt="Server IP">

**Ping IP & Hostname**

<img src="https://github.com/user-attachments/assets/eb8afedf-2c1e-4403-b3ae-e14068ef12a6" width="750" alt="Ping IP & Host">

### Adding Client VM to Domain

1. Open File Explorer
2. Right click "This PC" > "Properties"
3. Click on "Domain or Workgroup" > "Change"
<img src="https://github.com/user-attachments/assets/af8bfe2e-c7b1-4fcb-9ee0-fdaee97edf57" width="750" alt="Domain Join">   

4. Choose "Domain" and put the domain `tjserverlab.local`

<img src="https://github.com/user-attachments/assets/32783ddb-bef2-4496-8113-805a48d8fc59" width="750" alt="Domain Joined">

6. This will prompt you to use an Admin account
7. Restart the device
8. Move `PC1` to "Workstations" OU from "Computers"
<img src="https://github.com/user-attachments/assets/6209ef16-775c-4265-b984-abf35278499c" width="750" alt="Move PC1">

9. Log in as `j.beckett`
<img src="https://github.com/user-attachments/assets/c601c385-cc23-4073-a208-415fdf42312c" width="750" alt="Log in">

**Logged in as Tom Beckett**

<img src="https://github.com/user-attachments/assets/56f6dd04-86ad-4047-ae31-7e9f609d37ce" width="750" alt="Logged in">

---

