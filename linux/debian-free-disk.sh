#!/bin/bash -e
# cleanup orphaned apt dependencies
sudo apt-get auto-remove
sudo apt autoclean
sudo apt clean
# Retrieve and display kernel information
uname -a
IN_USE=$(uname -r)
echo "Your in-use kernel is $IN_USE"

# List old kernels to be removed
OLD_KERNELS=$(dpkg --get-selections |
    grep -vE "linux-headers-generic|linux-image-generic" |
    grep -v "${IN_USE%%-generic}" |
    grep -Ei 'linux-image|linux-headers|linux-modules' |
    awk '{print $1}')

echo "Old kernels to be removed:"
if [ -n "$OLD_KERNELS" ]; then
    echo "$OLD_KERNELS"
else
    echo "No old modules found"
fi
# List old modules to be removed
OLD_MODULES=$(ls /lib/modules 2>/dev/null | while read module; do
    if [[ "$module" != "${IN_USE%%-generic}"* && "$module" != "${IN_USE}" ]]; then
        echo "$module"
    fi
done)

echo "Old modules to be removed:"
if [ -n "$OLD_MODULES" ]; then
    echo "$OLD_MODULES"
else
    echo "No old modules found"
fi

# Perform removal if "delete" parameter was passed approving the deletion
if [ "$1" == "delete" ]; then
    # Remove old kernels
    sudo apt-get purge $OLD_KERNELS
    # Remove old modules
    for module in $OLD_MODULES; do
        rm -rf /lib/modules/$module/
    done
else
    echo "If all looks good, run it again with: sudo $0 delete"
fi

echo "Total space occupied by /var/log: "
sudo du -sh /var/log

# Check if the "delete" parameter was passed approving the deletion
if [ "$1" == "delete" ]; then
    exec_mode=true
    echo "Running in deletion mode..."
else
    exec_mode=false
    echo "Dry run: to actually delete the files, run the script with the 'delete' parameter."
fi

# Find and display the space occupied by files older than a week
logs=$(sudo find /var/log -type f -mtime +7)
total_size=0

echo "Log files found:"
for file in $logs; do
    size=$(sudo du -k "$file" | cut -f1)
    total_size=$((total_size + size))
    echo "$file - $(du -h "$file" | cut -f1)"
    # If in exec mode, delete the file
    if [ "$exec_mode" = true ]; then
        sudo rm -f "$file"
    fi
done

# Convert total_size from KB to MB
total_size_mb=$(echo $total_size | awk '{printf "%.2f MB\n", $1/1024}')

if [ "$exec_mode" = true ]; then
    echo "Total space recovered: $total_size_mb"
else
    echo "Total space recoverable: $total_size_mb"
    echo "To actually delete the files, run the script with the 'delete' parameter."
fi