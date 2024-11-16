{ pkgs, inputs, ... }:
{
  # ------------------------------------------------
  # Needed Packages
  # ------------------------------------------------

  home.packages = with pkgs; [

    hyprshot
    hyprshade
    hyprpicker

    inputs.hyprsunset.packages."${pkgs.system}".hyprsunset
    inputs.hyprsysteminfo.packages."${pkgs.system}".hyprsysteminfo
    inputs.hyprpolkitagent.packages."${pkgs.system}".hyprpolkitagent

    xdg-desktop-portal-wlr
    xdg-desktop-portal-hyprland

    wev
    wlr-randr
    wdisplays

    gpu-screen-recorder-gtk

    playerctl
    brightnessctl
  ];

  # ------------------------------------------------
  # Hyprland Config
  # ------------------------------------------------

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = false;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    # ------------------------------------------------
    # Configuration
    # ------------------------------------------------

    settings = {

      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";
      "$Alt_L" = "ALT";

      # App
      "$terminal" = "footclient";
      "$browser" = "floorp";
      "$launcher" = "wofi -S drun -I";
      "$file-manager" = "nautilus";
      "$Tfile-manager" = "$terminal -e yazi";
      "$audio-manager" = "com.saivert.pwvucontrol";
      "$password-manager" = "org.keepassxc.KeePassXC";
      "$bluetooth-manager" = "io.github.kaii_lb.Overskride";

      # ------------------------------------------------
      # Envirronement variables
      # ------------------------------------------------

      env = [
        "TERMINAL                            , $terminal "
        "XDG_SESSION_TYPE                    ,  wayland  "
        "XDG_CURRENT_DESKTOP                 ,  Hyprland "
        "XDG_SESSION_DESKTOP                 ,  Hyprland "

        "DISABLE_QT5_COMPAT                  , 1         "
        "QT_QPA_PLATFORM                     ,  wayland  "
        "QT_AUTO_SCREEN_SCALE_FACTOR         , 1         "
        "QT_WAYLAND_DISABLE_WINDOWDECORATION , 1         "

        "NIXOS_OZONE_WL                      , 1         "
        "ELECTRON_OZONE_PLATFORM_HINT        , auto      "

        "GTK_WAYLAND_DISABLE_WINDOWDECORATION, 1         "
      ];

      # ------------------------------------------------
      # Startup
      # ------------------------------------------------

      exec-once = [
        "waybar"
        "foot --server"
        "systemctl --user start hyprpolkitagent"
      ];

      # ------------------------------------------------
      # Monitors
      # ------------------------------------------------

      monitor = [
        "eDP-1                      , 2880x1800@120 , auto       , 1.5"
        "desc:BOE Display 0x00000144, 2560x1440@144 , auto-right , 1.25"
      ];

      # ------------------------------------------------
      # Window Rules
      # ------------------------------------------------

      windowrule = [
        "float       , ^($terminal)$"
        "size 45% 45%, ^($terminal)$"

        "float       , ^($password-manager)$"
        "size 50% 40%, ^($password-manager)$"

        "float       , ^($bluetooth-manager)$"
        "size 50% 60%, ^($bluetooth-manager)$"

        "float       , ^($audio-manager)$"
        "size 50% 30%, ^($audio-manager)$"

        "noblur      , class:^(steam)"
        "forcergbx   , class:^(steam)"
      ];

      windowrulev2 = [
        "workspace 1,       class:($browser)"
        "workspace 2,       class:(org.pwmt.zathura)"
        "workspace 3,       class:(codium)"
        "workspace 4,       class:(vesktop)"
        "workspace 5,       class:(FreeTube)"
        "workspace special, class:(spotify)"
      ];

      # ------------------------------------------------
      # Workspace Rules
      # ------------------------------------------------

      workspace = [
        "1,  monitor:eDP-1, default:true"
        "2,  monitor:eDP-1"
        "3,  monitor:eDP-1"
        "4,  monitor:eDP-1"
        "5,  monitor:eDP-1"

        "6,  monitor:desc:BOE Display 0x00000144, default:true"
        "7,  monitor:desc:BOE Display 0x00000144"
        "8,  monitor:desc:BOE Display 0x00000144"
        "9,  monitor:desc:BOE Display 0x00000144"
        "10, monitor:desc:BOE Display 0x00000144"
      ];

      # ------------------------------------------------
      # Keybidings
      # ------------------------------------------------

      bind = [
        # Apps
        "ALT, code:10, exec, $browser"
        "ALT, code:11, exec, $file-manager"
        "ALT, code:12, exec, $Tfile-manager"

        # Window Focus
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        # System
        "SUPER, Q, killactive"
        "SUPER, F, fullscreen"
        "SUPER, T, togglefloating"

        "SUPER, R        , exec , $launcher"
        "SUPER, RETURN   , exec , $terminal"
        "SUPER, Backspace, exec , $terminal -F"

        # Screenshot
        "SUPER                 , S , exec , hyprshot -m region --clipboard-only"
        "CONTROL&SUPER         , S , exec , hyprshot -m region "
        "CONTROL&SUPER&SHIFT_L , S , exec , hyprshot -m output"

        # Switch workspaces with mainMod + [0-9]
        "SUPER, code:10, workspace, 6"
        "SUPER, code:10, workspace, 1"

        "SUPER, code:11, workspace, 7"
        "SUPER, code:11, workspace, 2"

        "SUPER, code:12, workspace, 8"
        "SUPER, code:12, workspace, 3"

        "SUPER, code:13, workspace, 9"
        "SUPER, code:13, workspace, 4"

        "SUPER, code:14, workspace, 10"
        "SUPER, code:14, workspace, 5"

        "SUPER, grave, exec, hyprctl dispatch togglespecialworkspace"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "SUPER SHIFT, code:10, movetoworkspace,  1"
        "SUPER SHIFT, code:11, movetoworkspace,  2"
        "SUPER SHIFT, code:12, movetoworkspace,  3"
        "SUPER SHIFT, code:13, movetoworkspace,  4"
        "SUPER SHIFT, code:14, movetoworkspace,  5"
        "SUPER SHIFT, code:15, movetoworkspace,  6"
        "SUPER SHIFT, code:16, movetoworkspace,  7"
        "SUPER SHIFT, code:17, movetoworkspace,  8"
        "SUPER SHIFT, code:18, movetoworkspace,  9"
        "SUPER SHIFT, code:19, movetoworkspace, 10"
        "SUPER SHIFT, grave,  movetoworkspace, special"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioMute,     exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", switch:Lid Switch, exec, loginctl lock-session && systemctl suspend"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"

        ", XF86AudioPlay , exec , playerctl play-pause"
        ", XF86AudioStop , exec , playerctl pause"
        ", XF86AudioPrev , exec , playerctl previous"
        ", XF86AudioNext , exec , playerctl next"

        ", XF86MonBrightnessUp,   exec, brightnessctl -q s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"
      ];

      # ------------------------------------------------
      # Sections
      # ------------------------------------------------

      xwayland = { enabled = false; };
      opengl = { force_introspection = 1; };

      animations = { enabled = false; };
      decoration = { shadow = { enabled = false; }; blur = { enabled = false; }; };

      general = {
        gaps_in = 4;
        gaps_out = 0;
        border_size = 2;
        "col.active_border" = "rgb(F5A97F) rgb(ED8796) rgb(C6A0F6) rgb(8AADF4) rgb(A6DA95) rgb(EED49F)";

        layout = "dwindle";
      };

      dwindle = { pseudotile = true; };

      misc = {
        vfr = true;
        vrr = 0;
        render_ahead_safezone = 0;
        focus_on_activate = true;

        disable_autoreload = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";

        follow_mouse = 1;
        accel_profile = "flat";
        sensitivity = 0.4;
        repeat_delay = 300;
        repeat_rate = 50;

        touchpad = {
          scroll_factor = 0.5;
          natural_scroll = true;
        };
      };
    };
  };

  #################################
  # Hyprpaper
  #################################
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = [ "~/Dotfiles/home/wallpapers/nixppuccin.png" ];
      wallpaper = [ ",~/Dotfiles/home/wallpapers/nixppuccin.png" ];
    };
  };

  #################################
  # Hypridle
  #################################
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        ignore_dbus_inhibit = true;
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 60;
          on-timeout = "brightnessctl -sd asus::kbd_backlight set 0";
          on-resume = "brightnessctl -rd asus::kbd_backlight";
        }

        {
          timeout = 80;
          on-timeout = "brightnessctl -s set 0";
          on-resume = "brightnessctl -r";
        }

        {
          timeout = 100;
          on-timeout = "loginctl lock-session";
        }

        {
          timeout = 100;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          timeout = 150;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  #################################
  # Hyprlock
  #################################
  programs.hyprlock = {
    enable = false;

    settings = {

      general = {
        grace = 5;
        no_fade_in = true;
        no_fade_out = true;
        disable_loading_bar = false;
      };

      # background = {
      #   monitor = "";
      #   path = "~/Dotfiles/home/wallpapers/lock.jpg";
      # };

      # input-field = [
      #   {
      #     monitor = "";
      #     size = "200 , 50";
      #     outline_thickness = 7;

      #     dots_size = 0.2;
      #     dots_spacing = 0.2;
      #     dots_center = true;

      #     fade_on_empty = true;
      #     fade_timeout = "1000";

      #     position = "0, -20";
      #     halign = "center";
      #     valign = "center";
      #   }
      # ];
    };
  };
}
