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
$env.config.color_config = (pastel-theme)

source prompt.nu
let theme = $env.config.color_config
$env.PROMPT_COMMAND = {|| minimal-prompt }
$env.PROMPT_INDICATOR = $"(ansi ($theme | get prompt_indicator))〉 (ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi ($theme | get prompt_indicator_vi_insert))〉 (ansi reset)"
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi ($theme | get prompt_indicator_vi_normal))〉 (ansi reset)"
$env.PROMPT_MULTILINE_INDICATOR = $"(ansi ($theme | get prompt_multiline_indicator))〉〉 (ansi reset)"
