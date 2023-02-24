#!/bin/bash

# This script first checks for non-ASCII characters using the regular expression '[^\x00-\x7F]', which matches any character that is not in 
# the ASCII range (i.e. outside the range of 0x00 to 0x7F). If the grep command returns any matches, the script prints a message indicating 
#that the file contains non-ASCII characters.

# The script then checks for non-printable characters using the regular expression '[^[:print:]]', which matches any character that is 
# not a printable character. If the grep command returns any matches, the script prints a message indicating that the file contains 
# non-printable characters.

# You can run this script by saving it as a file (e.g. hash_check.sh), making it executable with chmod +x hash_check.sh, 
# and then running it with ./hash_check.sh. Remember to replace "hash_dump_file.txt" with the actual name of your hash dump file.

# I like to use this with Terraform files when there is a problem with a character in the file

# Replace "hash_dump_file.txt" with the name of your hash dump file
if grep -P '[^\x00-\x7F]' ~/projects/IaC/proxmox/proxmox-vanilla/full-clone.tf; then
  echo "Hash dump file contains non-ASCII characters."
fi

if grep -P '[^[:print:]]' ~/projects/IaC/proxmox/proxmox-vanilla/full-clone.tf; then
  echo "Hash dump file contains non-printable characters."
fi