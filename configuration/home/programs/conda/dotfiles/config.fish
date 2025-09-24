if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx PATH ~/.cargo/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/brokenshine/.conda/bin/conda
    eval /home/brokenshine/.conda/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/brokenshine/.conda/etc/fish/conf.d/conda.fish"
        . "/home/brokenshine/.conda/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/brokenshine/.conda/bin" $PATH
    end
end
# <<< conda initialize <<<

