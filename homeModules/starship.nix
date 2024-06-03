{ config, lib, pkgs, ... }: {

  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = true;
    format = ''
      [░▒▓](#a3aed2)[  ](bg:#a3aed2 fg:#090c0c)[](bg:#769ff0 fg:#a3aed2)$directory[](fg:#769ff0 bg:#394260)$git_branch$git_commit$git_state$git_status[](fg:#394260 bg:#212736)$rust$golang$php[](fg:#212736 bg:#1d2230)$time[ ](fg:#1d2230)
      $cmd_duration$character'';
    #      "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
    shlvl = {
      disabled = false;
      symbol = "▶";
      style = "bright-red bold";
    };
    character = {
      format = "$symbol";
      success_symbol = "[▶](bold green)";
      error_symbol = "[✗](bold red)";
      disabled = false;
    };
    # NixOS     Lock 󰌾 Chip 󰍛 Linux 
    cmd_duration = {
      min_time = 3000;
      format =
        "[░▒▓](#a3aed2)[ 🕙 $duration](bg:#a3aed2 fg:#090c0c)[](fg:#a3aed2 bg:#090c0c)";
    };
    time = {
      disabled = false;
      time_format = "%R"; # Hour:Minute Format
      style = "bg:#1d2230";
      format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
    };
    directory = {
      truncation_length = 5;
      style = "fg:#e3e5e5 bg:#769ff0";
      format = "[ $path ]($style)";
    };
    username = {
      style_user = "bright-white bold";
      style_root = "bright-red bold";
    };
    git_branch = {
      symbol = ":";
      style = "bg:#394260";
      format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
      #[$symbol$branch(:$remote_branch) ]($style)";
      # ignore_branches = [ "master" "main" ];
    };
    git_metrics = {
      added_style = "bold green";
      deleted_style = "bold red";
      only_nonzero_diffs = true;
      format = "([+$added]($added_style) )([-$deleted]($deleted_style) )";
      disabled = true;
      ignore_submodules = false;
    };
    #    git_status = { format = "([$all_status$ahead_behind]($style) )"; };
    git_status = {
      format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
      #([$all_status$ahead_behind]($style) )";
      style = "bg:#394260";
      stashed = "$";
      ahead = "⇡";
      behind = "⇣";
      up_to_date = "";
      diverged = "⇕";
      conflicted = "=";
      deleted = "✘";
      renamed = "»";
      modified = "[!](fg:bold red bg:#394260)";
      staged = "+";
      untracked = "?";
      typechanged = "";
      ignore_submodules = false;
      disabled = false;
    };
    rust = {
      symbol = "";
      style = "bg:#212736";
      format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
    };
    golang = {
      symbol = "";
      style = "bg:#212736";
      format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
    };
    php = {
      symbol = "";
      style = "bg:#212736";
      format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
    };
  };
}
