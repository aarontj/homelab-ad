### Challenge 4:Networking

**Goal:** VM has a static IP address and confirmed internet connectivity.

- Created an External virtual switch in Hyper-V Manager for internet access
- Created an Internal virtual switch for isolated lab traffic
- Assigned a static IP to the VM: `192.168.1.10 / 255.255.255.0 / GW 192.168.1.1` - 
- Set DNS to `127.0.0.1` (localhost, required before Active Directory installation)
- Verified ping to `8.8.8.8` succeeded
  
---

### Disclaimer 
I was already playing around with Active Directory prior to making this challenge thus why the last 2 steps were not completed. This is my configuration in moving forward - VM: `192.168.0.10 / 255.255.255.0 / GW 192.168.0.1/ DNS: Automatic`

---
### Overview
This challenge asked me to create an External and Internal virtual switch in Hyper-V. However, i wanted my VM's to not be able to isolated from my home network while also being isolated from the host maachine. 

I needed my VMs to meet the following requirements:
- Have static, predictable IP addresses
- Communication between VM's
- Have internet access
- Be isolated from the host machine for security

A standard External switch would give the VMs internet access, but it would also expose them directly to my physical network and make the host reachable. Which I didn't want for a lab environment.

Upon further research i came across NAT which allowed my VM's to connect to the internet while having static IP's.

### The Solution

I set up an Internal switch with NAT, which gave me the best of both worlds:

| VM | IP Address |
|---|---|
| Host (NAT Gateway) | `192.168.0.1` |
| Server VM | `192.168.0.10` |
| Client VM | `192.168.0.20` |

- The VMs sit on an isolated `192.168.0.0/24` network
- Static IPs are assigned to each VM
- The host acts as a NAT gateway at `192.168.0.1`, routing outbound internet traffic without being directly reachable itself
- Pinging the host from any VM fails, confirming the isolation is working

### Steps Taken

1. Created an Internal virtual switch in Hyper-V Manager
2. Assigned a static IP to the host's internal adapter (`192.168.0.1`)
**Setting Static IP on Host Machine**
<img src="https://github.com/user-attachments/assets/9a052555-cf2a-42af-b3f7-2f3efaa31ac3" width="750" alt="Server IP">

3. Ran the following PowerShell command on host machine to configure NAT:
```powershell
New-NetNat -Name VMNAT -InternalIPInterfaceAddressPrefix 192.168.0.0/24
```
4. Verified the NAT configuration using:
```powershell
Get-NetNat
```
5. Updated Server VM & Client VM network adapter to use the internal switch
**Internal Switch**
<img src="https://github.com/user-attachments/assets/3e4e6a60-18e6-4234-ad13-83dc23ab1ddb" width="750" alt="Internal Switch">

6. On each VM search "Network Connections", right click the ethernet connection and go into properties
7. Find IPV4 and update the IP address for `Server: 192.168.0.10` and `Client: 192.168.0.20`
**Setting Static IP & DNS for Server VM**
<img src="https://github.com/user-attachments/assets/2c632a2f-fa0c-4f10-a19b-d5761d852137" width="750" alt="Server IP">

**Setting Static IP & DNS for Client VM**
<img src="https://github.com/user-attachments/assets/4b5dab5c-3ab2-4ebe-869a-a5eea5f9aeaa" width="750" alt="Server IP">

8. Verified VM-to-VM connectivity and internet access via ping
**Ping to Client**
<img src="https://github.com/user-attachments/assets/0b9aa6a4-d997-4ac4-8432-ef853c8b5069" width="750" alt="Ping to Client">

9. Confirmed host isolation — pinging `192.168.0.1` from a VM fails 
**Ping to Host fail**
<img src="https://github.com/user-attachments/assets/7c9c7c04-031c-4d35-b87b-07dec9a37326" width="750" alt="Ping Fail">

---





