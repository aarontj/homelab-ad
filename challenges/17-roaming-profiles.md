### Challenge 17: Roaming Profiles

**Goal**: User profile follows them across domain computers.

- On `WIN-DH9D3SPO213`, created a shared folder: `C:\Profiles` (share name: `Profiles$`)
- Granted Domain Users the Change permission on the share
- In ADUC, opened a user > Profile tab > set Profile path to `\\WIN-DH9D3SPO213\Profiles$\%username%`
- Logged into `PC1` as that user and verified a profile folder was created on the server

---

### Steps taken

**Setting up the folder & permissions**
1. Click on "File and Storage Services" then select "Shares"

<img src="https://github.com/user-attachments/assets/234059fd-dbec-4ee5-a560-7e08aa4b346f" width="750" alt="File Share">

2. Click the "Tasks" drop down then select "New Share..."
3. Select "SMB Share - Quick" and ensure that the correct server and drive is selected before going to the next section

<img src="https://github.com/user-attachments/assets/4078c30a-5524-46f8-aed9-907a6b170ad1" width="750" alt="SMB">

<img src="https://github.com/user-attachments/assets/5bc1a3dd-e4f3-4420-a09b-d55edc42b86c" width="750" alt="Path">

4. Type `Profiles$` in "Share Name" 

<img src="https://github.com/user-attachments/assets/c363d9c0-44cd-4006-92a1-d8e1838e6a91" width="750" alt="Name">

5. Untick "Allow caching of share" and tick "Enable access-based enumeration"

<img src="https://github.com/user-attachments/assets/9834e08c-4f58-456d-a7f9-2a307b52a07e" width="750" alt="Name">

6. On the "Permissions" page, click "Customize permissions..."
7. Select "Disable inheritance" then select "Convert inherited permissions into explicit permission on this object"
8. Remove permissions to "Users" and add "Domain Users"

<img src="https://github.com/user-attachments/assets/e68b6618-af36-4f2f-b940-01e737834bf0" width="750" alt="ntfs">

9. Apply these settings to "Domain Users": **Applies to:** This Folder and tick **List folder / read data**/ **Create folders / append data** in "Advanced permissions"

<img src="https://github.com/user-attachments/assets/a2f98600-2991-4488-952b-18f1472bcb90" width="750" alt="domain users">

10. Press "OK" and "Create"

<img src="https://github.com/user-attachments/assets/73e85c4f-22db-4add-8974-42490a4f896e" width="750" alt="create">

11. Find the folder and copy the network address `\\WIN-DH9D3SPO213\Profiles$`

**Setting up Roaming Profiles**
1. On "Server Manager" head to "AD Users and Computers"
2. Find a user eg. `Tom Beckett` in `Staff/ Finance`

<img src="https://github.com/user-attachments/assets/34f3e64e-9dd2-424e-8149-bdcca53468b" width="750" alt="user">

3. Click on the profile then seelct the "Profile" section
4. Paste the network address `\\WIN-DH9D3SPO213\Profiles$\%username%` in "Profile Path", `%username%` is used so that it automatically inputs the username

<img src="https://github.com/user-attachments/assets/cdb4ff29-90c4-40d0-ad69-f93a6d01eaed" width="750" alt="path">

5. Click "Apply"
6. When `Tom Beckett` logs in, their profile will automatically pop up in the `Profiles$` folder

<img src="https://github.com/user-attachments/assets/dab334f9-12d9-41b4-b333-a6d740f13c30" width="750" alt="success">

---


