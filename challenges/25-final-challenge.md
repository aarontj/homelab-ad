### Challenge 25: Final Challenge

Goal: Build a complete AD environment from scratch with no reference material.

- Created a new department OU, user account, security group, and drive map GPO from memory
- Booted into DSRM to simulate emergency DC recovery access, demonstrated how to bypass domain authentication when AD is unavailable or broken
- Took a final Hyper-V Checkpoint: `Challenge 25 Complete`
- Wrote a lab summary covering what was built, what was learned, and what to study next

---
### Overview

I have decided to do the first 2 parts of the checklist as a video as i wanted to change it up as i have been typing up the challenges up until this point. Also this is proof that i did this without cheating 😁

👆 Click on the **Thumbnail** to get redirected to the youtube video! 

---
### Part 1 - Created a new department OU, user account, security group, and drive map GPO from memory

One thing I forgot to mention in this video. Back in **Challenge 15**, I had to create a GPO that disabled **Control Panel** and set a **wallpaper**. The issue I ran into was that the User Configuration settings weren't applying because the GPO was linked to the **Workstations OU**, not the **Users OU** where the user accounts actually lived. This meant the wallpaper setting wasn't being applied to users at all. To fix this I enabled **Loopback Processing**, initially set to **Replace** mode, however the GPO still wasn't showing up when running `gpresult`. Switching it to **Merge** mode fixed the issue, which combines the User Configuration settings from both the computer's OU and the user's OU, and that's what finally got the wallpaper applying correctly.

[![Alt text](https://img.youtube.com/vi/7re2VPYeW7A/0.jpg)](https://www.youtube.com/watch?v=7re2VPYeW7A)

---

### Part 2 - Booted into DSRM to simulate emergency DC recovery access, demonstrated how to bypass domain authentication when AD is unavailable or broken

[![Alt text](https://img.youtube.com/vi/M45Lo2EgTrA/0.jpg)](https://www.youtube.com/watch?v=M45Lo2EgTrA)

---

### Final Checkpoint 

<img src="https://github.com/user-attachments/assets/e60e6db2-65c8-4709-a2fe-3c68f443214c" width="750" alt="Final checkpoint">



