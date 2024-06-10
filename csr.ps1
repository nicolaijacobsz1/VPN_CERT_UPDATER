# Prompt for the computer name or use the environment variable
$computerName = Read-Host "Enter your computer name"
if (-not $computerName) {
    $computerName = $env:COMPUTERNAME
}

# Define variables
$organization = "domain name.corp"
$organizationalUnit = "IT"
$state = "Texas"
$locality = "Dallas"
$country = "US"
$dnsName = "$computerName.domain.corp"

# Create the CSR file content
$infContent = @"
[Version]
Signature="$Windows NT$"

[NewRequest]
Subject = "CN=$computerName,O=$organization,OU=$organizationalUnit,S=$state,L=$locality,C=$country"
KeySpec = 1
KeyLength = 2048
Exportable = TRUE
MachineKeySet = TRUE
SMIME = False
PrivateKeyArchive = FALSE
UserProtected = FALSE
UseExistingKeySet = FALSE
ProviderName = "Microsoft RSA SChannel Cryptographic Provider"
ProviderType = 12
RequestType = PKCS10
KeyUsage = 0xa0
HashAlgorithm = sha256
; SANs
[Extensions]
2.5.29.17 = "{text}"
_continue_ = "dns=$dnsName&"

[EnhancedKeyUsageExtension]
OID=1.3.6.1.5.5.7.3.1 ; Server Authentication
OID=1.3.6.1.5.5.7.3.2 ; Client Authentication

[RequestAttributes]
SAN="dns=$dnsName"
"@

#Saving the file
$infPath = "$env:TEMP\csrrequest.inf"
$infContent | Out-File -FilePath $infPath

#Generating the CSR
$csrPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "domain_CSR.csr")
certreq -new $infPath $csrPath

Write-Host "CSR generated and saved to $csrPath"
