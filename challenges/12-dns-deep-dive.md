### Challenge 12: DNS Deep Dive

**Goal:** Understand and verify DNS is serving the domain correctly.

- Opened DNS Manager via Server Manager > Tools
- Explored the Forward Lookup Zone for `tjserverlab.local` and noted A records for `lab-dc01`
- Explored the Reverse Lookup Zone and created one for `192.168.0.x`
- Ran `nslookup lab-dc01.tjserverlab.local` to verify resolution

---

### Disclaimer - As indicated in Lab Notes ❗

This is another VM i created to demonstrate setting up DNS Server on Active Directory. 

Moving forward the domain IP address is `192.168.0.10` and the DC name is `WIN-DH9D3SPO213`.

---

### Overview
The A records is used to resolve `tjserverlab.local` to ip addresses eg. `192.168.0.30`. This is for when a computer wants to find the IP address of the Domain Controller `lab-dc01.tjserverlab.local` the DNS Server replies with `192.168.0.30`. 

The **Reverse Lookup** is used to translate the IP `192.168.0.30` into a hostname. 

---

### Steps Taken - Get nslookup to resolve domain name

1. Head to "Change Adapter Options"
2. Right click the "ethernet" conenction then click on "properties"
3. Double click on "IPV4", as we are on the DC we want to update the "Preferred DNS Server" to the same IP as the DC eg. `192.168.0.30` as this is the IP address of the DNS Server as well.
4. Used `nslookup` on CMD and it returned **Default Sever:** Unknown & **Address:** ::1
5. This meant that DNS was not resolving properly

<img src="https://github.com/user-attachments/assets/78342272-fa0c-4d01-8d31-00a8cd6c1381" width="750" alt="IPV6 Error">

### Diagnosis
The main issue with the result of nslookup was the address returned `::1`, this type of address is a IPV6 address. What i found was that `::1` is inputted as the preferred IPV6 DNS address. 
<img src="https://github.com/user-attachments/assets/50efcd91-8bb9-4a67-8221-8c2d9b4489a3" width="750" alt="IPV6 Error">

After removing the IPV6 address and selecting "Obtain DNS server automatically", when using nslookup on CMD it showed the IP address of the DC/ DNS server `192.168.0.30` but the "Default Server" remained unknown.

---
#### Solution create a Reverse lookup & PTR record back to the Domain Controller.

1. Open "Server Manager" and go to "DNS" in Tools
2. Expand the forest and right click "Reverse Lookup Zones"
3. Create a "New Zone" > "Primary Zone" > "To all DNS servers running on domain controllers in this domain: tjserverlab.local" > "IPV4 Reverse Lookup Zone" > input `192.168.0`
4. This would have created a new zone
<img src="https://github.com/user-attachments/assets/a61dc112-c1d7-427b-9720-aeec0fa7842d" width="750" alt="Reverse Lookup Zone">

5. Double click on the new folder created inside of Reverse Lookup
6. Right click and create "New Pointer (PTR)"
   
7. In "Host IP Address" put the DC/DNS server `192.168.0.30` and for "Host Name" browse for the A Record (same as parent folder)
<img src="https://github.com/user-attachments/assets/8c4ed69b-250d-4919-b133-78aa6ccb0865" width="750" alt="PTR">

8. Click apply and ok
9. When you try nslookup on CMD again it would now resolve as **Default Server:** `tjeserverlab.local` & **Address:** `192.168.0.30`
<img src="https://github.com/user-attachments/assets/73633138-a454-4e55-8792-6e39fbd28cc7" width="750" alt="Nslookup Fixed">

---
### Screenshot 

**Verifying that it resolves**

<img src="https://github.com/user-attachments/assets/4cc31553-9c4d-46b9-a7e8-f36c26a0ebba" width="750" alt="Resolve">

---


