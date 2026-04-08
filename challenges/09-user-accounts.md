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

<img src="https://github.com/user-attachments/assets/ed6b2383-635c-4f9c-be86-731749abf1bd" width="750" alt="Creating User">

4. Hit **Next** and provide a temporary password and ensure that "User must change password at next logon" checkbox is ticked

<img src="https://github.com/user-attachments/assets/7847f11b-0efe-4c81-9b77-3a917056bfbe" width="750" alt="Password">

5. Follow these steps for all the other users in their respective SUB organisational units

---

#### All Users

**Finance**

<img src="https://github.com/user-attachments/assets/0a5b0a5f-c1eb-40fe-8f8a-5539e8395d4e" width="750" alt="Finance">

**HR**

<img src="https://github.com/user-attachments/assets/385877ff-68c1-4e7c-adae-679eead27a33" width="750" alt="HR">

**IT**

<img src="https://github.com/user-attachments/assets/612b6849-8b4e-42cc-b6dd-0fe44b0ff1fe" width="750" alt="IT">

**Marketing**

<img src="https://github.com/user-attachments/assets/dd6277df-27ef-4cf8-a4ed-af74f495cae9" width="750" alt="Marketing">

**Adm Users**

<img src="https://github.com/user-attachments/assets/be63b5e4-dd66-4364-9283-700140f2b425" width="750" alt="ADM Users">

---




