{ config, pkgs, ...}:
{
  home.username = "linh";
  home.homeDirectory = "/home/linh";
  home.stateVersion = "26.11";

  #umbriel & noctalia-shell
  imports = [];

  programs.umbriel = {
    enable = true;
    settings = ''
      [general]
      autostart = ["xwayland-satellite", "noctalia"]
      xwayland = true

      [appearance]
      prefer_no_csd = true

      [layout]
      mode = "scrolling"
      gap = 8
      width_presets = [0.33, 0.5, 0.66, 1.0]

      [input.keyboard]
      layout = "us"

      [[window_rule]]
      match.app_id = "org.wezfurlong.wezterm"
      opacity = 0.75

      [keybinds]
        #commonly user keys
          "Mod+T" = "spawn:wezterm"
          "Mod+Q" = "window-close"
          "Mod+E" = "session-quit"
          "Mod+D" = "spawn:noctalia msg panel-toggle launcher"
          "Mod+C" = "workspace-set-layout:toggle"
          "Ctrl+E" = "spawn:wezterm start -- yazi"
          "Mod+Return" = "spawn:wezterm start -- hx"
          "Alt+Q" = {action = "spawn:noctalia msg panel-toggle-session", repeat = false }
        #work spaceq control key
          "Alt+Left" = "window-focus-left"
          "Alt+Right" = "window-focus-right"
          "Alt+Up" = "window-focus-up"
          "Alt+Down" = "window-focus-down"          
          "Ctrl+Left" = "window-move-or-output-left"
          "Ctrl+Right" = "window-move-or-output-right"
          "Ctrl+Up" = "window-move-or-output-up"
          "Ctrl+Down" = "window-move-or-output-down"          
    '';
  };
  
  programs.noctalia = {
    enable = true;
    settings = {};
  };

  programs.wezterm = {
    enable = true;
  };

  home.packages = with pkgs; [
    jq
    xwayland-satellite
    git
    github-cli
    uv

    python3    
    tor-browser    
    helix
    yazi
    firefox
    wezterm
    godot
    blender
    antigravity-ide
    dbeaver-bin
    onlyoffice-desktopeditors
    krita
    unityhub
    android-studio
      
    #agnet
    claude-code
    codex
    opencode
  
    #program language
    nodejs
    libreoffice
  ];
}
