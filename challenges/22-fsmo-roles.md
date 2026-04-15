## Challenge 22: FSMO Roles

**Goal**: Identify and explain all 5 FSMO roles.

- Ran `netdom query fsmo` to identify all 5 FSMO role holders
- Reviewed each role: Schema Master, Domain Naming Master, PDC Emulator, RID Master, Infrastructure Master
- Registered the AD Schema snap-in using `regsvr32 schmmgmt.dll` and opened it in MMC
- Documented which server holds each role

---

### FSMO Roles 

There are **5 FSMO** roles, **Schema Master**/ **Domain Naming Master**/ **RID Master**/ **PDC Emulator**/ **Infrastruture Master**.

Some of these roles are forest-level roles, while others are domain level.

<img src="https://github.com/user-attachments/assets/d0fe5816-a6c8-4016-b784-b7b831011fa0" width="750" alt="FSMO">

The **Schema Master** & **Domain Naming Master** are both **Forest-Level** meaning that there can only be one of each in the whole **Forest**, while there are one **RID Master**/ **PDC Emulator**/ **Infrastruccture Master** per domain.

There can be multiple domains in each **Forest** as per the diagram below:

<img src="https://github.com/user-attachments/assets/fb1b2410-2a44-4344-9c2b-894de8734bd3" width="750" alt="Multi domain">

---

### Schema Master 
What information you can store for user accounts or computers eg.

**User**
- Username
- Email Address
- Address Details
- Telephone Number
- Password

**Computer**
- Name of system
- The domain joined
- Account details
- Network details

Its essentially stores pre made templates and extra information when you install new software.

---

### Domain Naming Master 
Ensures that you do not create a second domain in the same forest with the same name eg.

DC1: tjserverlab.local 
DC2: tjserverlab.local

This role can be utilised for renaming the domain or moving the domain within the forest.

---
### RID Master (Relative Identifier Master) 
Assigns SID Value for every object created in AD. Essentially a unique code (not repeated within the same **forest** that identifies each object within AD. 

This role is responsible for moving objects from one domain to another within a forest.

---
### PDC Emulator (Primary Domain Controller Emulator)**
Responsible for authenticaation requests, changing passwords & managing GPO. Used to synchronise time with all devices with their preferred DC.

---

### Infrastructure Master
There is 1 infrastructure master in each domain/ per forest. 

Used to update group membership, if you make any changes to a group this role will update it to all other DC about the changes.

Require for multi-domain environemnt.

Responsible for updating SID & DN (Distinguished name) in cross domain object

---
### Running `netdom query fsmo` 

Running `netdom query fsmo` to identify all 5 FSMO roles and holders.

<img src="https://github.com/user-attachments/assets/a7c64a30-93af-44d3-8807-32481b2bb876" width="750" alt="CMD">

As there is only 1 domain `tjserverlab.local` within this forest, all FSMO roles are within the same dc/ domain.

---

### Running `regsvr32 schmmgmt.dll`

Running `regsvr32 schmmgmt.dll` to register the Active Directory Snap in

<img src="https://github.com/user-attachments/assets/a9d0afd2-e5ba-4d03-b785-3405507a9d85" width="750" alt="register">

Adding **Active Directory Schema** snap into MMC (Microsoft Management Console)

<img src="https://github.com/user-attachments/assets/725b60fb-d51a-4d4b-9709-9a70576cde40" width="750" alt="Adding snapin">

Inside of the **Class Schema**

<img src="https://github.com/user-attachments/assets/079b1e10-1e79-4f15-8b25-697b995e4909" width="750" alt="Class Schema">

---



