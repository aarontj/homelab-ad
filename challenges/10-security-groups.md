### Challenge 10: Security Groups

**Goal:** Users are organised into correctly scoped security groups.

- Created Security Groups: `GRP-IT-Admins`, `GRP-HR`, `GRP-Finance`, `GRP-Marketing` (Global, Security type)
- Added users to their respective department groups
- Added `adm.` prefixed accounts to `GRP-IT-Admins`
- Reviewed Group Scope options: Domain Local vs Global vs Universal

---

```
tjserverlab.local
├── _Admin
│   └── Admin Groups
│       └── GRP-IT-Admins
│           ├── adm.j.hartley
│           └── adm.c.bennett
└── Groups
    ├── GRP-IT
    │   ├── j.hartley
    │   └── c.bennett
    ├── GRP-HR
    │   ├── p.nair
    │   └── d.walsh
    ├── GRP-Finance
    │   ├── s.marchetti
    │   └── t.beckett
    └── GRP-Marketing
        ├── l.kowalski
        └── a.bridges
```

---

### Steps Taken 

**Creating Security Groups**
1. Go into "AD Users and Computers"
2. Let's create `GRP-IT-Admins` security group within Admin Groups
3. Follow the folder path and right click Admin Groups
4. Click **New** > **Group**
<img src="https://github.com/user-attachments/assets/29807bac-570b-4c87-ab73-aa584090f998" width="1000" alt="Creating Security Group">

5. Fill in the fields and ensure that Group Scope is "Global" and Group type is "Security"
6. Now just follow the same steps for `GRP-HR`, `GRP-Finance`, `GRP-Marketing`, `GRP-IT`
<img src="https://github.com/user-attachments/assets/abcec85e-4668-4216-a820-4f6c79b33042" width="1000" alt="Security Groups">

---

**Adding Users to Security Groups**
1. Once all these security groups are created double click on the security group eg. `GRP-IT-Admins`
2. Find "Members"
3. Click "Add" then search for the users name eg. `adm.j.hartley` (you don't need to put the full name) then press **enter** to search
4. Click on the user then press **ok**
5. `adm.j.hartley` should now appear in the Members box
<img src="https://github.com/user-attachments/assets/3d036158-3d3f-49c1-810f-3e4d0de46539" width="1000" alt="Security Groups">

6. Now do this for all security groups created `GRP-HR`, `GRP-Finance`, `GRP-Marketing`, `GRP-IT`

---




