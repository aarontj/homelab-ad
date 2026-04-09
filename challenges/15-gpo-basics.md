### Challenge 15: GPO Basics
**Goal**: First custom GPO applied to workstations.

- Created a new GPO named `Workstation-Baseline` and link it to the `Workstations` OU
- Configured: Disable Control Panel access for standard users
- Configured: Set desktop wallpaper to a solid colour
- On `PC1`: ran `gpupdate /force` then `gpresult /r` to verify the policy applied

---

### Disabling Control Panel - GPO

This setting is within **User Configuration**, this is key information to take note as we will soon face an issue when following the challenge.

1. Open "Group Policy Management"
2. Expand the forest and right click on "Group Policy Object"
3. Click "New" and name this `Workstation-Baseline`

<img src="https://github.com/user-attachments/assets/505f150e-e06b-41f7-90f4-20c8c96d7ae7" width="750" alt="Workstation-Baseline">

4. Right click "Workstations" OU and choose "Link an Existing GPO"
5. Choose `Workstation-Baseline`

<img src="https://github.com/user-attachments/assets/a88dd879-b539-4302-b338-59f8674e43fc" width="750" alt="Link">

6. Go back to the `Workstation-Baseline` GPO we just created and click "edit" 
7. Follow this path **User Configuration** > **Administrative Template** > **Control Panel** 
8. Click into "Prohibit access to Control Panel and PC settings" and enable this group policy


<img src="https://github.com/user-attachments/assets/39e4e37a-0524-43d3-9714-9bfc691161d7" width="750" alt="Disable control panel">

9. Run `gpupdate /force` on the server
10. Logged in using `j.beckett` but control panel was still working


This was the road block i encountered, i was stumped and looked through my configurations to make sure it was correct. "Authenticated Users" is there in the GP and everything is linked. Checked with `gpresult /r` and `Workstation-Baseline` did not appear under "Applied GPO". Restarted the device, tried different user and ran `gpupdate /force` which still did not work. 

<img src="https://github.com/user-attachments/assets/efb6f459-845e-45df-a613-0b7477149286" width="750" alt="gpresult fail">

Upon further research, the reason it did not work was because this GP is a "User Configuration" and it was linked to the "Workstations" OU. The user would also need to be in "Workstation" OU for this to work.

---
### The solution

I had 2 options, either i linked this GPO to the "Staff" OU or i enable "Configure user group policy loopback processing mode".

"Configure user group policy loopback processing mode" has 2 options
- **Merge**: This option essentially loads the user ou policies then applies the user policies from the computer's ou
- **Replace**: Ignores all user ou policies and only applies user policies from the computer's ou

In this situation the challenge asked me to configure this GPO to the "Workstation" OU, so the solution would be to enable "Configure user group policy loopback processing mode - Replace". 

This applies it to all the "computers" in that computer ou, if i wanted to apply it to an user and this GPO follows them to any computer they use then i would link it to "Staff" OU.

### Enabling "Configure user group policy loopback processing mode - Replace"

1. Edit `Workstation-Baseline`

2. Follow this path **Computer Configurations** > **Administrative Template** > **System** > **Group Policy**
3. Click into "Configure user group policy loopback processing mode"
4. Choose "Enable" and Mode: "Replaced"

<img src="https://github.com/user-attachments/assets/2792fdb9-4e74-43fb-b707-701d445863cd" width="750" alt="loopback">

5. Run `gpupdate /force` on the server and client

---
### Set Desktop Wall Paper

Setting a solid colour for a wallpaper is the same steps as setting a custom one, so have decided to use a custom wallpaper of a **Server Room**.

This is a 2 step process as we will need to create a folder which users can access (required for the wallpaper GPO to work) and configure the GPO.

**Setting up folder**

1. Head to "file explorer" and go to "This PC"
2. Go to C: drive and create a "Wallpaper" folder
3. Paste your image of choice and remember the name and file format eg. `data.jpg`


<img src="https://github.com/user-attachments/assets/8d0ee21f-4978-4b55-be10-5020646a784b" width="750" alt="photo">

4. Right click to open "Properties" then click "Sharing"
5. Click on "Advanced Sharing" and click the "Share this folder box"
6. Type the name `Wallpaper$` the "$" is to make the wallpaper folder hidden
7. Click "Add" then click on "permissions", ensure that "everyone" have read only access

<img src="https://github.com/user-attachments/assets/a36720cc-143d-4f0c-b7f6-dbf04967c101" width="750" alt="advancedpermission">

9. Ensure to press "Apply" as you exit out or it will not save the changes
10. Now click "Share..." in the box for "Network File and Folder Sharing" and ensure that "Everyone" only have "Read" access

<img src="https://github.com/user-attachments/assets/0898cb95-67ae-458d-803d-53db69cd5d4a" width="750" alt="share">

11. Now click "Share" at the bottom
12. Dont forget to copy the network path `\\WIN-DH9D3SPO213\Wallpaper$`
13. Go back to "Wallpaper properties" and go into "Security"
14. Ensure that "Everyone" permissions is: `Read & Execute/ List folder contents/Read`
<img src="https://github.com/user-attachments/assets/15306b27-acfe-4881-99de-d9b1e43bdeec" width="750" alt="ntfs">


**Setting up GPO**

1. Go back to the `Workstation-Baseline` GPO and click "edit"
2. Follow this path **User Configuration** > **Administrative Template** > Expand **Desktop**
3. Double click "Desktop Wallpaper" > select "Enable"
4. Paste the network path where it says "Wallpaper Name" and add the filename.jpg eg. `\\WIN-DH9D3SPO213\Wallpaper$\data.jpg`

<img src="https://github.com/user-attachments/assets/2325ce57-195a-4e69-b33d-0e64732f5588" width="750" alt="wallpaper">


5. Hit "apply" and run a `gpupdate /force` on the server and client
6. You will need to sign out of the client vm and sign back in for this to take affect

<img src="https://github.com/user-attachments/assets/6e73ef67-b582-4cae-b458-b1c409b89684" width="750" alt="wallpaperclient">

---

