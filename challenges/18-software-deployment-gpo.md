### Challenge 18: Software Deployment via GPO

**Goal***: Software deployed to workstations via GPO without touching each machine manually.

- Downloaded the 7-Zip MSI installer
- Copied the MSI to `\\WIN-DH9D3SPO213\SYSVOL\tjserverlab.local\scripts\`
- Created GPO: `Software-Deploy-7Zip`, linked to the `Workstations` OU
- Configured Computer Configuration > Software Settings > Software Installation > New > Package
- Ran `gpupdate /force` on `PC1` and rebooted. Verified 7-Zip installed successfully.

---

**Overview**
Before starting this challenge i did abit more research on what `sysvol` folder is used for, this is where GPO's and logon scripts live.

In an enterprise environment, i would have a dedicated drive with a folder for software deployment. Companies would typically have multiple domain controllers set up with replication, this causes the MSI file to be replicated X amount between all DC's which will take up bandwidth and potentially cause issues.

But as for this lab challenge, i will follow the steps.

---

### Steps Taken

1. Download 7Zip MSI file on the domain controller
2. Move the file into the "sysvol sripts" folder, the path is `C:\Windows\SYSVOL\sysvol\Tjserverlab.local\scripts`

<img src="https://github.com/user-attachments/assets/190b5b1f-9e6b-4f44-8da3-84d45ec15e50" width="750" alt="7zip">

3. There is no requirement to set network share or ntfs permissions as the `sysvol` folder is pre-confirgured to allow users/ devices access this folder
4. Head to "Group Policy Management" and create a new GPO "Software-Deployed-7Zip"

<img src="https://github.com/user-attachments/assets/bd46e15a-912f-440f-a607-53fb859f6aeb" width="750" alt="GPO">

5. Link this GPO to `Workstations`

<img src="https://github.com/user-attachments/assets/c4b05c7c-cd03-4594-a268-f1fab8eef5a8" width="750" alt="Link">

6. Right click and "edit" the new GPO
7. Follow this path: "Computer Configuration" > "Policies" > "Software Settings" > "Software installation"

<img src="https://github.com/user-attachments/assets/5bd1a489-cf80-4dfc-a1e2-0c2c190f544d" width="750" alt="GPO path">

8. Now right click and click "New" > "Package"
9. Find the MSI file and click "open" to add it

<img src="https://github.com/user-attachments/assets/9c97993d-2b0e-456d-aba0-4ef42cdfb6a5" width="750" alt="Adding app">

10. Select "Assigned" for **Select deployment method**, then press "Ok"
11. Run `gpupdate /force` on both the server and client machine
12. When an user logs in and run `gpupdate /force` it will ask them to restart the device for this to take affect

<img src="https://github.com/user-attachments/assets/c9387bdf-69ef-4fab-8731-bb3c75e0c02f" width="750" alt="Gpupdate">

13. Restart the device and log back in, the device should now have `7-zip` installed

<img src="https://github.com/user-attachments/assets/0fe93119-a034-4cad-a736-dab02066b35c" width="750" alt="Installed">

---


