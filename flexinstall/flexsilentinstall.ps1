##getting current working directory of script
$flexinstallPath = Split-Path $MyInvocation.MyCommand.Definition
$msipath = $(Resolve-Path $flexinstallPathPath\FW*\Fieldworks\)
echo "installing FLEx"
msiexec.exe /i "$msipath\SetupFW.msi" /qn /L*V "$msipath\FLExpackage.log"

##extract msi to get access to flexbridge msi
msiexec /a "$msipath\SetupFW.msi" /qn TARGETDIR="$msipath\setupdir"