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
<img src="https://github.com/user-attachments/assets/dcb09efc-709d-4aa8-8c98-f0e8f6ec199f" width="750" alt="GPO Default">

5. Right click on "Default Domain Policy" and click **Edit**
6. Follow the path Computer Configuration → Windows Settings → Security Settings → Account Policies until you find "Password Policy"
<img src="https://github.com/user-attachments/assets/0ad81caa-417a-4c7e-89af-29ede7656ab6" width="750" alt="GPO Password">

7. Edit the relevant policy as per the challenge
8. To create a "Lockout Policy" you will need to go back and find "Account Lockout Policy"
9. Edit the "Account lockout threshold" policy to "5"
<img src="https://github.com/user-attachments/assets/024a5a7e-eff9-46b4-8681-ace4b7e78e9a" width="750" alt="GPO Lockout">

10. Open CMD and run `gpupdate /force`
<img src="https://github.com/user-attachments/assets/6a046477-ce7e-4060-9905-a0b1a1ea6451" width="750" alt="GP Update">

---


