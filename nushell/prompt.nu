# A cool, minimal prompt for Nushell
export def "minimal-prompt" [] {
    # Get the theme colors from the environment
    let theme = $env.config.color_config

    # Get the full current path
    let current_path = $env.PWD

    # Check if we are in a git repo
    let git_repo_root = (^git rev-parse --show-toplevel e> /dev/null | str trim)

    let prompt_string = if ($git_repo_root | is-empty) {
        # Not in a git repo, just show the path, shortened with ~
        let path_display = ($current_path | str replace $env.HOME "~")
        [
            (ansi ($theme | get prompt_path)),
            $path_display,
            (ansi reset)
        ] | str join
    } else {
        # In a git repo, color the path differently.
        # Get the path relative to the repo root.
        let repo_subpath = ($current_path | str substring ($git_repo_root | str length)..)

        # Shorten the repo root path for display (e.g., /home/user -> ~)
        let base_path_display = ($git_repo_root | str replace $env.HOME "~")

        [
            (ansi ($theme | get prompt_path)),
            $base_path_display,
            (ansi ($theme | get prompt_git_repo_path)),
            $repo_subpath,
            (ansi reset)
        ] | str join
    }

    $"($prompt_string) "
}
