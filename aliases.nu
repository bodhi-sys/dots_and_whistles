# Custom Aliases and Functions

# Alias for the Helix editor
alias hx = helix

# A safer `rm` function that uses `rip` to move small files to the trash,
# immediately deletes empty directories and symlinks, and asks for
# confirmation before deleting large files or non-empty directories.
export def rm [
    --force (-f): bool, # Bypass confirmation prompts
    ...paths: path
] {
    # Define the size threshold for small files (10 MB)
    let small_file_threshold = 10 * 1024 * 1024

    # Iterate over each path provided
    for path in $paths {
        if not ($path | path exists) {
            error make { msg: $"File or directory not found: ($path)" }
            continue
        }

        let file_type = ($path | path type)

        if $file_type == 'file' {
            let file_size = (ls $path | get size)
            if $file_size < $small_file_threshold {
                # Move small files to the trash using rip
                ^rip $path
                print $"Moved to trash: ($path)"
            } else {
                # Ask for confirmation for large files
                let answer = if $force { 'y' } else { (input $"Are you sure you want to permanently delete large file: ($path)? (y/n)") }
                if $answer == 'y' {
                    ^rm -f $path
                    print $"Permanently deleted: ($path)"
                } else {
                    print $"Deletion cancelled: ($path)"
                }
            }
        } else if $file_type == 'dir' {
            let is_empty = ((ls $path | length) == 0)
            if $is_empty {
                # Immediately delete empty directories
                ^rm -rf $path
                print $"Deleted empty directory: ($path)"
            } else {
                # Ask for confirmation for non-empty directories
                let answer = if $force { 'y' } else { (input $"Are you sure you want to permanently delete non-empty directory: ($path)? (y/n)") }
                if $answer == 'y' {
                    ^rm -rf $path
                    print $"Permanently deleted: ($path)"
                } else {
                    print $"Deletion cancelled: ($path)"
                }
            }
        } else if $file_type == 'symlink' {
            # Immediately delete symlinks
            ^rm -f $path
            print $"Deleted symlink: ($path)"
        } else {
            # Fallback for other file types
            let answer = if $force { 'y' } else { (input $"Are you sure you want to permanently delete ($file_type): ($path)? (y/n)") }
            if $answer == 'y' {
                ^rm -rf $path
                print $"Permanently deleted: ($path)"
            } else {
                print $"Deletion cancelled: ($path)"
            }
        }
    }
}
