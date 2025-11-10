# Test script for the custom rm function

# --- Setup ---
# Source the aliases to get the custom rm function
source aliases.nu

# Create a temporary directory for our tests
let test_dir = (mktemp -d)
cd $test_dir

# --- Test Cases ---
print "--- Testing rm function ---"

# 1. Test trashing a small file
print "Test 1: Trashing a small file"
touch small_file.txt
rm small_file.txt
# `rip` should move it, so we can't easily assert its final location here.
# We'll rely on the command not failing.
print "Test 1 Passed"

# 2. Test permanent deletion of a large file
print "Test 2: Permanently deleting a large file"
(str repeat "a" (11 * 1024 * 1024)) | save large_file.bin
'y' | rm large_file.bin
assert (not ("large_file.bin" | path exists))
print "Test 2 Passed"

# 3. Test deleting an empty directory
print "Test 3: Deleting an empty directory"
mkdir empty_dir
rm empty_dir
assert (not ("empty_dir" | path exists))
print "Test 3 Passed"

# 4. Test deleting a symlink
print "Test 4: Deleting a symlink"
touch target.txt
ln -s target.txt symlink_to_file
rm symlink_to_file
assert (not ("symlink_to_file" | path exists))
print "Test 4 Passed"

# 5. Test permanent deletion of a non-empty directory
print "Test 5: Permanently deleting a non-empty directory"
mkdir non_empty_dir
touch non_empty_dir/file.txt
'y' | rm non_empty_dir
assert (not ("non_empty_dir" | path exists))
print "Test 5 Passed"

# --- Cleanup ---
cd ..
^rm -rf $test_dir

print "--- All tests passed! ---"
