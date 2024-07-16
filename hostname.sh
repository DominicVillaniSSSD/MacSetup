#!/bin/bash

set_hostname() {
    echo "example Dominic’s MacBook Pro #tagnumber"

    read -p "Enter the new hostname: " new_hostname

    # Check if the new hostname is provided
    if [[ -z "$new_hostname" ]]; then
        echo "Error: Hostname cannot be empty."
        return 1
    fi

    # Replace invalid characters in the hostname (if necessary)
     new_hostname_clean=$(echo "$new_hostname" | tr -d "[:punct:] [:space:]")

    echo "Setting hostname to: $new_hostname_clean"

    # Set the hostname using scutil
    sudo scutil --set HostName "$new_hostname_clean"
    sudo scutil --set LocalHostName "$new_hostname_clean"
    sudo scutil --set ComputerName "$new_hostname"

    echo "Hostname set to: $new_hostname_clean"
}

# Execute the function
set_hostname