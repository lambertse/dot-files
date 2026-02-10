alias config_edit="nvim /etc/nixos/configuration.nix"
alias pkgs_edit="nvim /etc/nixos/pkgs-configuration.nix"
alias config_rebuild="sudo nixos-rebuild switch"

# CD source folder
alias cdsource="cd ~/src/"
alias icat="kitten icat"

# Sync nixos config with dot_files  repo
alias sync_config="cp -rf ~/.config/* ~/src/lambert-nixos/dot_files/ && cp -rf /etc/nixos/* ~/src/lambert-nixos/nixos/ && rm -rf ~/src/lambert-nixos/dot_files/gh"
