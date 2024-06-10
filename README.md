

# CSR Generation Script

## Overview
This PowerShell script automates the creation of a Certificate Signing Request (CSR) for computers within domain Corporation's IT department. The script prompts for the computer's name, sets various organizational parameters, and generates a CSR file with specified cryptographic properties.

## Requirements
- **PowerShell 5.1 or higher**
- **Administrative privileges** (may be required depending on the system's configuration and execution policy)

## Usage

1. **Open PowerShell:**
   - Right-click on PowerShell and select "Run as Administrator" if administrative privileges are required.

2. **Execute the Script:**
   - Navigate to the folder containing the script and run it by typing:
     ```powershell
     .\CSR.ps1
     ```
     Replace `scriptName.ps1` with the actual script filename.

3. **Provide Computer Name:**
   - When prompted, enter the name of the computer for which you are generating the CSR. If no name is provided, the script will use the name stored in the `COMPUTERNAME` environment variable.

## Script Actions

1. **Computer Name:**
   - Prompts the user for the computer's name or retrieves it from the environment variable if not provided.

2. **Variable Definition:**
   - Sets variables for the organization, organizational unit, location, and DNS name.

3. **CSR File Content Creation:**
   - Constructs the contents of the INF file required to generate the CSR, incorporating the previously set variables.

4. **File Saving:**
   - Saves the INF content to a temporary file on the system.

5. **CSR Generation:**
   - Uses the `certreq` command to generate the CSR, saving it to the user's desktop.

6. **Completion Notification:**
   - Informs the user that the CSR has been generated and provides the file path.

## Output
The script generates a CSR file named `domain_CSR.csr` and saves it to the desktop. This file is then used to request a certificate from a Certificate Authority (CA).

## Modification and Customization
To adapt the script for different organizational units or domains, modify the variable definitions (`$organization`, `$organizationalUnit`, etc.) at the beginning of the script.

## Support
For any issues or questions regarding the script, please contact your IT department or the script maintainer.

---

# Certificate Import Script

## Overview
This PowerShell script automates the process of importing a `.p7b` certificate file into the Local Machine's Personal store on a Windows system. It provides a graphical interface to select the certificate file, eliminating the need for manual file path entry.

## Requirements
- **Windows PowerShell 5.1 or higher**
- **Administrative privileges** (to import certificates into the Local Machine store)

## Usage

1. **Run PowerShell as Administrator:**
   - Right-click on PowerShell and select "Run as Administrator" to ensure the script has the necessary permissions.

2. **Execute the Script:**
   - Navigate to the directory containing the script and run it by typing:
     ```powershell
     .\import.ps1
     ```

3. **Select the Certificate File:**
   - A Windows Explorer dialog will appear. Navigate to and select the `.p7b` certificate file you wish to import.

4. **Import Confirmation:**
   - After selecting the file, the script will import the certificate and confirm successful importation or display an error message if the import fails.

## Script Actions

1. **File Selection Dialog:**
   - Opens a dialog box for the user to select the `.p7b` certificate file.

2. **Certificate Import:**
   - Imports the selected `.p7b` certificate into the Local Machine's Personal certificate store.

3. **Error Handling:**
   - Provides feedback if any errors occur during the import process.

## Output
The script will confirm the successful import of the certificate into the specified store or notify the user of any issues encountered during the process.

## Customization
To modify the script for different certificate types or store locations, you can adjust the filter in the `Get-CertificateFile` function or the `$certStoreLocation` variable.

## Support
For issues or questions related to this script, please refer to your IT department or the script maintainer.
