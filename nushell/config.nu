# Main Nushell configuration file
# This file sources all other configuration files from the same directory.

$env.config.keybindings ++= [{
    name: fzf_fre
    modifier: alt
    keycode: char_x
    mode: [emacs, vi_insert]
    event: {
        send: executehostcommand,
        cmd: "commandline edit --insert (fre --sorted | fzf | str trim)"
    }
}]

$env.config.hooks.env_change = ($env.config.hooks.env_change? | default {} | upsert PWD [{|| fre --add (pwd)}])

source theme.nu
source theme_bright.nu

# Set one of the themes below as active
$env.config.color_config = (pastel-theme-bright)
# $env.config.color_config = (pastel-theme)

source prompt.nu
let theme = $env.config.color_config
$env.PROMPT_COMMAND = {|| minimal-prompt }
$env.PROMPT_INDICATOR = $"(ansi ($theme | get prompt_indicator))〉 (ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi ($theme | get prompt_indicator_vi_insert))〉 (ansi reset)"
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi ($theme | get prompt_indicator_vi_normal))〉 (ansi reset)"
$env.PROMPT_MULTILINE_INDICATOR = $"(ansi ($theme | get prompt_multiline_indicator))〉〉 (ansi reset)"

source aliases.nu

# Carapace completion
if (which carapace | length) > 0 {
    source (carapace _carapace nushell)
}
