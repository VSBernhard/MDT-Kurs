﻿# Convert a Windows 10 WIM file to VHDX file using Convert-WindowsImage.ps1 fork from https://github.com/nerdile/convert-windowsimage 
$WimFile = "C:\WIM\REFW10-X64-21H2-Enterprise.wim"
$Edition = "Windows 10 Enterprise"
$OutPutVHDXFile = "C:\VHDsV2\AP-W10-21H2.vhdx"

# Create UEFI-based VHDX file
C:\Lab\Convert-WindowsImage.ps1 -SourcePath $WimFile -Edition $Edition -VHDPath $OutPutVHDXFile -VHDFormat VHDX -VHDType Dynamic -VHDPartitionStyle GPT -SizeBytes 240GB


# Convert a Windows 11 21H2 WIM file to VHDX file using Convert-WindowsImage.ps1 fork from https://github.com/nerdile/convert-windowsimage 
$WimFile = "C:\WIM\REFW11-X64-21H2-Enterprise.wim"
$Edition = "Windows 11 Enterprise"
$OutPutVHDXFile = "C:\VHDsV2\AP-W11-21H2.vhdx"

# Create UEFI-based VHDX file
C:\Setup\Scripts\Convert-WindowsImage.ps1 -SourcePath $WimFile -Edition $Edition -VHDPath $OutPutVHDXFile -VHDFormat VHDX -VHDType Dynamic -VHDPartitionStyle GPT -SizeBytes 240GB


# Convert a Windows 11 22H2 WIM file to VHDX file using Convert-WindowsImage.ps1 fork from https://github.com/nerdile/convert-windowsimage 
$WimFile = "C:\WIM\REFW11-X64-22H2-Enterprise.wim"
$Edition = "Windows 11 Enterprise"
$OutPutVHDXFile = "C:\VHDs\AP-W11-22H2.vhdx"

# Create UEFI-based VHDX file
C:\Setup\Scripts\Convert-WindowsImage.ps1 -SourcePath $WimFile -Edition $Edition -VHDPath $OutPutVHDXFile -VHDFormat VHDX -VHDType Dynamic -VHDPartitionStyle GPT -SizeBytes 240GB

# Convert a Windows Server 2022 WIM file to VHDX file using Convert-WindowsImage.ps1 fork from https://github.com/nerdile/convert-windowsimage 
$WimFile = "C:\WIM\WindowsServer2022Standard.wim"
$Edition = "Windows Server 2022 Standard (Desktopdarstellung)"
$OutPutVHDXFile = "C:\Wim\Master_Server2022.vhdx"

# Create UEFI-based VHDX file
C:\Lab\Convert-WindowsImage.ps1 -SourcePath $WimFile -Edition $Edition -VHDPath $OutPutVHDXFile -VHDFormat VHDX -VHDType Dynamic -VHDPartitionStyle GPT -SizeBytes 240GB
