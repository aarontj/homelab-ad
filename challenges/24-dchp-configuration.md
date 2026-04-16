### Challenge 24: DHCP Configuration

**Goal**: Deploy and manage a DHCP server to automate IP address assignment within the lab domain.

- Installed the DHCP Server role via Server Manager on `WIN-DH9D3SPO213`
- Authorised the DHCP server in Active Directory via DHCP Manager
- Created a new scope covering the lab subnet (`192.168.0.100`–`192.168.0.200`, subnet mask `255.255.255.0`)
- Configured scope options:
  - **003 Router:** `192.168.0.1` (default gateway)
  - **006 DNS Servers:** `192.168.0.10` (domain controller)
  - **015 DNS Domain Name:** `tjserverlab.local`
- Set lease duration to 8 days
- Activated the scope
- On `PC1`, changed the network adapter from static IP to **Obtain an IP address automatically** and set DNS to **Obtain DNS server address automatically**
- Ran `ipconfig /release` and `ipconfig /renew` to force a lease request
- Verified `PC1` received an IP address within the scope range using `ipconfig /all`
- Created a DHCP reservation for `PC1` based on its MAC address

---

### Installing DHCP Server

1. Head to "Add roles and featuers"
2. Select "Role-based or feature-based features" then choose the DC
3. Select "DHCP Server", go "next" and press "Install"

<img src="https://github.com/user-attachments/assets/0f42bdd5-9614-4fd6-9443-c0efcad32ac5" width="750" alt="Install">

4. Once installed it will ask there will be a "little yellow trinagle" icon asking to configure
5. Leave it as "Use the following user's credentials - Username: `TJSERVERLAB\administrator`"

<img src="https://github.com/user-attachments/assets/8131aceb-190f-436a-80a7-ec2a57e7103e" width="750" alt="Credentials">

---

### Setting up new scope

1. Open "DHCP" then expand the DC
2. Right click "IPV4" then click "New Scope"
3. Provide a name eg. `Default Scope /24`

<img src="https://github.com/user-attachments/assets/211cfb49-5b24-4cde-93fb-349779215fba" width="750" alt="New Scope">

4. Add the DHCP range: Start IP address: `192.168.0.100` / End IP address: `192.168.0.200`
5. Ensure that **Length**: 24 and **Subnet mask**: 255.255.255.0

<img src="https://github.com/user-attachments/assets/8990b633-62bc-4dcd-bc33-7dc6da89128d" width="750" alt="Scope">

6. Set lease as "8 days"

<img src="https://github.com/user-attachments/assets/b9948c21-8956-4245-840e-e557b9496a98" width="750" alt="Lease">

7. Set the "Router (Default Gateway)" as `192.168.0.1`

<img src="https://github.com/user-attachments/assets/2ce476a6-63f5-4889-85c4-6912dc45b83d" width="750" alt="Router">

8. In "Domain Name and DNS Servers", search the domain name `tjserverlab.local` this should resolve to `192.168.0.10` as previously configured

<img src="https://github.com/user-attachments/assets/01c644c8-19a4-4fd3-9d53-6767a0e16977" width="750" alt="DNS">

9. Leave as "Yes, I want to activate this scope now" and complete the setup

---

### Setting up DHCP on `PC1` and testing DHCP reservation via MAC address

**Removing Static IP**

1. Log in to `PC1` and head to "View network connections"
2. Right click "ethernet" and go into "properties"
3. Go to into "Ipv4" properties
4. Remove the static addresses and click on "Obtain an IP address automatically" and "Obtain DNS server address automatically"

<img src="https://github.com/user-attachments/assets/3d8b3773-ad08-4319-a94b-ef3960bda3d6" width="750" alt="Remove">

5. Open **CMD** and run `ipconfig /release` and `ipconfig /renew`
6. Now run `ipconfig /all` it should have provided with a new address and should include (preferred) at the end of IP address, indicating this was allocated by DHCP
7. Note down the **Physical Address** also known as **MAC Address**

<img src="https://github.com/user-attachments/assets/77b0a105-e6c9-4573-b319-c1f519f072d2" width="750" alt="DHCP IP">

**PC1 on Active Directory**
<img src="https://github.com/user-attachments/assets/259710c5-148e-4acb-9be4-370c73cc3940" width="750" alt="DHCP ON AD">

---

**Testing DHCP Reservation via MAC address**

1. Open "DHCP" in server manager
2. Expand **IPV4** and **Scope**
3. Right "Reservations" and click "New Reservations"

<img src="https://github.com/user-attachments/assets/de33a2cf-1027-49fb-919b-3bd2d42229b9" width="750" alt="new reservation">

4. Provide scope name eg. "DHCP Challenge", add the **MAC Address** of **PC1**: `00-15-5D-14-EB-03`, and now give it an IP within the scope range eg. `192.168.0.150` 

<img src="https://github.com/user-attachments/assets/1d8afa6d-9fb2-4aef-98c2-f94c38ec7a50" width="750" alt="reservation">

5. Open **CMD** and run `ipconfig /release` and `ipconfig /renew`
6. Now run `ipconfig /all` and the IPV4 address should have updated to `192.168.0.150`

<img src="https://github.com/user-attachments/assets/6cfb7aee-c45f-40e1-89a3-847437e4b4a8" width="750" alt="Reservation work">

**Reservation on AD**

<img src="https://github.com/user-attachments/assets/e330bcac-d5d3-412f-8133-71e8c4fcfa88" width="750" alt="Reservation on ad">

---






