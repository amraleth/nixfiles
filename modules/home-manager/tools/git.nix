{ ... }:

{
  programs.git = {
    enable = true;

    signing = {
      key = "7582B6CD892EA6F2";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "Patrick Vollandt";
        email = "patrick@vollandt.dev";
      };

      init = {
        defaultBranch = "stable";
      };

      tag = {
        gpgSign = true;
      };

      core = {
        editor = "vim";
        quotepath = false;
      };

      color = {
        ui = "auto";
      };
    };
  };
}
