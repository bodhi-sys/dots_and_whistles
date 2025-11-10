# A bright pastel theme for Nushell
export def "pastel-theme-bright" [] {
    {
        # UI Elements
        separator: "#9E9E9E",
        leading_trailing_space_bg: "#BDBDBD",
        header: "#FF8A65",      # Bright Pastel Orange
        date: "#4DB6AC",        # Bright Teal
        filesize: "#64B5F6",    # Bright Sky Blue
        row_index: "#BA68C8",   # Bright Lavender
        hints: "#E0E0E0",

        # Syntax Highlighting Shapes
        shape_string: "#81C784",            # Bright Pastel Green
        shape_string_interpolation: "#4FC3F7", # Bright Cyan
        shape_int: "#64B5F6",               # Bright Sky Blue
        shape_float: "#64B5F6",             # Bright Sky Blue
        shape_bool: "#BA68C8",              # Bright Lavender
        shape_date: "#FF8A65",              # Bright Pastel Orange
        shape_binary: "#BA68C8",            # Bright Lavender
        shape_operator: "#F06292",          # Bright Pink
        shape_variable: "#FFD54F",          # Bright Yellow
        shape_flag: "#BA68C8",              # Bright Lavender
        shape_env_var: "#FFD54F",           # Bright Yellow
        shape_glob_pattern: "#4FC3F7",      # Bright Cyan
        shape_external: "#81C784",          # Bright Pastel Green
        shape_external_arg: "#81C784",      # Bright Pastel Green
        shape_keyword: "#F06292",           # Bright Pink
        shape_garbage: "#FFFFFF",

        # Highlighting for values
        primitive_nothing: "#BA68C8",       # Bright Lavender
        primitive_int: "#64B5F6",           # Bright Sky Blue
        primitive_float: "#64B5F6",         # Bright Sky Blue
        primitive_string: "#81C784",        # Bright Pastel Green
        primitive_binary: "#BA68C8",        # Bright Lavender
        primitive_date: "#FF8A65",          # Bright Pastel Orange
        primitive_boolean: "#BA68C8",       # Bright Lavender

        # Prompt Colors
        prompt_path: "#4FC3F7",             # Bright Cyan
        prompt_git_repo_path: "#81C784",      # Bright Pastel Green
        prompt_indicator: "#BA68C8",        # Bright Lavender
        prompt_indicator_vi_insert: "#BA68C8", # Bright Lavender
        prompt_indicator_vi_normal: "#FFD54F", # Bright Yellow
        prompt_multiline_indicator: "#9E9E9E",
    }
}
