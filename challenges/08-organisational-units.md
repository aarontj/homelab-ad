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

<img src="https://github.com/user-attachments/assets/fca67094-2f0b-49f6-b613-e991f3a1e0a6" width="750" alt="OU">


5. Create the OU's `Staff`, `Workstations`, `Groups`, `_Admin`

<img src="https://github.com/user-attachments/assets/e4e898f8-b1ce-498e-a9d3-01e1142b552f" width="750" alt="OU">

6. Once those are created, right click on "Staff" OU and click **New** > **Organisational Units**
7. Created the following Sub-OU within "Staff": `Finance`, `HR`, `IT`, `Marketing`

<img src="https://github.com/user-attachments/assets/a1e80a06-16fc-4de9-9756-04c3728edb13" width="750" alt="Staff OU">

8. Follow the same steps as above but create `Admin Accounts` and `Admin Groups` inside of parent OU `_Admin`

<img src="https://github.com/user-attachments/assets/f44302f1-c691-4732-86e5-9f8401af78e7" width="750" alt="Admin Sub-Ou">

---








