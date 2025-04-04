{ pkgs, ... }:
{
  home.packages = with pkgs; [ libnotify ];

  services.dunst = {
    enable = true;

    settings = {
      global = {
        follow = "mouse";

        width = "(0,600)";
        height = "(0,400)";

        origin = "top-center";
        offset = "(0,2)";
      };

      fullscreen_delay_everything = {
        fullscreen = "delay";
      };
    };
  };
}
