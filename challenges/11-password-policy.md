### Challenge 11: Password Policy

**Goal:** Default Domain Policy has a password policy configured and enforced.

- Opened Group Policy Management Console (GPMC)
- Edited the Default Domain Policy
- Configured under Computer Configuration > Windows Settings > Security Settings > Account Policies:
  - Minimum password length: 12 characters
  - Password complexity: Enabled
  - Maximum password age: 90 days
  - Account lockout threshold: 5 invalid attempts
- Ran `gpupdate /force` on the DC to apply immediately

---

### Steps Taken
1. Open Server Manager
2. Click "Tools" then click "Group Policy Mangement"
3. Click the drop down arrow on the domain forest
4. Expand "Group Policy Objects"
<img src="https://github.com/user-attachments/assets/64db70e6-02d7-4f5f-b2c0-1f4df692c26a" width="750" alt="GPO Default">

5. Right click on "Default Domain Policy" and click **Edit**
6. Follow the path Computer Configuration → Windows Settings → Security Settings → Account Policies until you find "Password Policy"
<img src="https://github.com/user-attachments/assets/97897fa3-17b7-42a9-ac18-9b9ad1c1905e" width="750" alt="GPO Password">

7. Edit the relevant policy as per the challenge
8. To create a "Lockout Policy" you will need to go back and find "Account Lockout Policy"
9. Edit the "Account lockout threshold" policy to "5"
<img src="https://github.com/user-attachments/assets/422fcbbf-93a6-4828-8e8d-5a4c0be004c9" width="750" alt="GPO Lockout">

10. Open CMD and run `gpupdate /force`
<img src="https://github.com/user-attachments/assets/3589a58e-df72-42eb-9d10-4b5b6de7aa9f" width="750" alt="GP Update">

---



