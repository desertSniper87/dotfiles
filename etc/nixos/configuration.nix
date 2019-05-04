# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  #Set your time zone.
  time.timeZone = "Asia/Dhaka";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  
  networking.networkmanager.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  environment.pathsToLink = [ "/libexec/"];


  services.xserver = {
	enable = true;
	layout = "us";
	xkbOptions = "caps:swapescape";
        # xkbVariant = "probhat";

	displayManager.gdm.enable = false;
	displayManager.slim.enable = false;
	displayManager.sddm.enable = false;


	desktopManager = {
	      default = "none";
	      xterm.enable = false;
        };

	windowManager.i3 = {
	      enable = true;
	      extraPackages = with pkgs; [
		rofi 
		i3lock #default i3 screen locker
		i3blocks #if you are planning on using i3blocks over i3status
	      ];
	};
      
  };

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;
  
  # programs.sway.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.torsho = {
    createHome = true;
    group = "users";
    home = "/home/torsho";
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" "sway" ];
    uid = 1000;
  };

  systemd.user.services."urxvtd" = {
    enable = true;
    description = "rxvt unicode daemon";
    wantedBy = [ "default.target" ];
    path = [ pkgs.rxvt_unicode ];
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStart = "${pkgs.rxvt_unicode}/bin/urxvtd -q -o";
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

  environment.systemPackages = (with pkgs; [
  firefox
  git
  bash
  htop 
  vimHugeX
  wget
  which
  wpa_supplicant
  wayland
  i3
  i3status
  rofi
  sway
  gnome3.gdm
  gnome3.gedit
  gnome3.gnome-terminal
  dropbox
  st
  #sakura
  #rxvt_unicode
  #rxvt_unicode-with-plugins
  #urxvt_vtwheel
  #urxvt_perl
  #urxvt_perls
  gnome3.nautilus
  jetbrains.idea-ultimate
  google-chrome
  libsForQt5.vlc
  ntfs3g
  spotify
  i3blocks
  jdk11
  keepass
  xsel
  ]);

  
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;

    pulseaudio = true;

    packageOverrides = _pkgs: {
    # take the set of all packages and
    # return a set of modified packages
    vimHugeX = _pkgs.vimHugeX.override {
      python = _pkgs.python3; 
      };
    };
  };
}
