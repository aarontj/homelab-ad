### Challenge 16: Login Scripts and Drive Mapping

**Goal**: HR users get `H:` drive mapped automatically at login.

- On `WIN-DH9D3SPO213`, created a shared folder: `C:\Shares\HR` (share name: `HR$`)
- Set NTFS permissions: `HR-Users` group = Read/Write; Everyone = No Access
- Created GPO: `HR-Drive-Map`, linked to the `HR_Department` OU
- Configured User Configuration > Preferences > Windows Settings > Drive Maps
- Mapped `H:` to `\\WIN-DH9D3SPO213\HR$`


---
### Steps taken

**Creating Shares/HR folder and giving permissions**

1. Head to "file explorer" and go to "This PC"
2. Go to C: drive and create a "Shares" folder
3. Create another folder within called "HR"

<img src="https://github.com/user-attachments/assets/06ecc3f7-7add-4653-bfb7-2b69da942968" width="750" alt="HR Folder">

4. Right click to open "Properties" then click "Sharing"
5. Click on "Advanced Sharing" and click the "Share this folder box"
6. Type the name `HR$` the "$" is to make the HR folder hidden on the network

<img src="https://github.com/user-attachments/assets/2002ca25-aa01-474f-8702-60658a86dab9" width="750" alt="Advanced Share">

7. Press "Apply" as you exit out or it will not save the changes
8. Now click "Share..." in the box for "Network File and Folder Sharing" and add `GRP-HR`
9. Ensure that they have "Read/ Write" access and click save

<img src="https://github.com/user-attachments/assets/e9e3e54f-8ad0-4981-8136-1f868b09133d" width="750" alt="NTFS Permissions">

10. Dont forget to copy the network path `\\Win-dh9d3spo213\hr$`
11. Go back to "HR properties" and go into "Security"
12. Ensure that `GRP-HR` is there and permissions is: `Read & Execute/ List folder contents/ Read/ Write`

<img src="https://github.com/user-attachments/assets/21fe8a5e-d6eb-48aa-a8fd-47381f50eafa" width="750" alt="Share Folder">

**Setting up GPO**

1. Head to "Group Policy Management"
2. Create a new group policy `HR-Drive-Map` and link this to "HR" OU in `Staff`

<img src="https://github.com/user-attachments/assets/7ca2c3ff-b921-468c-af1d-c32befa2992b" width="750" alt="Link">

3. Edit the policy and follow this path: **User configuration** > **Preferences** > **Windows Settings** > **Drive Maps**
4. Create "New" and copy as follows:
 - Paste the folder location into location: `\\Win-dh9d3spo213\hr$`
 - Click on the Reconnect box
 - Add a label: HR
 - Set drive letter to H

<img src="https://github.com/user-attachments/assets/6755b618-875a-44a7-af1c-511c8fde063b" width="750" alt="GPO">

5. Click "Apply" and "Ok"
6. Run a `gpupdate /force` on both the server and the client machine

H: HR Drive should now appear when a HR staff logs in

<img src="https://github.com/user-attachments/assets/efc2bd03-4736-4d8a-bbd3-5fc2c00f7a11" width="750" alt="Mapped">

---


