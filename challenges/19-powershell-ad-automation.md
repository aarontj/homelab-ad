# Challenge 19: PowerShell AD Automation

**Goal**: Create and manage AD objects using PowerShell only.

- Opened PowerShell as Administrator on `TJSERVER`
- Ran `Import-Module ActiveDirectory`
- Bulk-created 10 users using a script with `New-ADUser`, targeting specific OUs with department and title attributes
- Listed all locked accounts using `Search-ADAccount -LockedOut`
- Unlocked a test account using `Unlock-ADAccount -Identity username`

---
## Overview

This was probably the most difficult challenge so far. I attempted this challenge without the assistance of AI. While I did not use AI to create the script, I used a few resources and one of which had a template that I had to adjust to meet the challenge requirements.

---

### Resources

**New-ADUser**
https://learn.microsoft.com/en-us/powershell/module/activedirectory/new-aduser?view=windowsserver2025-ps

**Set-ADAccountPassword**
https://learn.microsoft.com/en-us/powershell/module/activedirectory/set-adaccountpassword?view=windowsserver2025-ps

**CSV & Script for bulk users**
https://www.alitajran.com/create-active-directory-users-from-csv-with-powershell/#h-create-the-csv-template

---

## Part 1: Creating a Single User

In this section I was figuring out all the different syntax I needed for this challenge. The challenge requires **OU**, **Department** and **Title** attributes on the user account.

These were the attributes I came up with:

`-Name` — How AD identifies the user

`-GivenName` — First Name

`-Surname` — Last Name

`-SamAccountName` — Login username

`-UserPrincipalName` — Login username with domain suffix

`-DisplayName` — Name shown at login and on the Start menu

`-Title` — Title

`-Department` — Department

`-Path` — The OU this user belongs to

`-AccountPassword` — Sets the account password on creation

`-Enabled` — Enables the account immediately

The user I wanted to create was:

**Name**: Charles Smith
**Login**: c.smith
**Title**: Manager
**Department**: Finance
**Path**: Staff > Finance

```powershell
New-ADUser -Name "Charles Smith" -GivenName "Charles" -Surname "Smith" -SamAccountName "c.smith" -UserPrincipalName "c.smith@tjserverlab.local" -DisplayName "Charles Smith" -Title "Manager" -Department "Finance" -Path "OU=Finance,OU=Staff,DC=Tjserverlab,DC=local" -AccountPassword (ConvertTo-SecureString -AsPlainText "#Testpowershell123" -Force) -Enabled $true
```

This successfully created the user "Charles Smith" in the `Staff/Finance` OU.

<img src="https://github.com/user-attachments/assets/ab3c0dd7-547d-470e-a686-543ae27b65a7" width="750" alt="Charlie Created">

**Logged In**

<img src="https://github.com/user-attachments/assets/6f39b3b7-1868-449a-a1f5-0f2bc3056e82" width="750" alt="Charlie Loggin">


### Issues Encountered

**Account created as disabled**

The initial command didn't include `-Enabled $true` so the account was created disabled which can be seen from the down arrow on the account. Fixed by adding `-Enabled $true`.

<img src="https://github.com/user-attachments/assets/496be74d-f7d0-49c4-9614-56e1b02f472f" width="750" alt="Disabled">

**Password did not meet policy requirements**

The test password `#Password1` was rejected because it didn't meet the 12 character minimum length policy that was configured in Challenge 12. This still created the user which caused a conflict when I tried running the command again after updating the password it said "Account already exists". Had to delete the account and re-run with a password that meets the minimum requirement.

<img src="https://github.com/user-attachments/assets/8150d252-7004-49df-932c-468d7b609549" width="750" alt="Password too short">

**Display name showing login name on Start menu**

After logging in as Charles Smith, the Start menu was showing `c.smith` instead of the full name. I compared his profile with another user and realised `-DisplayName` was missing from the script. Added `-DisplayName "Charles Smith"` to fix this.

<img src="https://github.com/user-attachments/assets/6117dabd-d57c-48e2-90b7-d4b35dd6c0c8" width="750" alt="no display name">

---

## Part 2: Bulk User Creation

I researched around and found a blog by Ali Tajran who provided a guide on using a CSV with a PowerShell script. Reading through his guide I found that it was customisable and I just needed to set my own requirements.

### Creating the CSV

The fields I needed were:

**firstname** | **surname** | **sam** | **department** | **title** | **password**

The heading names are important but can be adjusted in the script as long as you understand where the script is pulling the data from. To simplify this challenge all the users are going into a new OU called "Bulk"

### Creating folder in DC for CSV file

I created a folder within C: drive of the domain controller called scripts to store the **CSV** file, the path to this folder is: C:\scripts

<img src="https://github.com/user-attachments/assets/d1d3f3dd-1516-4008-8bcb-75b629d2a50e" width="750" alt="Folder">

### Script Modification
This script was modified from the blog to fit the requirements of the challenge however, I have kept `ChangePasswordAtLogon = $True` as i want these Users to change password upon logging in for the first time.

The following changes were made:

- Updated the CSV path from C:\temp\NewUsersFinal.csv to C:\scripts\newbulk.csv
- Removed the -Delimiter ";"
- Changed the UPN from exoip.com to tjserverlab.local
- Updated parameters to match the CSV column headings (sam, surname, organization) and removed fields not required such as City, Country, OfficePhone, and EmailAddress

### Running the Script

The bulk creation script is stored separately in the scripts folder:

[`scripts/powershell/bulk-create-users.ps1`](../scripts/powershell/bulk-create-users.ps1)

[`scripts/powershell/newbulk.csv`](../scripts/powershell/newbulk.csv)

  
**PowerShell output showing users created and in their OU**

<img src="https://github.com/user-attachments/assets/f14f2040-8c18-4330-9a1c-3e89c5790d0c" width="750" alt="Powershell Bulk Script">


---

## Part 3: Account Management

**Listing all locked accounts:**

```powershell
Search-ADAccount -LockedOut
```
When i first ran this command there was no accounts that appeared as locked out, so i purposely incorrectly typed in the password for "Ava Martin" 5 times so that it locked her account.

<img src="https://github.com/user-attachments/assets/717f0d98-ff2d-4c94-a083-46028c13cc1c" width="750" alt="Locked Windows">

Running the command again now shows that "Ava Martin" is locked.

<img src="https://github.com/user-attachments/assets/d50d80ab-d675-434c-8b30-83aa7c6a362e" width="750" alt="Locked Powershell">


**Unlocking a specific account:**

```powershell
Unlock-ADAccount -Identity "a.martin"
```
After running the unlock command, "Ava Martin" no longer appears as locked when using the search locked accounts command `Search-ADAccount -LockedOut` and i was able to log in again.

<img src="https://github.com/user-attachments/assets/c215397b-8bb8-41de-804b-a02ef8aad165" width="750" alt="Unlocked">

<img src="https://github.com/user-attachments/assets/81b37d41-ab9a-4154-ae8c-2386850568b2" width="750" alt="Logged back in">


---
