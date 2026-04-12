# 🖥️ Active Directory Homelab: 27 Challenges

> **Building a production-grade Windows Server 2022 domain from scratch. Documenting progress as each challenge is completed.**

---

## 📋 Overview

This repository documents 27 hands-on challenges building a functional **Windows Server 2022 Active Directory domain** using **Hyper-V** on my personal desktop. Each challenge includes the tasks completed, the goal and the outcome.

Host machine specs:
- AMD Ryzen 9700x
- 32GB DDR5 RAM
- Radeon 9070xt
- 500GB NVMe + 1TB NVMe
- Windows 11 Pro

---
## ✅ Progress

![18/27](https://img.shields.io/badge/challenges-18%2F27%20complete-1D9E75?style=flat-square)

**18 / 27 challenges complete** — 67%

---
## 🏗️ Lab Environment

| Component | VM: `WIN-DH9D3SPO213` (Domain Controller) | VM: `PC1` (Workstation) |
|---|---|---|
| **OS** | Windows Server 2022 Standard | Windows 10/11 |
| **RAM** | 4 GB | 4 GB |
| **CPU** | 2 vCPUs | 2 vCPUs |
| **Disk** | 60 GB dynamic VHD | 60 GB dynamic VHD |
| **IP Address** | 192.168.0.10 (static) | 192.168.0.20 (static) |
| **DNS** | 192.168.0.10 (self) | 192.168.0.10 (DC) |
| **Domain** | tjserverlab.local | Joined to tjserverlab.local |

**Host Machine Requirements:** Windows 10/11 Pro or Enterprise · 16 GB RAM minimum · 100 GB free disk

---

### 📝 Lab Notes

This project follows 27 Active Directory homelab challenges. A few things worth noting before diving in.

The main Domain Controller used throughout this lab has the hostname `WIN-DH9D3SPO213` instead of the intended `LAB-DC01`. Honestly, I didn't think about renaming the server before promoting it to a Domain Controller and by the time I realised, I was already halfway through the challenges. I did attempt the rename after promotion, which broke the domain trust relationship and needed a rollback to a previous checkpoint. Lesson learned: always rename before promoting.

I also spun up a second DC VM specifically to document the DNS configuration stage with proper screenshots, since the naming on the main VM was already inconsistent with the guide by that point.

None of this affects how the environment actually runs. The domain (`tjserverlab.local`), Active Directory, DNS, Group Policy, and authentication all work as expected. The hostname is cosmetic at this point.

It is from the **"Disclaimer❗"** section onwards where the DC name appears as `WIN-DH9D3SPO213`.

---

## 🛠️ Technologies Used

- **Hyper-V** - VM creation, virtual switching, checkpoints/snapshots
- **Windows Server 2022** - OS installation, roles, features, patching
- **Active Directory Domain Services (AD DS)** - domain, OUs, users, groups
- **DNS Server** - forward lookup zones, A records, domain name resolution
- **Group Policy (GPO)** - password policies, drive maps, desktop settings, software deployment
- **PowerShell (ActiveDirectory module)** - bulk user creation, auditing, account management
- **DHCP** - scope awareness and IP management
- **Event Viewer** - security auditing, logon/lockout event filtering
- **Server Manager / ADUC / GPMC / ADAC** - core AD management consoles

---

## 📁 Repository Structure

```
homelab/
├── README.md                          <- This file
├── challenges/
│   ├── 01-03-VM-setup.md
merged
│   ├── 04-networking.md
│   ├── 05-ad-ds-role-installation.md
│   ├── 06-promote-to-domain-controller.md
│   ├── 07-ad-basics.md
│   ├── 08-organisational-units.md
│   ├── 09-user-accounts.md
│   ├── 10-security-groups.md
│   ├── 11-password-policy.md
│   ├── 12-dns-deep-dive.md
│   ├── 13-14-client-vm-setup-domain-join.md
merged
│   ├── 15-gpo-basics.md
│   ├── 16-login-scripts-drive-mapping.md
│   ├── 17-roaming-profiles.md
│   ├── 18-software-deployment-gpo.md
│   ├── 19-powershell-ad-automation.md
│   ├── 20-delegation-rbac.md
│   ├── 21-ad-backup.md
│   ├── 22-fsmo-roles.md
│   ├── 23-event-viewer-auditing.md
│   ├── 24-fine-grained-password-policy.md
│   ├── 25-ad-recycle-bin.md
│   ├── 26-security-audit.md
│   └── 27-final-challenge.md
├── scripts/
│   └── powershell/
│       ├── bulk-create-users.ps1
│       ├── audit-domain-admins.ps1
│       └── ad-security-check.ps1
└── docs/
    └── lab-summary.md
```

---

## 📅 Challenge Log

---

### Hyper-V Setup and First Domain Controller
*Building the foundation: hardware, OS, and domain creation*

---

### [Challenge 1: Orientation](challenges/01-03-VM-Setup.md)
Goal: Hyper-V Manager is open and ready on the host machine.

- Reviewed Windows Server 2022 system requirements
- Downloaded the Windows Server 2022 Evaluation ISO from Microsoft Eval Center
- Enabled the Hyper-V feature via Control Panel > Programs > Turn Windows features on/off
- Opened Hyper-V Manager and confirmed it was functional on the host

Outcome: Hyper-V Manager running, ISO downloaded and staged.

---

### [Challenge 2: VM Creation](challenges/01-03-VM-Setup.md)
Goal: VM boots to the Windows Server 2022 setup screen.

- Created a new VM in Hyper-V Manager with 4 GB RAM, 2 vCPUs, 60 GB dynamic VHD
- Attached the Windows Server 2022 ISO to the virtual DVD drive
- Booted the VM and confirmed it reached the installation wizard

Outcome: VM created and booting successfully from ISO.

---

### [Challenge 3: OS Installation](challenges/01-03-VM-Setup.md)
Goal: Server is fully patched and at the desktop.

- Completed Windows Server 2022 Standard (Desktop Experience) installation
- Set a strong Administrator password and stored it securely
- Ran Windows Update and installed all critical patches
- Installed Hyper-V Integration Services when prompted

Outcome: Clean, patched Windows Server 2022 installation ready for configuration.

---

### [Challenge 4: Networking](challenges/04-networking.md)
Goal: VM has a static IP address and confirmed internet connectivity.

- Created an External virtual switch in Hyper-V Manager for internet access
- Created an Internal virtual switch for isolated lab traffic
- Assigned a static IP to the VM: `192.168.1.10 / 255.255.255.0 / GW 192.168.1.1`
- Set DNS to `127.0.0.1` (localhost, required before Active Directory installation)
- Verified ping to `8.8.8.8` succeeded

Outcome: VM has a stable network configuration with DNS pointing to localhost in preparation for AD DS.

---

### [Challenge 5: AD DS Role Installation](challenges/05-ad-ds-role-installation.md)
Goal: Active Directory Domain Services and DNS roles installed successfully.

- Opened Server Manager > Add Roles and Features
- Selected Active Directory Domain Services & DNS Server
- Completed the installation wizard and waited for the full install to finish before closing
- Confirmed the yellow notification flag appeared in Server Manager post-install

Outcome: AD DS and DNS roles installed. Server ready to be promoted to a Domain Controller.

---

### [Challenge 6: Promote to Domain Controller](challenges/06-promote-to-domain-controller.md)

Goal: `lab.local` domain created and `lab-dc01` is the first Domain Controller.

- Clicked "Promote this server to a domain controller" from the Server Manager notification
- Selected Add a new forest with root domain name: `tjserverlab.local`
- Set Forest and Domain Functional Level to Windows Server 2016
- Set the DSRM (Directory Services Restore Mode) password and stored it securely
- Completed the wizard. Server rebooted automatically and came back as a Domain Controller.

Outcome: `lab.local` domain is live. `lab-dc01` confirmed as the first DC.

---

### Active Directory Core
*Users, groups, OUs, password policy, and DNS*

---

### [Challenge 7: AD Basics](challenges/07-ad-basics.md)
Goal: Familiar with the three core AD management consoles.

- Opened Active Directory Users and Computers (ADUC) via Server Manager > Tools
- Explored the default containers: Users, Computers, Domain Controllers
- Opened Active Directory Domains and Trusts and observed the `tjserverlab.local` domain
- Opened Active Directory Sites and Services and noted the Default-First-Site-Name

Outcome: Familiar with ADUC, AD Domains and Trusts, and AD Sites and Services.

---

### [Challenge 8: Organisational Units and Structure](challenges/08-organisational-units.md)
Goal: OU structure mimicing a real company hierarchy.

- In ADUC, right-clicked `tjserverlab.local` > New > Organizational Unit
- Created top-level OUs: `Staff`, `Workstations`, `Groups`, `_Admin`
- Inside `Staff`, created sub-OUs: `Finance`, `HR`, `IT`, `Marketing`
- OUs are containers used for applying Group Policy and delegating admin control

Outcome: OU hierarchy built to reflect a real-world company structure.

---

### [Challenge 9: User Accounts](challenges/09-user-accounts.md)
Goal: Create user accounts for each department OU.

- Created 2 user accounts per department placed in their respective OUs (e.g. `Jayden Smith` in `HR`)
- Set First Name, Last Name, UPN (`j.smith@tjserverlab.local`), and logon name for each account
- Enforced "User must change password at next logon" for each account

Outcome: 8 domain user accounts created with consistent naming conventions and baseline security settings.

---

### [Challenge 10: Security Groups](challenges/10-security-groups.md)
Goal: Users are organised into correctly scoped security groups.

- Created Security Groups: `GRP-IT-Admins`, `GRP-HR`, `GRP-Finance`, `GRP-Marketing` (Global, Security type)
- Added users to their respective department groups
- Added `adm.` prefixed accounts to `GRP-IT-Admins`
- Reviewed Group Scope options: Domain Local vs Global vs Universal

Outcome: Group structure in place. Users inherit permissions through group membership rather than direct assignment.

---

### [Challenge 11: Password Policy](challenges/11-password-policy.md)
Goal: Default Domain Policy has a password policy configured and enforced.

- Opened Group Policy Management Console (GPMC)
- Edited the Default Domain Policy
- Configured under Computer Configuration > Windows Settings > Security Settings > Account Policies:
  - Minimum password length: 12 characters
  - Password complexity: Enabled
  - Maximum password age: 90 days
  - Account lockout threshold: 5 invalid attempts
- Ran `gpupdate /force` on the DC to apply immediately

Outcome: Password policy enforced domain-wide via Default Domain Policy.

---

### [Challenge 12: DNS Deep Dive](challenges/12-dns-deep-dive.md)
Goal: Understand and verify DNS is serving the domain correctly.

- Opened DNS Manager via Server Manager > Tools
- Explored the Forward Lookup Zone for `tjserverlab.local` and noted A records for `lab-dc01`
- Explored the Reverse Lookup Zone and created one for `192.168.0.x`
- Ran `nslookup lab-dc01.tjserverlab.local` to verify resolution

Outcome: DNS resolving correctly. AD health confirmed via SRV record lookup.

---

### Disclaimer ❗
From this section onwards, the DC hostname appears as `WIN-DH9D3SPO213` as noted in the Lab Notes above.

---

### Group Policy and Client Integration
*Joining workstations, deploying software, and mapping drives*

---

### [Challenge 13: Client VM Setup](challenges/13-14-client-vm-setup-domain-join.md)
Goal: Second VM (`PC1`) created and running.

- Created a second Hyper-V VM named `PC1` with 4 GB RAM, 2 vCPUs, 60 GB dynamic VHD
- Installed Windows 10/11
- Assigned static IP: `192.168.0.20 / 255.255.255.0 / GW 192.168.0.1`
- Set DNS to `192.168.0.10` (pointing to `WIN-DH9D3SPO213`)
- Verified ping to `WIN-DH9D3SPO213` by both IP and hostname

Outcome: Client VM is network-ready and can resolve the domain controller by name.

---

### [Challenge 14: Domain Join](challenges/13-14-client-vm-setup-domain-join.md)
Goal: `PC1` is joined to `tjserverlab.local` and a domain user can log in.

- On `PC1`: System Properties > Change > Member of Domain > `tjserverlab.local`
- Entered domain admin credentials when prompted
- Rebooted after successful join
- In ADUC, moved `PC1` computer object into `Workstations` OU
- Logged in with a domain user account (`tjserverlab\j.beckett`) to confirm domain authentication

Outcome: Client domain-joined. Domain user accounts authenticate successfully from the workstation.

---

### [Challenge 15: GPO Basics](challenges/15-gpo-basics.md)
Goal: First custom GPO applied to workstations.

- Created a new GPO named `Workstation-Baseline` and link it to the `Workstations` OU
- Configured: Disable Control Panel access for standard users
- Configured: Set desktop wallpaper to a solid colour
- On `PC1`: ran `gpupdate /force` then `gpresult /r` to verify the policy applied

Outcome: First custom GPO confirmed applied to the workstation.

---

### [Challenge 16: Login Scripts and Drive Mapping](challenges/16-login-scripts-drive-mapping.md)
Goal: HR users get `H:` drive mapped automatically at login.

- On `WIN-DH9D3SPO213`, created a shared folder: `C:\Shares\HR` (share name: `HR$`)
- Set NTFS permissions: `HR-Users` group = Read/Write; Everyone = No Access
- Created GPO: `HR-Drive-Map`, linked to the `HR_Department` OU
- Configured User Configuration > Preferences > Windows Settings > Drive Maps
- Mapped `H:` to `\\WIN-DH9D3SPO213\HR$`

Outcome: HR users get `H:` drive mapped automatically at login via GPO preferences.

---

### [Challenge 18: Software Deployment via GPO](challenges/18-software-deployment-gpo.md)
Goal: User profile follows them across domain computers.

- On `WIN-DH9D3SPO213`, created a shared folder: `C:\Profiles` (share name: `Profiles$`)
- Granted Domain Users the Change permission on the share
- In ADUC, opened a user > Profile tab > set Profile path to `\\WIN-DH9D3SPO213\Profiles$\%username%`
- Logged into `PC1` as that user and verified a profile folder was created on the server

Outcome: Roaming profile confirmed. User settings persist across domain-joined machines.

---

**Challenge 18: Software Deployment via GPO**
Goal: Software deployed to workstations via GPO without touching each machine manually.

- Downloaded the 7-Zip MSI installer
- Copied the MSI to `\\WIN-DH9D3SPO213\SYSVOL\tjserverlab.local\scripts\`
- Created GPO: `Software-Deploy-7Zip`, linked to the `Workstations` OU
- Configured Computer Configuration > Software Settings > Software Installation > New > Package
- Ran `gpupdate /force` on `PC1` and rebooted. Verified 7-Zip installed successfully.

Outcome: Software deployed silently to domain workstations via Group Policy.

---

### Advanced Active Directory and Real-World Skills
*PowerShell, delegation, backup, FSMO roles, and security hardening*

---

**Challenge 19: PowerShell AD Automation**
Goal: Create and manage AD objects using PowerShell only.

- Opened PowerShell as Administrator on `WIN-DH9D3SPO213`
- Ran `Import-Module ActiveDirectory`
- Bulk-created 10 users using a script with `New-ADUser`, targeting specific OUs with department and title attributes
- Listed all locked accounts using `Search-ADAccount -LockedOut`
- Unlocked a test account using `Unlock-ADAccount -Identity username`

Outcome: Bulk user creation and account management completed entirely through PowerShell.

---

**Challenge 20: Delegation of Control and RBAC**
Goal: Helpdesk can reset passwords but cannot create accounts.

- In ADUC, right-clicked the `HR_Department` OU and selected Delegate Control
- Delegated to the `Helpdesk` group: Reset user passwords and force password change at next logon
- Created a helpdesk user account, added it to the `Helpdesk` group, and tested the password reset
- Confirmed the helpdesk account could not create new user accounts

Outcome: Delegation configured. Least privilege verified: helpdesk has password reset rights only.

---

**Challenge 21: AD Backup (System State)**
Goal: System State backup completes successfully.

- Installed Windows Server Backup via Add Roles and Features > Features
- Scheduled a System State backup to a secondary VHD
- System State backup includes the AD database (`NTDS.dit`), SYSVOL, and the Registry
- Ran a manual backup: `wbadmin start systemstatebackup -backuptarget:D:`

Outcome: System State backup completed. AD database is recoverable in the event of a failure.

---

**Challenge 22: FSMO Roles**
Goal: Identify and explain all 5 FSMO roles.

- Ran `netdom query fsmo` to identify all 5 FSMO role holders
- Reviewed each role: Schema Master, Domain Naming Master, PDC Emulator, RID Master, Infrastructure Master
- Registered the AD Schema snap-in using `regsvr32 schmmgmt.dll` and opened it in MMC
- Documented which server holds each role

Outcome: All 5 FSMO roles identified. Understand the purpose of each role and the impact of one going offline.

---

**Challenge 23: Event Viewer and Security Auditing**
Goal: Audit user logon and lockout events using Event Viewer.

- Opened Event Viewer > Windows Logs > Security
- Filtered for Event ID `4625` (failed logon) and `4624` (successful logon)
- Filtered for Event ID `4740` (account lockout)
- Opened Applications and Services Logs > Microsoft > Windows > GroupPolicy to check for GPO processing errors

Outcome: Able to trace logon events, failed attempts, and account lockouts from Event Viewer.

---

**Challenge 24: Fine-Grained Password Policies**
Goal: Admins have stricter password requirements than standard users.

- Opened Active Directory Administrative Center (ADAC) on `WIN-DH9D3SPO213`
- Navigated to `tjserverlab (local)` > System > Password Settings Container
- Created a Password Settings Object (PSO) named `Admins-Policy` with precedence 1
- Set 16 character minimum length and lockout after 3 attempts, applied to `GRP-IT-Admins`
- Verified the PSO overrides the Default Domain Policy for members of `GRP-IT-Admins`

Outcome: Fine-grained password policy applied. Admin accounts now have stricter requirements than standard users.

---

**Challenge 25: AD Recycle Bin**
Goal: Deleted AD objects can be recovered without a full restore.

- Enabled the AD Recycle Bin:
  ```powershell
  Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target 'tjserverlab.local'
  ```
- Deleted a test user account in ADUC
- Restored the deleted object:
  ```powershell
  Get-ADObject -Filter {DisplayName -eq 'Test User'} -IncludeDeletedObjects | Restore-ADObject
  ```
- Verified the user reappeared in ADUC with all attributes intact

Outcome: AD Recycle Bin enabled and tested. Objects deleted by mistake are recoverable without DSRM or a backup restore.

---

**Challenge 26: Security Audit and Hardening**
Goal: Review and tighten the AD security posture.

- Ran `Get-ADUser -Filter {Enabled -eq $true -and PasswordNeverExpires -eq $true}` to identify accounts with non-expiring passwords
- Ran `Get-ADGroupMember -Identity 'Domain Admins'` to verify only named admin accounts are members
- Enabled audit policy via Default Domain Controllers Policy > Audit Account Logon Events = Success/Failure
- Reviewed the Security event log for logon failures on the DC

Outcome: Security review complete. Non-expiring password accounts identified, Domain Admins membership verified, audit logging enabled.

---

**Challenge 27: Final Challenge**
Goal: Build a complete AD environment from scratch with no reference material.

- Created a new department OU, user account, security group, and drive map GPO from memory
- Simulated a locked-out domain admin account and recovered access using DSRM mode
- Ran `dcdiag /test:all` and confirmed all checks passed
- Took a final Hyper-V Checkpoint: `Challenge 27 Complete`
- Wrote a lab summary covering what was built, what was learned, and what to study next

Outcome: Challenges complete. Fully functional Windows Server 2022 Active Directory domain built, broken, and fixed entirely hands-on.

---


