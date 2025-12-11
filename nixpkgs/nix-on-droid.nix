{ config, lib, pkgs, ... }:

{
  # This is the configuration module for nix-on-droid.
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    vim # or some other editor, e.g. nano or neovim
    openssh
    rclone


    helix
    ripgrep
    fish
    gawk
    tmux
    curl
    iproute2
    nettools
    devenv
    gnumake
    uv
    nodejs
    rustup
    gcc
    openssl
    sqlite
    perl
    pkg-config
    git
    github-cli
    fzf
    jq
    pandoc
    gnuplot
    graphviz
    gettext # envsubst - macro processing with env vars
    dstask # task manager - TODO: change
    cod # completion server
    elvish
    nnn

    imagemagick
    potrace
    

    # python312
    # (python312Packages.matplotlib)
    (python312.withPackages (ps: with ps; [ 
    uv
    pip
    pipenv
    matplotlib
    ipython
    numpy
    pandas
    weasyprint
    codebraid
    ]))

    # optional shit
    vivid

    # Some common stuff that people expect to have
    procps
    which
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
  ];



  # programs.fish.enable = true;
  # users.defaultUserShell = pkgs.fish; #
  # programs.fish.enable = true;
  # environment.shell = pkgs.fish;

  # user.shell = "${pkgs.fish}/bin/fish";

  environment.sessionVariables = rec { 
    PATH = ["$PATH" "$HOME/.cargo/bin" "$HOME/.node/bin" "$HOME/.local/bin"];
    LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
  };
  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  # time.timeZone = "Asia/Ubud";

  # After installing home-manager channel like
  #   nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
  #   nix-channel --update
  # you can configure home-manager in here like
  home-manager = {
    useGlobalPkgs = true;
  
    config =
      { config, lib, pkgs, ... }:
      {
        # Read the changelog before changing this value
        home.stateVersion = "24.05";
  
        # insert home-manager config
      };
  };
}


# vim: ft=nix
