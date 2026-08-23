{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixfiles";
    };

    historyControl = [
      "ignoredups"
      "ignorespace"
    ];

    historySize = 10000;
    historyFileSize = 20000;

    initExtra = ''
      PS1='\[\e[38;5;33m\][\[\e[38;5;34m\]\t\[\e[0m\] \[\e[38;5;196m\]\u\[\e[38;5;33m\]@\[\e[38;5;196m\]\h\[\e[0m\] \[\e[38;5;46m\]\w\[\e[38;5;33m\]]\[\e[0m\] '
    '';
  };
}
