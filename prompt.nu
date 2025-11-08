# A cool, minimal prompt for Nushell
export def "minimal-prompt" [] {
    # Get the theme colors from the environment
    let theme = $env.config.color_config

    # Get the current path, replacing the home directory with ~ for brevity
    let path = $env.PWD | str replace $"($env.HOME)" "~"

    # Check if we are in a git repo
    let git_repo_root = (^git rev-parse --show-toplevel e> /dev/null | str trim)

    let prompt_string = if ($git_repo_root | is-empty) {
        # Not in a git repo, just show the path
        [
            (ansi ($theme | get prompt_path)),
            $path,
            (ansi reset)
        ] | str join
    } else {
        # In a git repo, color the path differently
        let repo_path = ($path | str replace $git_repo_root "")
        let base_path = ($path | str replace $repo_path "")

        [
            (ansi ($theme | get prompt_path)),
            $base_path,
            (ansi ($theme | get prompt_git_repo_path)),
            $repo_path,
            (ansi reset)
        ] | str join
    }

    $"($prompt_string) "
}
