# A cool pastel theme for Nushell
export def "pastel-theme" [] {
    {
        # UI Elements
        separator: "#808080",
        leading_trailing_space_bg: "#B0B0B0",
        header: "#FFB347",      # Pastel Orange
        date: "#77DD77",        # Pastel Green
        filesize: "#AEC6CF",    # Pastel Blue
        row_index: "#C3B1E1",   # Pastel Purple
        hints: "#E0E0E0",

        # Syntax Highlighting Shapes
        shape_string: "#77DD77",            # Pastel Green
        shape_string_interpolation: "#AEC6CF", # Pastel Blue
        shape_int: "#AEC6CF",               # Pastel Blue
        shape_float: "#AEC6CF",             # Pastel Blue
        shape_bool: "#C3B1E1",              # Pastel Purple
        shape_date: "#FFB347",              # Pastel Orange
        shape_binary: "#C3B1E1",            # Pastel Purple
        shape_operator: "#FFD1DC",          # Pastel Pink
        shape_variable: "#FDFD96",          # Pastel Yellow
        shape_flag: "#C3B1E1",              # Pastel Purple
        shape_env_var: "#FDFD96",           # Pastel Yellow
        shape_glob_pattern: "#AEC6CF",      # Pastel Blue
        shape_external: "#77DD77",          # Pastel Green
        shape_external_arg: "#77DD77",      # Pastel Green
        shape_keyword: "#FFD1DC",           # Pastel Pink
        shape_garbage: "#FFFFFF",

        # Highlighting for values
        primitive_nothing: "#C3B1E1",       # Pastel Purple
        primitive_int: "#AEC6CF",           # Pastel Blue
        primitive_float: "#AEC6CF",         # Pastel Blue
        primitive_string: "#77DD77",        # Pastel Green
        primitive_binary: "#C3B1E1",        # Pastel Purple
        primitive_date: "#FFB347",          # Pastel Orange
        primitive_boolean: "#C3B1E1",       # Pastel Purple

        # Prompt Colors
        prompt_path: "#AEC6CF",             # Pastel Blue
        prompt_git_repo_path: "#77DD77",      # Pastel Green
        prompt_indicator: "#C3B1E1",        # Pastel Purple
        prompt_indicator_vi_insert: "#C3B1E1", # Pastel Purple
        prompt_indicator_vi_normal: "#FDFD96", # Pastel Yellow
        prompt_multiline_indicator: "#808080",
    }
}
