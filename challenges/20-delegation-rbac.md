### Challenge 20: Delegation of Control and RBAC

**Goal**: Helpdesk can reset passwords but cannot create accounts.

- In ADUC, right-clicked the `HR` OU and selected Delegate Control
- Delegated to the `GRP-IT-Admins` group: Reset user passwords and force password change at next logon
- Created a IT/ helpdesk user account, added it to the `GRP-IT-Admins` group, and tested the password reset
- Confirmed the GRP-IT-Admins account could not create new user accounts

---

### Delegating GRP-IT-Admins to reset "HR" user passwords

1. Head to "AD Users and Computer"
2. Find "HR" under "staff" OU
3. Right click "HR" and delegate control

<img src="https://github.com/user-attachments/assets/f4f880d2-757c-4abf-9c10-4b4aa9a8821f" width="750" alt="Delegate">


4. Add "GRP-IT-Admins" then go "Next"
5. Select "Reset user passwords and force password change at next logon"

<img src="https://github.com/user-attachments/assets/fcb8d579-364c-47f7-bd52-a84993135cc8" width="750" alt="Reset">

6. Click "Next" then "Finish"

---

### Creating new User & Link to GRP-IT-Admins
The user i have created is "Aaron Tjhin", i created an admin account `adm.a.tjhin` and a normal user account `a.tjhin`. The reason i created a separate `admm.a.tjhin` account is so that it is specifally used for tasks like logging into the DC, managing AD. The regular account `a.tjhin` is used for normal use as a standard user.

The idea behind is, if the regualr account gets compromised (phised, malware etc) the attacker does not automatically have admin privileges.

I will only show creating `adm.a.tjhin` as it is the same but without `adm.`, not linked to `GRP-IT-Admins` and it is in the standard `IT` OU.

1. Head to "AD Users and Computer"
2. Explan `_admin` > `Admin Accounts`
3. Right click in the blank space and create new user
4. Fill in the details

<img src="https://github.com/user-attachments/assets/a5562d5b-2466-4ad0-85b4-d8ef3cf765d6" width="750" alt="NewAcc">

5. After creating the account, go into `Admin Groups` and open `GRP-IT-ADMINS`
6. Click on "Members" tab then click "Add"
7. Look for `adm.a.tjhin` then add user

<img src="https://github.com/user-attachments/assets/9271383a-c2a8-4040-800e-f1c09a306b7d" width="750" alt="Addtogroup">

---

### Troubleshooting
When trying to log in as `adm.a.tjhin` on the domain controller, it kept giving an error "The sign-in method you’re trying to use isn’t allowed. For more info, contact your network administrator".

<img src="https://github.com/user-attachments/assets/7ca4c04f-b9fa-4c12-b89b-b34f4eec95f0" width="750" alt="Error">


After researching abit on google, i found that  `GRP-IT-Admins` needs to be added to "Allow Log on locally" in "Default Domain Controllers Policy".

**To fix this**:

1. Edit "Default Domain Controllers Policy"
2. Follow this path: "Computer Configuration" > "Policies" > "Windows Settings" > "Security Settings" > "Local Policies" > "User Rights Assignment" > "Allow log on locally"

<img src="https://github.com/user-attachments/assets/25dce779-a310-4a2b-8a7e-1a23787b7803" width="750" alt="Fix">

3. Open this policy and add "GRP-IT-Admins", apply this and run `gpupdate /force` on the domain controller
4. Now try log in again

---


### Testing Access & Reset password

**Attempting to reset a finance user password**

<img src="https://github.com/user-attachments/assets/38d18613-d3b9-4d0d-82ab-9ffd5f73248a" width="750" alt="Reset finance">

**Resetting a HR user password**

<img src="https://github.com/user-attachments/assets/e3201138-c4e2-401d-90f2-e3be358ee02d" width="750" alt="Reset HR">

**Attempting to create new user**

<img src="https://github.com/user-attachments/assets/dac5042b-75aa-4b85-844f-3a9aaec2721b" width="750" alt="Create User">


---
   
