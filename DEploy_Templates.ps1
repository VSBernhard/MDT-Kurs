$MdtBuildShare = "D:\CaptureShare"
$MdtDepShare = "D:\DeploymentShare"

Invoke-WebRequest -uri "https://raw.githubusercontent.com/Digressive/MDT-Files/master/MDT-Templates/Client-Build-Template.xml" -Outfile "$MdtBuildShare\Templates\Client-Build-Template.xml"

Invoke-WebRequest -uri "https://raw.githubusercontent.com/Digressive/MDT-Files/master/MDT-Templates/Client-Deploy-Template.xml" -Outfile "$MdtDepShare\Templates\Client-Deploy-Template.xml"