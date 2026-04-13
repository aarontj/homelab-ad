# Bulk Active Directory User Creation Script
# Author: Aaron Tjhin
# Description: Imports users from CSV and creates AD accounts with attributes such as department, title, and OU path.

Import-Module ActiveDirectory

# Store the data from CSV
$ADUsers = Import-Csv "C:\scripts\newbulk.csv"

# Define UPN
$UPN = "tjserverlab.local"

# Loop through each row
foreach ($User in $ADUsers) {
    try {
        # Define parameters (fixed)
        $UserParams = @{
            SamAccountName        = $User.sam
            UserPrincipalName     = "$($User.sam)@$UPN"
            Name                  = "$($User.firstname) $($User.surname)"
            GivenName             = $User.firstname
            Surname               = $User.surname
            Enabled               = $True
            DisplayName           = "$($User.firstname) $($User.surname)"
            Path                  = $User.organization   # fixed typo
            Title                 = $User.title
            Department            = $User.department
            AccountPassword       = (ConvertTo-SecureString $User.password -AsPlainText -Force)
            ChangePasswordAtLogon = $True
        }

        # Check if user exists (fixed field name)
        if (Get-ADUser -Filter "SamAccountName -eq '$($User.sam)'" -ErrorAction SilentlyContinue) {

            Write-Host "A user with username $($User.sam) already exists in Active Directory." -ForegroundColor Yellow
        }
        else {
            # Create user
            New-ADUser @UserParams

            Write-Host "The user $($User.sam) is created." -ForegroundColor Green
        }
    }
    catch {
        Write-Host "Failed to create user $($User.sam) - $_" -ForegroundColor Red
    }
}
