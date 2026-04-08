## Challenge 7: AD Basics

**Goal**: Familiar with the three core AD management consoles.

- Opened Active Directory Users and Computers (ADUC) via Server Manager > Tools
- Explored the default containers: Users, Computers, Domain Controllers
- Opened Active Directory Domains and Trusts and observed the `tjserverlab.local` domain
- Opened Active Directory Sites and Services and noted the Default-First-Site-Name

---
**Overview**

By default when installing Domain Services, there are users created by default by Windows most notably:
- **Administrator** = Built in domain admin account
- **krbtgt** = Kerberos Ticket Granting Ticket - Is a service account which encrypts and sign Kerberbos ticket which ensures authentication within the domain which validate users and services allowing them to access netowrk resoruces.
- **Domain Users** = Is a group that automatically includes all user accounts created within that domain
There are many more accounts but i did not really go too deeply into them

The `Computer` OU is the default container where new/ existing computers appear when connected to the domain.

The `Domain Controllers` is the OU where all DC's within the same domain sit eg. `WIN-DH9D3SPO213`.

There was nothing else inside of `Domain Trust` other than my domain that i have created. From my reasearch this is where you manage trust relationships for other domains to access resources.
<img src="https://github.com/user-attachments/assets/3be3dcb9-9067-43d4-b750-0af7497cf9db" width="750" alt="Domaintrust">

The AD Sites and Services is used to manage domain controllers, this is where you manage different sites and setup replication. Replication is used so domain controllers are automatically synchronised between other domain controllers.
<img src="https://github.com/user-attachments/assets/9058406b-ed4c-422d-97af-f8211f99aede" width="750" alt="ADSites">

---

