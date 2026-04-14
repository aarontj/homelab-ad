### Challenge 21: AD Backup (System State)

**Goal**: System State backup completes successfully.

- Installed Windows Server Backup via Add Roles and Features > Features
- Scheduled a System State backup to a secondary VHD
- System State backup includes the AD database (`NTDS.dit`), SYSVOL, and the Registry
- Ran a manual backup: `wbadmin start systemstatebackup -backuptarget:D:` - 

---

### Installing "Windows Server Backup"

1. Head to "Add roles and features wizard"
2. Choose "Role-based or feature based"

<img src="https://github.com/user-attachments/assets/244fda13-c06c-4858-9528-cb10edff42f3" width="750" alt="Role based">

3. Select the server

<img src="https://github.com/user-attachments/assets/5474b65c-6386-4e63-80ab-825d046ff214" width="750" alt="Sever">

4. Press **Next** until you reach "Features"
5. Select "Windows Server Backup" then press install

<img src="https://github.com/user-attachments/assets/e9a2536d-1c82-4911-9f15-3fa692c7ea40" width="750" alt="Windows Server">

---

### Setting up a seperate drive

1. Right click the domain controller vm
2. Head to "settings"
3. Click on "SCSI Controller" > "Hard Drive" > "Add"

<img src="https://github.com/user-attachments/assets/4af1e644-8ad2-4f48-8f04-2a28d23e2e76" width="750" alt="Add">

4. Click "New" and select "Fixed Size"
5. Name the drive "Backup" and choose location
6. Pick the size eg. `15GB`

<img src="https://github.com/user-attachments/assets/eaa43f51-88b0-41f0-bc21-6b2caebd30b2" width="750" alt="Size">

7. The drive should now appear on "SCSI", then click "apply" to save
8. Now log into the domain controller
9. Search for "Disk Management"
10. Look for the new disk `DIsk 1`, turn it online if it was offline
11. Right click the disk and select "Initialize" > choose "GPT" and press ok

<img src="https://github.com/user-attachments/assets/99c5f5d1-bbdf-4e9d-a5ed-c7fa6388a095" width="750" alt="Initialize">

12. Right click where it says "Unallocated" > select "New Simple Volume"
13. Choose the drive letter eg `F:`, keep pressing next until you see "Volume Label" 
14. Renamne this to "Backup" then keep going next until the drive becomes a partition

<img src="https://github.com/user-attachments/assets/66ee3324-0cb4-4090-a81f-da7f12e09a46" width="750" alt="Name drive">

---

### Backing up

I did not end up running the command to run the backup, i instead backed up by using Windows Server Backup GUI.

1. Open "Windows Server Backup"
2. Click "Local Backup" then click "Backup once" on the right hand side

<img src="https://github.com/user-attachments/assets/9b72e7bc-0f7a-4d96-8f5d-3e7a32e191a0" width="750" alt="Local backup">

3. Leave the option as "Different options" then click "next"
4. Choose "custom" then go "next"
5. Select "add items" and choose "system state"

<img src="https://github.com/user-attachments/assets/4dfd3e2b-9734-4f05-8bbe-08210a64cf0e" width="750" alt="System state">

6. Click next then choose "Local Drives" > select `Backup (F:)`

<img src="https://github.com/user-attachments/assets/b099efbd-a2bc-487f-a67e-133c77f1ecfd" width="750" alt="Select drive">

7. Click "Backup" and let it run until it completes

<img src="https://github.com/user-attachments/assets/d566c6f1-1051-4efb-b663-e2fba3ec8fcb" width="750" alt="Complete">
---
