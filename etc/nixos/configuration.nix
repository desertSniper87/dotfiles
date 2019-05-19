# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # home-manager.users.torsho = { ... };

  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "nixos-laptop"; # Define your hostname.
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
  services.upower.enable = true;

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
    layout = "us, bd";
    xkbOptions = "caps:swapescape, grp:shifts_toggle";
    xkbVariant = " ,probhat";

    libinput ={
      enable = true;
    };

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


  # programs.sway.enable = true;
  programs.ssh.startAgent = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.torsho = {
    createHome = true;
    group = "users";
    home = "/home/torsho";
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" "sway" ];
    uid = 1000;
    shell = pkgs.zsh;
  };


  #environment.variables = {
  #  antigen = [ "${pkgs.antigen}/share/antigen/antigen.zsh" ];
  #};


  programs.zsh = {
    enable = true;
      # shellAliases = {};
      enableCompletion = true;
      promptInit = "source ${pkgs.zsh-powerlevel9k}/share/zsh-powerlevel9k/powerlevel9k.zsh-theme";

      interactiveShellInit = ''

        HISTFILE=~/.histfile
        HISTSIZE=1000
        SAVEHIST=1000
        zstyle :compinstall filename '/home/torsho/.zshrc'

        autoload -Uz compinit
        compinit

        source ${pkgs.antigen}/share/antigen/antigen.zsh
        export PATH="$PATH:$HOME/.rvm/bin"
        export PATH="$PATH:/usr/local/lib/python3.6"
        export MYPYPATH="/home/torsho/Dropbox/programming_code/github_projects/dev-tools/mypy-django"

        antigen use oh-my-zsh
        antigen bundle git
        antigen bundle heroku
        antigen bundle pip
        antigen bundle lein
        antigen bundle command-not-found
        antigen bundle archlinux
        antigen bundle battery
        antigen bundle colored-man-pages
        antigen bundle virtualenv
        antigen bundle thefuck
        antigen bundle popstas/zsh-command-time
        antigen bundle zsh-autosuggestions
        antigen bundle zsh-history-substring-search
        antigen bundle zsh-users/zsh-syntax-highlighting

        source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
        # source ${pkgs.zsh-powerlevel9k}/share/zsh-powerlevel9k/powerlevel9k.zsh-theme
        source ${pkgs.autojump}/share/autojump/autojump.zsh

        # Load the theme.
        #antigen theme robbyrussell
        #antigen theme agnoster
        #antigen theme amuse
        #antigen theme clean
        #antigen theme af-magic

        ZSH_THEME="powerlevel9k"
        POWERLEVEL9K_BATTERY_ICON='BAT'
        #POWERLEVEL9K_PROMPT_ON_NEWLINE=true
        POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery time)
        POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
        #POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right


        # Tell Antigen that you're done.
        antigen apply

        # Aliases
        alias python=python3.6
        alias pip=pip3

        alias pbcopy='xclip -selection clipboard'
        alias pbpaste='xclip -selection clipboard -o'

        function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

      '';
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
    qutebrowser
    google-chrome

    git
    bash
    htop 
    # vimHugeX
    (import ./vim.nix)
    zathura
    wget
    which
    wpa_supplicant
    wayland
    i3
    i3status
    rofi
    # sway
    lm_sensors
    upower
    iw

    gnome3.gdm
    gnome3.gedit
    gnome3.gnome-terminal
    dropbox

    st
    #sakura
    rxvt_unicode-with-plugins
    urxvt_vtwheel
    urxvt_perls
    xfontsel

    networkmanagerapplet

    gnome3.nautilus
    ranger

    #python37
    (python37.withPackages(ps: with ps; [
      pip setuptools virtualenv virtualenvwrapper pygame
      pudb powerline 
    ]))

    zsh
    antigen
    nix-zsh-completions
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-powerlevel9k

    autojump
    thefuck

    jetbrains.idea-ultimate
    jetbrains.pycharm-professional	
    jetbrains.clion	

    gcc
    gnumake
    cmake
    boost
    llvmPackages.clang-unwrapped
    llvmPackages.llvm

    libsForQt5.vlc
    mpv
    ntfs3g
    spotify
    playerctl
    i3blocks
    jdk11
    keepass
    xsel
    qemu
    tightvnc
    tigervnc
    qbittorrent
    jmtpfs
    # aqemu

    texlive.combined.scheme-full
    texstudio

    nmap
]);

fonts = {
  enableFontDir = true;
  enableGhostscriptFonts = true;


  fonts = with pkgs; [
    anonymousPro
    corefonts
    dejavu_fonts
    dina-font
    fira-code
    fira-code-symbols
    freefont_ttf
    google-fonts
    inconsolata
    liberation_ttf
    mplus-outline-fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    powerline-fonts
    profont
    proggyfonts
    source-code-pro
    terminus_font
    ttf_bitstream_vera
    ubuntu_font_family

    lohit-fonts.bengali
  ];
};

nixpkgs.config = {
  allowUnfree = true;
  allowBroken = true;

  pulseaudio = true;

  packageOverrides = _pkgs: {
    # take the set of all packages and
    # return a set of modified packages
    #vimHugeX = _pkgs.vimHugeX.override {
      #python = _pkgs.python3; 
    #};
  };
};
}
