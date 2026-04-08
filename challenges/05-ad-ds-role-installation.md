#### Challenge 5: AD DS Role Installation
**Goal:** Active Directory Domain Services and DNS roles installed successfully.

- Opened Server Manager > Add Roles and Features
- Selected Active Directory Domain Services & DNS Server
- Completed the installation wizard and waited for the full install to finish before closing
- Confirmed the yellow notification flag appeared in Server Manager post-install

---

#### Steps Taken
1. Open Server Manager and click on Manage
2. Click on Add Roles and Features

**Add Roles and Features**
<img src="https://github.com/user-attachments/assets/af52caa8-c94a-40ea-b39b-0c406f33412a" width="1000" alt="Add Roles">

3. Click next then select Role-based or feature based installation
4. Select the "Computer" that you want to assign as a Server

**Select Server**
<img src="https://github.com/user-attachments/assets/62e781e9-cfcd-43b5-b3ea-d89b8e4a83fe" width="1000" alt="Add Roles">

5. Cick next and choose **Active Directory Domain Services** and **DNS Server**

**Select DS and DNS**
<img src="https://github.com/user-attachments/assets/887f8225-ec80-4003-86c9-2d0745bc7247" width="1000" alt="Add Roles">

6. Click install or next and this will start the install

**Installing DS & DNS**
<img src="https://github.com/user-attachments/assets/cb1936a6-eb78-4082-be8f-75315421a19d" width="1000" alt="Add Roles">

7. Once it has completed there will be a yellow notification at the top of Server Mangger asking to Promote to DC (Did not take a screen shot of this)

**Promote this Server**
<img src="https://github.com/user-attachments/assets/0cc024b8-82b7-442b-8062-16d7977619d5" width="1000" alt="Promote DC">

---

