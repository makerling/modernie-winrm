##getting current working directory of script
$msipath = $(Resolve-Path C:\vagrant\tools\FW*\Fieldworks\)
echo "installing FLEx"
msiexec.exe /i "$msipath\SetupFW.msi" /qn /L*V "$msipath\FLExpackage.log"
""
#echo "finished installing FLEx does log exist?"
##installing flexbridge
##extract msi to get access to flexbridge msi
msiexec /a "$msipath\SetupFW.msi" /qn TARGETDIR="$msipath\setupdir"
#echo "installing FLExBridge"
$flexbridgemsipath = $(Resolve-Path $msipath\setupdir\Program*\SIL\FieldWorks*\Installers\)
#not working: msiexec.exe /i "$flexbridgemsipath\FLExBridgeInstaller.msi" /qn /L*V "$msipath\FLExpackage2.log"
Copy-Item -Path $flexbridgemsipath\FLExBridgeInstaller.msi -Destination C:\Users\IEUser\Documents
echo "Finished Installing FLEx. If you need to use Send/Receive, please manually run the FLExBridgeInstaller.msi in the Documents folder"
