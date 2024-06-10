# PowerShell script to automate the installation of a .p7b certificate file

# Load Windows Forms and drawing assemblies for OpenFileDialog
Add-Type -AssemblyName System.Windows.Forms

function Get-CertificateFile {
    $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $fileDialog.initialDirectory = [System.Environment]::GetFolderPath("Desktop")
    $fileDialog.filter = "Certificate files (*.p7b)|*.p7b"
    $fileDialog.ShowDialog() | Out-Null
    return $fileDialog.FileName
}

# Show an OpenFileDialog to let the user select the .p7b certificate file
$certificatePath = Get-CertificateFile

if (-not $certificatePath) {
    Write-Host "No file selected. Exiting script."
    exit
}

# Define the certificate store location
$certStoreLocation = "Cert:\LocalMachine\My"

# Import the certificate
try {
    $cert = Import-Certificate -FilePath $certificatePath -CertStoreLocation $certStoreLocation
    Write-Host "Certificate imported successfully into $certStoreLocation"
} catch {
    Write-Host "An error occurred during the certificate import: $_"
}
