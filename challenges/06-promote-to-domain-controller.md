### Challenge 6: Promote to Domain Controller

**Goal:** `lab.local` domain created and `lab-dc01` is the first Domain Controller.

- Clicked "Promote this server to a domain controller" from the Server Manager notification
- Selected Add a new forest with root domain name: `tjserverlab.local`
- Set Forest and Domain Functional Level to Windows Server 2016
- Set the DSRM (Directory Services Restore Mode) password and stored it securely
- Completed the wizard. Server rebooted automatically and came back as a Domain Controller.


---

### Steps Taken
I have decided to personalise my domain controller to `tjserverlab.local` rather than the suggested `lab.local`


Following the steps provided above:
1. Click on the yellow notification "Promote this server to a domain controller"

<img src="https://github.com/user-attachments/assets/a37d28fa-a19c-4446-9e22-e2d1597aaf41" width="750" alt="Promote DC">

2. Select "Add a new forest" then type in the domain name "tjserverlab.local"

<img src="https://github.com/user-attachments/assets/bf0d039c-2099-43bb-9135-93d3573cbcbb" width="750" alt="Forest Name">

3. Left Functional Level settings as **Windows Server 2016** and added my own DSRM Password

<img src="https://github.com/user-attachments/assets/87506c02-af73-4bc6-bbc8-b30be9e27bb0" width="750" alt="DSRM">

4. Continued next when "A delegation for this DNS server cannot be created because the authoritative parent zone cannot be found." pops up
5. Click next until you reach the Prerequisites Check section and then press Install

<img src="https://github.com/user-attachments/assets/166417be-87b1-4361-a23d-2264ff3dd72c" width="750" alt="Install">

6. Restart device when requested

---








