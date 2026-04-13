# Bulk Active Directory User Creation Script
# Description: Imports users from CSV and creates AD accounts with attributes such as department, title, and OU path.

Import-Module ActiveDirectory

# Store the data from CSV
$ADUsers = Import-Csv "C:\scripts\newbulk.csv"

# Define UPN
$UPN = "tjserverlab.local"

# Loop through each row
foreach ($User in $ADUsers) {
    try {
        # Define the parameters using a hashtable
        $UserParams = @{
            SamAccountName        = $User.sam
            UserPrincipalName     = "$($User.sam)@$UPN"
            Name                  = "$($User.firstname) $($User.surname)"
            GivenName             = $User.firstname
            Surname               = $User.surname
            Enabled               = $True
            DisplayName           = "$($User.firstname) $($User.surname)"
            Path                  = $User.organization   
            Title                 = $User.title
            Department            = $User.department
            AccountPassword       = (ConvertTo-SecureString $User.password -AsPlainText -Force)
            ChangePasswordAtLogon = $True
        }

        # Check to see if the user already exists in AD
        if (Get-ADUser -Filter "SamAccountName -eq '$($User.sam)'") {

            Write-Host "A user with username $($User.sam) already exists in Active Directory." -ForegroundColor Yellow
        }
        else {
            # User does not exist then proceed to create the new user account
            # Account will be created in the OU provided by the $User.ou variable read from the CSV file
            New-ADUser @UserParams
            
            # If user is created, show message.
            Write-Host "The user $($User.sam) is created." -ForegroundColor Green
        }
    }
    catch {
        # Handle any errors that occur during account creation
        Write-Host "Failed to create user $($User.sam) - $_" -ForegroundColor Red
    }
}
