{ pkgs, ... }:
let
  main = "age15yhh5ede5z0umex6h8h9cyz5wxccpsvwq458zcqqmhzc055fv9qs5n5r76";
in
{
  environment.systemPackages = with pkgs; [
    age
    agenix-cli
  ];
}
