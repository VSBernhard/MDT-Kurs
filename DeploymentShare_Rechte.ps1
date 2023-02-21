
# Check for elevation
Write-Host "Checking for elevation"
 
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "Oupps, you need to run this script from an elevated PowerShell prompt!`nPlease start the PowerShell prompt as an Administrator and re-run the script."
    Write-Warning "Aborting script..."
    Break
}
 
# Configure NTFS Permissions for the MDT Build Lab deployment share
$DeploymentShareNTFS = "D:\DeploymentShare"
icacls $DeploymentShareNTFS /grant '"Benutzer":(OI)(CI)(RX)'
icacls $DeploymentShareNTFS /grant '"Administratoren":(OI)(CI)(F)'
icacls $DeploymentShareNTFS /grant '"SYSTEM":(OI)(CI)(F)'
icacls "$DeploymentShareNTFS\Captures" /grant '"SCHULE\installPC":(OI)(CI)(M)'
 
# Configure Sharing Permissions for the MDT Build Lab deployment share
$DeploymentShare = "DeploymentShare$"
Grant-SmbShareAccess -Name $DeploymentShare -AccountName "JEDER" -AccessRight Change -Force
Revoke-SmbShareAccess -Name $DeploymentShare -AccountName "ERSTELLER-BESITZER" -Force



# Configure NTFS Permissions for the MDT Build Lab deployment share
$DeploymentShareNTFS = "D:\CaptureShare"
icacls $DeploymentShareNTFS /grant '"Benutzer":(OI)(CI)(RX)'
icacls $DeploymentShareNTFS /grant '"Administratoren":(OI)(CI)(F)'
icacls $DeploymentShareNTFS /grant '"SYSTEM":(OI)(CI)(F)'
icacls "$DeploymentShareNTFS\Captures" /grant '"SCHULE\installPC":(OI)(CI)(M)'
 
# Configure Sharing Permissions for the MDT Build Lab deployment share
$DeploymentShare = "CaptureShare$"
Grant-SmbShareAccess -Name $DeploymentShare -AccountName "JEDER" -AccessRight Change -Force
Revoke-SmbShareAccess -Name $DeploymentShare -AccountName "ERSTELLER-BESITZER" -Force
