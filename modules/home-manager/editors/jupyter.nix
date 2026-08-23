{ pkgs, ... }:

{
  home.packages = [
    (pkgs.python3.withPackages (
      ps: with ps; [
        jupyterlab
        ipykernel

        numpy
        pandas
        scipy
        matplotlib
      ]
    ))
  ];
}
