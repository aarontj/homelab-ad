### Challenge 8: Organisational Units and Structure

**Goal**: OU structure mimicing a real company hierarchy.

- In ADUC, right-clicked `tjserverlab.local` > New > Organizational Unit
- Created top-level OUs: `Staff`, `Workstations`, `Groups`, `_Admin`
- Inside `Staff`, created sub-OUs: `Finance`, `HR`, `IT`, `Marketing`
- OUs are containers used for applying Group Policy and delegating admin control

---

### Overview
In this section i wanted to create different Organisational Units to mimic a small busienss with users from different departments.

```
tjserverlab.local
├── _Admin
├── Staff
│   ├── IT
│   │   ├── j.hartley
│   │   └── c.bennett
│   ├── HR
│   │   ├── p.nair
│   │   └── d.walsh
│   ├── Finance
│   │   ├── s.marchetti
│   │   └── t.beckett
│   └── Marketing
│       ├── l.kowalski
│       └── a.bridges
├── Groups
└── Workstations

```

### Steps Taken
1. Open "Server Manager"
2. Click on Tools then "AD Users and Computers"
3. Expand the forest "Tjserverlab.local"
4. Right click the forest and click **New** > **Organisational Units**

<img src="https://github.com/user-attachments/assets/f993282b-c80e-476e-a793-258da3591e7b" width="750" alt="OU">


5. Create the OU's `Staff`, `Workstations`, `Groups`, `_Admin`

<img src="https://github.com/user-attachments/assets/7b0f34e7-7132-4d65-96e1-137501959b70" width="750" alt="OU">

6. Once those are created, right click on "Staff" OU and click **New** > **Organisational Units**
7. Created the following Sub-OU within "Staff": `Finance`, `HR`, `IT`, `Marketing`

<img src="https://github.com/user-attachments/assets/112f9173-3278-40ed-9b92-59e4a057c542" width="750" alt="Staff OU">

8. Follow the same steps as above but create `Admin Accounts` and `Admin Groups` inside of parent OU `_Admin`

<img src="https://github.com/user-attachments/assets/b0e5e5f6-fd15-46d8-87f4-5f4e5844fdb4" width="750" alt="Admin Sub-Ou">

---






