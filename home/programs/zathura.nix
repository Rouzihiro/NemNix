# Zathura is a PDF viewer
{
  programs.zathura = {
    enable = true;

    options = {
      adjust-open = "width";
      statusbar-basename = true;
      render-loading = false;
      scroll-step = 120;
    };
  };
}
