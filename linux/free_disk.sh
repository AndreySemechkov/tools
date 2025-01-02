#!/bin/bash -e
# cleanup nsed from apt
sudo apt-get auto-remove
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
echo "$OLD_KERNELS"

# List old modules to be removed
OLD_MODULES=$(ls /lib/modules |
    grep -v "${IN_USE%%-generic}" |
    grep -v "${IN_USE}")

echo "Old modules to be removed:"
echo "$OLD_MODULES"

# Perform removal if "exec" argument is provided
if [ "$1" == "exec" ]; then
    # Remove old kernels
    apt-get purge $OLD_KERNELS
    # Remove old modules
    for module in $OLD_MODULES; do
        rm -rf /lib/modules/$module/
    done
else
    echo "If all looks good, run it again with: sudo $0 exec"
fi