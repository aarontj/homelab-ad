### Challenge 9: Create User Accounts

**Goal:** 2 real-style user accounts in each department OUs.

- Created 2 user accounts placed in their respective OUs (e.g. `James Hartley` in `HR`)
- Set: First Name, Last Name, UPN (`j.hartley@lab.local`), logon name
- Enforced: **"User must change password at next logon"** for each account

---

#### Overview
The goal is to create these users and allocate them to their respectice department Sub-OU.

| User | Department |
|------|------------|
| James Hartley | IT |
| Chloe Bennett | IT |
| James Hartley | Admin Accounts |
| Chloe Bennett | Admin Accounts |
| Priya Nair | HR |
| Daniel Walsh | HR |
| Sofia Marchetti | Finance |
| Tom Beckett | Finance |
| Lena Kow | Marketing |
| Aaron Bridges | Marketing |


```
tjserverlab.local
├── .Admin
│       ├── Admin Accounts
│       ├── adm.j.hartley
│       └── adm.c.bennett
│
├── Staff
   ├── IT
   │   ├── j.hartley
   │   └── c.bennett
   ├── HR
   │   ├── p.nair
   │   └── d.walsh
   ├── Finance
   │   ├── s.marchetti
   │   └── t.beckett
   └── Marketing
       ├── l.kowalski
       └── a.bridges
```

---

### Steps Taken
1. Lets create James Hartley inside the IT Sub-Ou
2. Head to **Staff** > **IT** > **New** > **User**
3. Input their name accordingly in the fields while following the naming convention of first initial dot last name (e.g. j.hartley)

<img src="https://github.com/user-attachments/assets/1bcf6c94-b188-4148-805a-2632192f440c" width="750" alt="Creating User">

4. Hit **Next** and provide a temporary password and ensure that "User must change password at next logon" checkbox is ticked

<img src="https://github.com/user-attachments/assets/0a6688b6-01a0-4e82-afb3-cfd2b2d94e04" width="750" alt="Password">

5. Follow these steps for all the other users in their respective SUB organisational units

---

#### All Users
**Finance**

<img src="https://github.com/user-attachments/assets/7cac728a-efa2-4c0e-8733-72283dfeb962" width="750" alt="Finance">

**HR**

<img src="https://github.com/user-attachments/assets/81a498f2-3799-49be-adaa-391fbbb5729c" width="750" alt="HR">

**IT**

<img src="https://github.com/user-attachments/assets/33d0d941-dcee-4ea7-b331-024aa3e0416e" width="750" alt="IT">

**Marketing**

<img src="https://github.com/user-attachments/assets/d4730d29-765e-48ce-b1b4-794cc1191f47" width="750" alt="Marketing">

**Adm Users**

<img src="https://github.com/user-attachments/assets/278a9b31-5ec3-4910-a7f8-0f023d7d4194" width="750" alt="ADM Users">

---
