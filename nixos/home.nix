{
  config,
  pkgs,
  lib,
  ...
}:

{
  # =========================================================================
  # ===                       USER & HOME DEFINITIONS                      ===
  # =========================================================================
  home.username = "thatmechguy";
  home.homeDirectory = "/home/thatmechguy";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  # =========================================================================
  # ===                        TERMINAL: KITTY                             ===
  # =========================================================================
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      font_size = 11.0;
      window_padding_width = 12;
      background_opacity = 1.0;
      hide_window_decorations = "yes";

      cursor_shape = "beam";
      cursor_blink_interval = 1;
      cursor_trail = 100;

      scrollback_lines = 3000;

      copy_on_select = "yes";
      strip_trailing_spaces = "smart";

      tab_bar_style = "powerline";
      tab_bar_align = "left";
      linux_display_backend = "wayland";
    };
    keybindings = {
      "ctrl+plus" = "change_font_size all +1.0";
      "ctrl+minus" = "change_font_size all -1.0";
    };
    extraConfig = ''
      include themes/noctalia.conf
    '';
  };

  # ==================================================================
  # ===                       SERVICES                    ==========
  # ==================================================================
  services.udiskie = {
    enable = true;
    automount = true;
    tray = "auto";
    # notify = "true";
    settings = {
      program_options.file_manager = "nautilus";
    };
  };

  # =========================================================================
  # ===                         SHELL: ZSH & TOOLS                         ===
  # =========================================================================
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      fastfetch -c ~/.config/fastfetch/config.jsonc
    '';

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch";
      nix-switch = "sudo nixos-rebuild switch -I nixos-config=/home/thatmechguy/Hyprnix/nixos/configuration.nix";
      flake-switch = "sudo nixos-rebuild switch --flake /home/thatmechguy/Hyprnix/nixos#$(hostname)";
      flake-update = "sudo nix flake update --flake /home/thatmechguy/Hyprnix/nixos/";
    };

    history.size = 10000;
    history.path = "$HOME/.zsh_history";
    history.ignoreDups = true;
  };

  programs.atuin = {
    enable = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://api.atuin.sh";
      search_mode = "fuzzy";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # =========================================================================
  # ===                        TEXT EDITOR: HELIX                          ===
  # =========================================================================
  programs.helix = {
    enable = true;

    settings = {
      theme = "noctalia";
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = pkgs.lib.getExe pkgs.nixfmt;
          };
        }
      ];
    };
  };

  # =========================================================================
  # ===                        USER APPLICATIONS                           ===
  # =========================================================================
  programs.vesktop.enable = true;

  # =========================================================================
  # ===                        HOME PACKAGES LIST                          ===
  # =========================================================================
  home.packages = with pkgs; [
    adw-gtk3
    btop
    cura-appimage
    fastfetch
    gh
    git
    kdePackages.kdenlive
    kdePackages.qt6ct
    neovim
    nwg-look
    starship
    tree
    zed-editor
    libreoffice-fresh
    obsidian
    android-tools
    proton-pass

  ];
}
