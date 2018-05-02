# -*- mode: ruby -*-
# vi: set ft=ruby :

##
# If you copy this file, dont't delete this comment.
# This Vagrantfile was created by Daniel Menezes:
#   https://github.com/danielmenezesbr/modernie-winrm
#   E-mail: danielmenezes at gmail dot com
##

##
# Version: 0.0.4
## Currently takes 13:16 minutes to provision
##


require_relative 'ie-box-automation-plugin.rb'


Vagrant.configure("2") do |config|

  # WIN7 - IE11
  #config.vm.box = "microsoft.ie/ie11.win7"
  #config.vm.box_url = "file://IE11 - Win7.box"
  
  # Windows 10 Stable - MS Edge
  config.vm.box = "microsoft.ie/msedge.win10stable"
  #config.vm.box_url = "file://MSEdge - Win10_stable_downloaded_4-20-2018_16.16299.box"
  config.vm.box_url = "file://MSEdge - Win10_stable.box"  
  
  config.vm.boot_timeout = 5000

  config.vm.guest = :windows

  config.vm.communicator = :winrm       if provisioned?
  config.winrm.username = "IEUser"      if provisioned?
  config.winrm.password = "Passw0rd!"   if provisioned?
  config.winrm.timeout = 50000          if provisioned?
  config.winrm.retry_delay = 30         if provisioned?
  config.winrm.retry_limit = 1000       if provisioned?
  

  config.ssh.username = "IEUser"
  config.ssh.password = "Passw0rd!"
  config.ssh.insert_key = false
  config.vbguest.auto_update = false

  config.vm.box_check_update = false

  config.vm.synced_folder ".", "/vagrant", disabled: true                     if not provisioned?
  config.vm.synced_folder "./sharedfolder", "c:/sharedfolder	", create: false    if provisioned?

  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true

     # Customize the amount of memory on the VM:
     vb.memory = "4048"
  end


  config.vm.provision "file", source: "./tools/7z.exe", destination: "c:/users/IEUser/7z.exe"		if not provisioned?
  config.vm.provision "file", source: "./tools/7z.dll", destination: "c:/users/IEUser/7z.dll"		if not provisioned?
  config.vm.provision "file", source: "./tools/tools.zip", destination: "c:/users/IEUser/tools.zip"	if not provisioned?
  config.vm.provision "winrm", type: "ie_box_automation"											if not provisioned?
  #after reboot:
  #config.vm.provision :shell, path: "./shell/main.cmd", run: "always"
  #config.vm.provision :shell, path: "./shell/InstallBoxStarter.bat", run: "always" 
  #flex install
  config.vm.provision :shell, path: "./shell/flexsilentinstall.cmd", run: "always" 
end
