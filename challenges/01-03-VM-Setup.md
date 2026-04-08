### I have combined Challenge 1 - 3 as i completed all of these in the same day.

---

#### Challenge 1 — Orientation
**Goal:** Hyper-V Manager is open and ready on the host machine.

- Reviewed Windows Server 2022 system requirements
- Downloaded the Windows Server 2022 Evaluation ISO from Microsoft Eval Center
- Enabled the Hyper-V feature via **Control Panel → Programs → Turn Windows features on/off**
- Opened Hyper-V Manager and confirmed it was functional on the host

---

#### Challenge 2 — VM Creation
**Goal:** VM boots to the Windows Server 2022 setup screen.

- Created a new VM in Hyper-V Manager with: 4 GB RAM, 2 vCPUs, 60 GB dynamic VHD
- Attached the Windows Server 2022 ISO to the virtual DVD drive
- Booted the VM and confirmed it reached the Windows Server 2022 installation wizard

---

#### Challenge 3 — OS Installation
**Goal:** Server is fully patched and sitting at the desktop.

- Completed Windows Server 2022 Standard (Desktop Experience) installation
- Set a strong Administrator password and stored it securely
- Ran Windows Update and installed all critical patches
- Installed Hyper-V Integration Services when prompted

---

### Overview
What drew me to starting this homelab is learning Windows Server/ Active Directory.

I was looking at different virtual machines that i can kick start this journey and thats when i stumbled upon Hyper-V, which is free for users who is running Windows 11 Pro.

While deciding on which Windows Server version to choose, i found that Windows Server 2022 Eval was free for 180 days which is perfect for my use case.

The requirements for Windows Server 2022 is 1.4Ghz x64 CPU, 2GB Ram (to have GUI) and 32GB storage.

My personal computer is sufficiently spec'd to have Windows Server and a Client running without issues.

I have years of experience building pc's so i didn't think about documenting on how to install an operating system.

---

### Steps Taken 

**Enable Hyper-V**
1. Look for "Turn Windows features on or off" in the search bar
2. Tick Hyper-V and let it download and install
<img src="https://github.com/user-attachments/assets/bfc6d65d-4cad-4ff3-9a47-60d21d4f0a49" width="750" alt="Windows On or Off">

3. Restart desktop when requested

---

**Creating VM & OS Install - VM has already been setup but this would be the steps**
1. Download Windows Server 2022 EVAL ISO from Microsoft
2. On Hyper-V click **New** > **Virtual Machine**
3. Name: ServerLab > Generation 2 > Startup Memory: 4096 MB > Connection: No Connection
4. Choose "Create a virtual hard disk", for location i have decided to put it my E: drive and Size is 60GB
**Hyper V Specs**
<img src="https://github.com/user-attachments/assets/2add102d-9d5c-40a2-80b2-5f82cce6c96a" width="750" alt="Hyper-V VM Specifications">

6. Click next and select "Install an operating system from a bootable image file" 
7. Locate the ISO file and press next
8. Double click the new VM and press start and follow the steps to install Windows Server 2022 with GUI
<img src="https://github.com/user-attachments/assets/1e2e118d-d14c-4ba6-8d80-7656e1c1e310" width="750" alt="Hyper V Server VM">

9. Once booted into Windows, run Windows Update and allow the device to restart when required

Sucessfully created a VM with Windows Server 2022 installed
<img src="https://github.com/user-attachments/assets/96af2b2e-baa0-43ee-99e3-b9abacd0ab7d" width="750" alt="Windows Server Booted">

---




