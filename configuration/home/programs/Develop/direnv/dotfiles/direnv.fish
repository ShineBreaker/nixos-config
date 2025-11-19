# ──────────────────────────────────────────────────────────────
# direnv 进入/退出 nix 开发环境时自动改提示符
# ──────────────────────────────────────────────────────

# 你可以自定义这几个样式
set -g nix_shell_prompt      " ❄"      # 进入 nix shell 时的前缀
set -g nix_shell_color       brgreen    # 颜色（brred, brblue, bryellow, brgreen 等）
set -g normal_prompt_color   normal     # 恢复默认颜色

# 记录原始的 PROMPT（只记录一次）
if not set -q __original_fish_prompt
    set -g __original_fish_prompt (string join \n (functions fish_prompt))
end

# 当 direnv 加载/卸载环境变量时会设置 $DIRENV_DIR
function __update_prompt --on-variable DIRENV_DIR
    if test -n "$DIRENV_DIR"
        # 进入了 direnv 环境（通常就是 nix develop / use flake）
        function fish_prompt
            set_color $nix_shell_color
            echo -n "$nix_shell_prompt "
            set_color normal
            # 调用你原来的提示符（starship 也兼容）
            eval $__original_fish_prompt
        end
    else
        # 退出环境，恢复原来的提示符
        functions -e fish_prompt  # 删除我们临时覆盖的
        if set -q __original_fish_prompt
            functions -c fish_prompt __original_fish_prompt_tmp  # 临时恢复
            funcsave fish_prompt  # 永久保存（可选）
        end
    end
end

# 首次进入 shell 时也触发一次（防止漏掉已经加载的环境）
__update_prompt
