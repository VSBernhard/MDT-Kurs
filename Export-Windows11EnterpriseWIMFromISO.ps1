# Script to extract the Windows 11 Enterprise index from a Windows 11 media.
# Update line 5 - 8 to match your environment

# General parameteers
$ISO = "C:\Users\Bernhard\OneDrive - WinXPerts4all\ISOs\Windows Server\Server 2022\SW_DVD9_Win_Server_STD_CORE_2022_2108.17_64Bit_German_DC_STD_MLF_X23-35661.ISO" # Path to Windows 11 media
$WIMPath = "C:\WIM" # Target folder for extracted WIM file containing Windows 11 Enterprise only
$WIMFile = "$WIMPath\WindowsServer2022Standard.wim" # Exported WIM File
$Edition = "Windows Server 2022 Standard (Desktopdarstellung)" # Edition to export. Note: If using Evaluation Media, use: Windows 11 Enterprise Evaluation 

# Goal is to have a single index WIM File, so checking if target WIM File exist, and abort if it does.
If (Test-path $WIMFile){
    Write-Warning "WIM File: $WimFile does already exist. Rename or delete the file, then try again. Aborting..."
    Break 
}

# ISO Validationc
If (-not (Test-path $ISO)){
    Write-Warning "ISO File: $ISO does not exist, aborting..."
    Break 
}

# Mount ISO
Mount-DiskImage -ImagePath $ISO | Out-Null
$ISOImage = Get-DiskImage -ImagePath $ISO | Get-Volume
$ISODrive = [string]$ISOImage.DriveLetter+":"

# Source WIM validation
$SourceWIMFile = "$ISODrive\sources\install.wim"
If (-not (Get-WindowsImage -ImagePath $SourceWIMFile | Where-Object {$_.ImageName -ilike "*$($Edition)"})){
    Write-Warning "WIM Edition: $Edition does not exist in WIM: $SourceWIMFile, aborting..."
    Dismount-DiskImage -ImagePath $ISO | Out-Null
    Break
}

# Export WIM
If (!(Test-path $WIMPath)){ New-Item -Path $WIMPath -ItemType Directory -Force | Out-Null } # Create folder if needed
Export-WindowsImage -SourceImagePath $SourceWIMFile -SourceName $Edition -DestinationImagePath $WIMFile

# Dismount ISO
Dismount-DiskImage -ImagePath $ISO | Out-Null
